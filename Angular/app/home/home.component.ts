import { Component } from '@angular/core';
import { TransactionListComponent } from "../financial/components/transaction-list";

@Component({
    selector: 'nu-home',
    directives: [TransactionListComponent],
    templateUrl: `app/home/home.component.html`
})
export class HomeComponent {
    pageTitle: string = 'Dashboard';
    logoUrl: string = 'https://media4.giphy.com/media/5D6kjdPsBRYUo/200_s.gif';
}
