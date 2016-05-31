import { Component } from '@angular/core';
import {CurrentScheduleListComponent} from "./schedule-current-list.component";

@Component({
    selector: 'nu-current',
    directives: [CurrentScheduleListComponent],
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <schedule-currentList>loading current schedule...</schedule-currentList>
    </div>
     `
})

export class CurrentComponent {
    pageTitle: string = 'Your Schedule';
    
}