import {Injectable} from "@angular/core";
import {Http, Response} from "@angular/http";
import {Observable} from "rxjs/Rx";

import {ITransaction} from "./Transaction";

@Injectable()
export class AccountService{
    private dataSource: string = '/app/financial/services/transaction_test_data.json';

    constructor(private _http:Http) {
    }


    getTransactions(): Observable<ITransaction[]>{
       return this._http.get(this.dataSource)
           .map((response:Response) => <ITransaction[]>response.json())
           .catch(this.handleError);
    }

    getTransactionsForStudent(id:number):Observable<ITransaction[]>{
        return this.getTransactions()
            .map(trans => trans.filter(t=>t.StudentId===id));
    }

    private handleError(error:Response) {
        console.error(error);
        return Observable.throw('Server error' || error.json().error);
    }
}
