import {Component, Input } from "@angular/core";

import {AccountService} from "../services/account.service";
import {TransactionComponent} from "./transaction";
import {ITransaction} from "../services/Transaction";
import {DateString} from "../../shared/pipes/customDatePipe";
import {CurrencyPipe} from "@angular/common";

@Component({
    selector: 'fin-transactionList',
    directives: [TransactionComponent],
    pipes: [DateString, CurrencyPipe],
    templateUrl: './app/financial/components/transaction-list.html'
})
export class TransactionListComponent {
    transactions: ITransaction[];
    allTransactios: ITransaction[];
    errorMessage: string;
    constructor(public accountService: AccountService) { }
    @Input() itemsPerPage:number;
    numberOfPages = 0;
    currentPage = 0;
    onLeft(event: any){
        if(this.currentPage > 0){
            this.currentPage -= 1
            this.transactions = this.allTransactios.slice(this.currentPage * this.itemsPerPage,this.currentPage * this.itemsPerPage + this.itemsPerPage)
        }
    }
    onRight(event: any){
        if(this.currentPage < this.numberOfPages){
            this.currentPage += 1
            this.transactions = this.allTransactios.slice(this.currentPage * this.itemsPerPage,this.currentPage * this.itemsPerPage + this.itemsPerPage)
        }
    }
    ngOnInit(): void {
        this.accountService.getTransactions()
            .subscribe(
            transactions => {
                 this.numberOfPages = transactions.length / this.itemsPerPage;
                 this.transactions = transactions.slice(0,this.itemsPerPage);
                 this.allTransactios = transactions;
                },
            error => this.errorMessage = <any>error
            );
    }
}
