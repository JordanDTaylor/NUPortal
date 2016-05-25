import { Component } from '@angular/core';
import { HTTP_PROVIDERS } from '@angular/http';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';

import { HomeComponent} from './home/home.component';
import { ScheduleComponent} from './schedule/schedule.component';

@Component({
    selector: 'nu-app',
    templateUrl: `app/app.component.html`,
    directives: [ROUTER_DIRECTIVES],
    providers: [HTTP_PROVIDERS, ROUTER_PROVIDERS]
})
@Routes([
    {path: '/', component: HomeComponent},
    {path: '/home', component: HomeComponent},
    {path: '/schedule', component: ScheduleComponent}
])
export class AppComponent {
    pageTitle: string = 'NU Angular Demo';
    logoUrl: string = 'https://www.google.com/images/nav_logo242.png';
}
