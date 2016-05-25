import { Component } from '@angular/core';

@Component({
    selector: 'nu-schedule-current',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
    </div>
    `    
})
export class CurrentComponent{
    pageTitle: string = 'NuPortal Student Current';
}