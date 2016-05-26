import { Component, Input } from '@angular/core';

@Component({
    selector: 'nu-degree-requirements-list',
    template: `
    <div>
        <h1>{{degree}} {{ pageTitle }}</h1>
        <div *ngIf='degree==undefined'>
            Unable to find Degree Requirements
        </div>
        <div *ngIf='degree!=undefined'>
            <div *ngFor="let req">
                req
            </div>
        </div>
    </div>
     `
})
export class DegreeRequirementsListComponent {
    pageTitle: string = 'Degree Requirements';
    @Input() degree: string = undefined;
}
