import { Component } from '@angular/core';

@Component({
    selector: 'nu-schedule-history',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
    </div>
    `    
})
export class HistoryComponent{
    pageTitle: string = 'NuPortal Student History';
}