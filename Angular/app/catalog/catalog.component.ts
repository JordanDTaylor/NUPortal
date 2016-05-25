import { Component } from '@angular/core';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';
import { CourseListComponent } from './course-list.component';
import { CourseDetailComponent } from './course-detail.component';
import { DegreeRequirementsComponent } from './degree-requirements.component';

@Component({
    selector: 'nu-catalog',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <div>
            <a [routerLink]="['courses']">Course List</a>
            <a [routerLink]="['degreeReqs']">Degree Requirements</a>
        </div>
        <router-outlet></router-outlet>
    </div>
     `,
    directives: [ROUTER_DIRECTIVES],
})
@Routes([
    {path:'courses', component:CourseListComponent},
    {path:'course/:id', component:CourseDetailComponent},
    {path:'degreeReqs', component:DegreeRequirementsComponent}
])
export class CatalogComponent {
    pageTitle: string = 'Course Catalog';
}
