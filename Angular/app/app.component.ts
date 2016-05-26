import { Component } from '@angular/core';
import { HTTP_PROVIDERS } from '@angular/http';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';
import { HomeComponent} from './home/home.component';
import 'rxjs/Rx';
import { ContactComponent } from './contacts/contact.component'
import { ContactService } from './contacts/contact.service'
import { FinancialComponent} from './financial/components/financial.component';
import {AccountService} from "./financial/services/account.service";

@Component({
    selector: 'nu-app',
    templateUrl: `app/app.component.html`,
    styleUrls: ['app/app.component.css'],
    directives: [ROUTER_DIRECTIVES],
    providers: [ContactService, HTTP_PROVIDERS, ROUTER_PROVIDERS, AccountService]
})
@Routes([
    { path: '/', component: HomeComponent },
    { path: '/home', component: HomeComponent },
    { path: '/contact', component: ContactComponent }
    {path: '/account', component: FinancialComponent}
])
export class AppComponent {
    pageTitle: string = 'Neumont University';
    logoUrl: string = 'assets/images/logo.png';
}
