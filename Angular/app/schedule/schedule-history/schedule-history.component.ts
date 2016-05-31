import { Component } from '@angular/core';
import {HistoricScheduleListComponent} from "./schedule-history-list.component";

@Component({
    selector: 'nu-schedule-history',
    directives: [HistoricScheduleListComponent],
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <schedule-historyList>loading current schedule...</schedule-historyList>
    </div>
    `    
})
export class HistoryComponent{
    pageTitle: string = 'Your Past Classes';
}