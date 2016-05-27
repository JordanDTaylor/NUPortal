import { Component } from '@angular/core';

@Component({
    selector: 'nu-schedule-planned',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
    </div>
    `    
})
export class PlannedComponent{
    pageTitle: string = 'NuPortal Student Planned';
}