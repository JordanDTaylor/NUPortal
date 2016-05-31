import { Component } from '@angular/core';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';
import { CourseComponent } from './course.component';
import { CatalogService } from './catalog.service';

@Component({
    selector: 'nu-course-list',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <div>
            <input type="text" name="filter" />
        </div>
        <div *ngFor="let course of courses">
            <a *ngIf='course.Code!=undefined' [routerLink]="['/catalog', 'course', course.Id]">
                <nu-course [course]='course'></nu-course>
            </a>
        </div>
    </div>
     `,
    directives: [ROUTER_DIRECTIVES, CourseComponent],
})
export class CourseListComponent {
	pageTitle: string = 'Course List';
	courses: [] = [];
	
	constructor(private _catalogService: CatalogService){ this.getCourses();}
	getCourses(){
		this._catalogService.getAllCourses().subscribe(courses=>this.courses=courses, err=>{this.courses=[]; console.log(JSON.stringify(err));});
	}
}
