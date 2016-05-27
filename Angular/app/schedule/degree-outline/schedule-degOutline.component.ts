import { Component } from '@angular/core';

@Component({
    selector: 'nu-schedule-degree-outline',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
    </div>
    `    
})
export class DegOutlineComponent{
    pageTitle: string = 'NuPortal Student Degree';
}