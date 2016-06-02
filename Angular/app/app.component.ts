import { Component } from '@angular/core';
import { HTTP_PROVIDERS } from '@angular/http';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';
import 'rxjs/Rx';

import { HomeComponent} from './home/home.component';

import { ScheduleComponent} from './schedule/schedule.component';
import { ScheduleService} from './schedule/schedule.service';

import { ContactComponent } from './contacts/contact.component'
import { ContactService } from './contacts/contact.service'

import { CatalogComponent} from './catalog/catalog.component';
import { CatalogService } from './catalog/catalog.service';

import { FinancialComponent} from './financial/components/financial.component';
import {AccountService} from "./financial/services/account.service";

@Component({
    selector: 'nu-app',
    templateUrl: `app/app.component.html`,
    directives: [ROUTER_DIRECTIVES],
    providers: [HTTP_PROVIDERS, ROUTER_PROVIDERS, ScheduleService, ContactService, CatalogService, AccountService]
})

@Routes([
    { path: '/', component: HomeComponent},
    { path: '/home', component: HomeComponent},
    { path: '/schedule', component: ScheduleComponent},
    { path: '/contact', component: ContactComponent },
    { path: '/catalog', component: CatalogComponent },
    { path: '/account', component: FinancialComponent}
])

export class AppComponent {
    pageTitle: string = 'NuPortal';
    logoUrl: string = 'assets/images/logo.png';
}
