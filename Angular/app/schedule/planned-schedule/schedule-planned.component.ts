import { Component } from '@angular/core';
import {PlannedScheduleListComponent} from "./schedule-planned-list.component";

@Component({
    selector: 'nu-schedule-planned',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <schedule-plannedList>loading current schedule...</schedule-plannedList>
    </div>
    `    
})
export class PlannedComponent{
    pageTitle: string = 'Your Planned Schedule';
}