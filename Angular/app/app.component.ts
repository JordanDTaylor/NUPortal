import { Component } from '@angular/core';
import { HTTP_PROVIDERS } from '@angular/http';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';

import { HomeComponent} from './home/home.component';
import 'rxjs/Rx';
import { ScheduleComponent} from './schedule/schedule.component';
import { ScheduleService} from './schedule/schedule.service';
import { ContactComponent } from './contacts/contact.component'
import { ContactService } from './contacts/contact.service'

@Component({
    selector: 'nu-app',
    templateUrl: `app/app.component.html`,
    styleUrls: ['app/app.component.css'],
    directives: [ROUTER_DIRECTIVES],
    providers: [HTTP_PROVIDERS, ROUTER_PROVIDERS, ScheduleService, ContactService]
})
@Routes([
    {path: '/', component: HomeComponent},
    {path: '/home', component: HomeComponent},
    {path: '/schedule', component: ScheduleComponent}
    { path: '/contact', component: ContactComponent }
])
export class AppComponent {
    pageTitle: string = 'Neumont University';
    logoUrl: string = 'assets/images/logo.png';
}
