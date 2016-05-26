import { Component } from '@angular/core';
import { ROUTER_DIRECTIVES } from '@angular/router';
import { DegreeRequirementsListComponent } from './degree-requirements-list.component';

@Component({
    selector: 'nu-degree-requirements',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <div *ngFor="let degree of degs">
            <a [routerLink]="['/catalog', 'degree', degree]">{{degree}}</a>
        </div>
    </div>
     `,
    directives: [DegreeRequirementsListComponent, ROUTER_DIRECTIVES]
})
export class DegreeRequirementsComponent {
	pageTitle: string = 'Degree Requirements';
	degs: [] = ['CS', 'WEB', 'GD', 'TM', 'IS'];
}
