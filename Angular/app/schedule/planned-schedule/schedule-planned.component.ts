import { Component } from '@angular/core';
import {PlannedScheduleListComponent} from "./schedule-planned-list.component";

@Component({
    selector: 'nu-schedule-planned',
    directives: [PlannedScheduleListComponent],
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <schedule-plannedList>loading planned schedule...</schedule-plannedList>
    </div>
    `    
})
export class PlannedComponent{
    pageTitle: string = 'Your Planned Schedule';
}