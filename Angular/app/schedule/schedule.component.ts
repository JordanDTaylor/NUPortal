import { Component } from '@angular/core';

@Component({
    selector: 'nu-schedule',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
    </div>
    `    
})
export class ScheduleComponent{
    pageTitle: string = 'NuPortal Schedule';
}