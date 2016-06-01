import { Component } from '@angular/core';
import {TransactionListComponent} from "./transaction-list";

@Component({
    selector: 'nu-financial',
    directives: [TransactionListComponent],
    templateUrl: './app/financial/components/financial.component.html'
})

export class FinancialComponent {
    pageTitle: string = 'Your Account';
    
}
