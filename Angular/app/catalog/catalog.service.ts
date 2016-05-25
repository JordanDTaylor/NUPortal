import { Injectable } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/catch';
import 'rxjs/add/observable/throw';

@Injectable()
export class CatalogService{
	constructor(private _http: Http){}
	apiURL: string = 'http://localhost:8080/api';
	
	getAllCourses(): Observable<[]> {
		return this._http.get(this.apiURL+'/allCourses')
			.map((response: Response) => <[]> response.json().results)
//			.do(data => console.log('Courses: ' +  JSON.stringify(data)))
			.catch(this.handleError);
	}
	getCourse(id:int): Observable<any>{
		return this._http.get(this.apiURL+'/course?id='+id)
			.map((resp: Response) => <any> resp.json().results[0])
//			.do(data=> console.log('Course: ' + JSON.stringify(data) ))
			.catch(this.handleError);
	}
	getCoursePreReqs(code:string): Observable<any>{
		return this._http.get(this.apiURL+'/coursePreReqs?code='+code)
			.map((resp: Response) => <[]> resp.json().results)
			.do(data=> console.log('Pre-Reqs: ' + JSON.stringify(data)))
			.catch(this.handleError);
	}
	
	private handleError(error: Response) {
		console.error(error);
		return Observable.throw(error.json().error || 'Server error');
	}
}
