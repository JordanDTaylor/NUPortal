import { Component } from '@angular/core';
import { DegreeRequirementsListComponent } from './degree-requirements-list.component';

@Component({
    selector: 'nu-degree-requirements',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <div *ngfor="let degree">
            <nu-degree-requirements-list [degree]="degree"></nu-degree-requirements-list>
        </div>
    </div>
     `
})
export class DegreeRequirementsComponent {
    pageTitle: string = 'Degree Requirements';
}
