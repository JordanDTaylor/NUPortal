import { Component } from '@angular/core';
import { HTTP_PROVIDERS } from '@angular/http';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';
import { HomeComponent} from './home/home.component';
import { FinancialComponent} from './financial/components/financial.component';
import {AccountService} from "./financial/services/account.service";

@Component({
    selector: 'nu-app',
    templateUrl: `app/app.component.html`,
    directives: [ROUTER_DIRECTIVES],
    providers: [HTTP_PROVIDERS, ROUTER_PROVIDERS, AccountService]
})
@Routes([
    {path: '/', component: HomeComponent},
    {path: '/home', component: HomeComponent},
    {path: '/account', component: FinancialComponent}
])
export class AppComponent {
    pageTitle: string = 'Neumont Portal';
    logoUrl: string = 'https://www.google.com/images/nav_logo242.png';
}
