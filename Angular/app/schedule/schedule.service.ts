import { Injectable } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/catch';
import 'rxjs/add/observable/throw';

import { IScheduleHistory } from './schedule-history/schedule-history';
import { ICurrentSchedule } from './current-schedule/schedule-current';
import { IPlannedSchedule } from './planned-schedule/planned-schedule';

@Injectable()
export class ScheduleService{
	constructor(private _http: Http){}
	apiURL: string = 'http://localhost:8080/api';
	
	getStudentScheduleHistory(): Observable<IScheduleHistory[]>{
		return this._http.get(this.apiURL+'/studentScheduleHistory')
			.map((resp: Response) => <IScheduleHistory[]> resp.json().results)
//			.do(data=> console.log('studentScheduleHistory: ' + JSON.stringify(data) ))
			.catch(this.handleError);
	}
	getCurrentlyEnrolledStudentSchedule(): Observable<ICurrentSchedule[]>{
		return this._http.get(this.apiURL+'/currentlyEnrolledStudentSchedule')
			.map((resp: Response) => <ICurrentSchedule[]> resp.json().results)
//			.do(data=> console.log('currentlyEnrolledStudentSchedule: ' + JSON.stringify(data) ))
			.catch(this.handleError);
	}
    getCurrentlyPlannedStudentSchedule(): Observable<IPlannedSchedule[]>{
		return this._http.get(this.apiURL+'/currentlyPlannedStudentSchedule')
			.map((resp: Response) => <IPlannedSchedule[]> resp.json().results)
//			.do(data=> console.log('currentlyPlannedStudentSchedule: ' + JSON.stringify(data) ))
			.catch(this.handleError);
	}
	private handleError(error: Response) {
		console.error(error);
		return Observable.throw(error.json().error || 'Server error');
	}
}