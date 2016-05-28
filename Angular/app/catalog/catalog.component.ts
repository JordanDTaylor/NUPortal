import { Component } from '@angular/core';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';
import { CourseListComponent } from './course-list.component';
import { CourseDetailComponent } from './course-detail.component';
import { DegreeRequirementsComponent } from './degree-requirements.component';
import { DegreeRequirementsListComponent } from './degree-requirements.component';


@Component({
    selector: 'nu-catalog',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <div>
            <a [routerLink]="['courses']">Course List</a>
            <a [routerLink]="['degrees']">Degree Requirements</a>
        </div>
        <router-outlet></router-outlet>
    </div>
     `,
    directives: [ROUTER_DIRECTIVES],
})
@Routes([
    {path:'courses', component:CourseListComponent},
    {path:'course/:id', component:CourseDetailComponent},
    {path:'degrees', component:DegreeRequirementsComponent},
    {path:'degree/:degree', component:DegreeRequirementsListComponent}
])
export class CatalogComponent {
    pageTitle: string = 'Course Catalog';
}
