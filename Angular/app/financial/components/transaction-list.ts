import {Component} from "@angular/core";

import {AccountService} from "../services/account.service";
import {TransactionComponent} from "./transaction";
import {ITransaction} from "../services/Transaction";
import {DateString} from "../../shared/pipes/customDatePipe";
import {CurrencyPipe} from "@angular/common";

@Component({
  selector: 'fin-transactionList',
  directives: [TransactionComponent],
    pipes: [DateString, CurrencyPipe],
    styleUrls:['./app/financial/components/transaction-list.css'],
  templateUrl: './app/financial/components/transaction-list.html'
})
export class TransactionListComponent {
    transactions: ITransaction[];
    errorMessage: string;
    constructor(public accountService:AccountService) { }

    ngOnInit():void {
        this.accountService.getTransactions()
            .subscribe(
                transactions => this.transactions = transactions,
                error => this.errorMessage = <any>error
            );
    }
}
