import { Injectable } from '@angular/core';
import { Http, Response } from "@angular/http";
import { Observable } from 'rxjs/Observable';

import { IStudent } from './people/student';
import { IStaff } from './people/staff';

@Injectable()
export class ContactService{
    private _studentUrl = 'http://localhost:8080/api/allStudents';
    private _staffUrl = 'http://localhost:8080/api/allStaff';
    
    constructor(private _http: Http){}
    
    getStudents(): Observable<IStudent[]>{
        return this._http.get(this._studentUrl)
        .map((response: Response) => <IStudent[]> response.json().results)
        .do(data => console.log('All: ' + JSON.stringify(data)))
        .catch(this.handleError);
    }
    
    getStudent(id: number): Observable<IStudent>{
        return this.getStudents()
        .map((students: IStudent[]) => students.find(p => p.Id === id));
    }

    getAllStaff(): Observable<IStaff[]>{
        return this._http.get(this._staffUrl)
        .map((response: Response) => <IStaff[]> response.json().results)
        .do(data => console.log('All: ' + JSON.stringify(data)))
        .catch(this.handleError);
    }
    
    getStaff(id: number): Observable<IStaff>{
        return this.getAllStaff()
        .map((staff: IStaff[]) => staff.find(p => p.Id === id));
    }
        
    private handleError(error: Response){
        console.error(error);
        return Observable.throw(error.json().error || 'Server error');
    }
}