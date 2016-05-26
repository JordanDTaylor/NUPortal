import { Component } from '@angular/core';
import {TransactionListComponent} from "./transaction-list";

@Component({
    selector: 'nu-financial',
    directives: [TransactionListComponent],
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <fin-transactionList>loading tran...</fin-transactionList>
    </div>
     `
})

export class FinancialComponent {
    pageTitle: string = 'Your Account';
    
}
