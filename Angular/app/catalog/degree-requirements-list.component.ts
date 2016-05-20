import { Component } from '@angular/core';

@Component({
    selector: 'nu-degree-requirements-list',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <div *ngfor="let req">
            req
        </div>
    </div>
     `
})
export class DegreeRequirementsListComponent {
    pageTitle: string = 'Degree Requirements List';
    degree: string = 'Computer Science';
}
