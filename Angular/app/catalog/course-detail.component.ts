import { Component, Input } from '@angular/core';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES, OnActivate, RouteSegment } from '@angular/router';
import { CourseComponent } from './course.component';
import { CatalogService } from './catalog.service';

@Component({
    selector: 'nu-course-detail',
    template: `
    <div>
        <h3 *ngIf='course==undefined'>Unable to find Course</h3>
        <div *ngIf='course!=undefined'>
            <h2>Course ID:{{ course.Id }}</h2>
            <nu-course [course]='course'></nu-course>
            <span>{{course.Description}}</span>
        </div>
    </div>
    `,
    directives:[ CourseComponent ]
})
export class CourseDetailComponent {
	course: any = undefined;
	reqs: [] = [];
	
	constructor(private _catalogService: CatalogService){ }
	routerOnActivate(seg:RouteSegment):void{
		this.switchCourse(seg.getParam('id'));
	}
	switchCourse(code:string){
		this._catalogService.getCourse(code).subscribe(course=>{this.course=course;this.getRequirements();}, err=>{this.course=undefined; console.log(err);});
	}
	getRequirements(){
		if(this.course!=undefined){
			this._catalogService.getCoursePreReqs(this.course.Id).subscribe(reqs=>this.reqs=reqs, err=>{this.reqs=undefined; console.log(err);});
		}
	}
}
