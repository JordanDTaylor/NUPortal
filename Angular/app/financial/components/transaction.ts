import {Component, Input} from "@angular/core";
import {DateString} from "../../shared/pipes/customDatePipe";
import {CurrencyPipe} from "@angular/common";

@Component({
    selector: 'fin-transaction',
    pipes: [DateString, CurrencyPipe],
    template:
    `
<tr>
    <td>{{tran.Date | dateString:'shortDate'}}</td>
    <td>{{tran.Description}}</td>
    <td>{{tran.Reference}}</td>
    <td>{{tran.Amount | currency: 'USD': true}}</td>
</tr>
    `
})
export class TransactionComponent {
    @Input() tran;
}
