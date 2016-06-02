import { Component } from '@angular/core';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';
import { CourseListComponent } from './course-list.component';
import { CourseDetailComponent } from './course-detail.component';
import { DegreeRequirementsComponent } from './degree-requirements.component';
import { DegreeRequirementsListComponent } from './degree-requirements-list.component';


@Component({
    selector: 'nu-catalog',
    templateUrl: './app/catalog/catalog.component.html',
    directives: [ROUTER_DIRECTIVES],
})
@Routes([
    {path:'courses', component:CourseListComponent},
    {path:'course/:id', component:CourseDetailComponent},
    {path:'degrees', component:DegreeRequirementsComponent},
    {path:'degree/:id', component:DegreeRequirementsListComponent}
])
export class CatalogComponent {
    pageTitle: string = 'Course Catalog';
}
