import { Component } from '@angular/core';

import { CurrentComponent } from './current-schedule/schedule-current.component';
import { HistoryComponent } from './schedule-history/schedule-history.component';
import { DegOutlineComponent } from './degree-outline/schedule-degOutline.component';
import { PlannedComponent } from './planned-schedule/schedule-planned.component';
import { ScheduleService} from './schedule.service';

import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';

@Component({
    selector: 'nu-schedule',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <div id="nav" style="float:right">
            <a [routerLink]="['current']">Current Schedule</a><br/><!--'/schedule'-->
            <a [routerLink]="['history']">Student History</a><br/>
            <a [routerLink]="['degree']">Degree Outline</a><br/>
            <a [routerLink]="['planned']">Planned Courses</a><br/>
        </div>
        <router-outlet></router-outlet>
    </div>
     `,
    directives: [ROUTER_DIRECTIVES],
    providers: [ScheduleService]
})
@Routes([
    {path: 'current', component: CurrentComponent},
    {path: 'history', component: HistoryComponent},
    {path: 'degree', component: DegOutlineComponent},
    {path: 'planned', component: PlannedComponent}
])
export class ScheduleComponent{
    pageTitle: string = 'NuPortal Schedule';
}