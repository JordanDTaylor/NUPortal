import { Component } from '@angular/core';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';
import { CourseComponent } from './course.component';

@Component({
    selector: 'nu-course-list',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <div>
            <input type="text" name="filter" />
        </div>
        <div *ngfor="let course">
            <a [routerLink]="['FAK-000']">FAK-000</a>
        </div>
    </div>
     `,
    directives: [ROUTER_DIRECTIVES],
})
@Routes([
    {path:':code', component:CourseComponent},
])
export class CourseListComponent {
    pageTitle: string = 'Course List';
}
