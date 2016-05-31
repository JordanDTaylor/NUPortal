import { Component } from '@angular/core';
import { ROUTER_PROVIDERS, ROUTER_DIRECTIVES, OnActivate, RouteSegment } from '@angular/router';
import { CourseComponent } from './course.component';
import { CatalogService } from './catalog.service';

@Component({
    selector: 'nu-degree-requirements-list',
    template: `
    <div>
        <h1>{{degree}} {{ pageTitle }}</h1>
        <div *ngIf='degree==undefined'>
            Unable to find Degree Requirements
        </div>
        <div *ngFor="let req of reqs">
            {{req.Code}}
        </div>
    </div>
    `,
    directives:[ROUTER_DIRECTIVES, CourseComponent]
})
export class DegreeRequirementsListComponent {
	pageTitle: string = 'Degree Requirements';
	reqs: [] = [];
	degree: string = undefined;
	
	
	constructor(private _catalogService: CatalogService){}
	routerOnActivate(seg:RouteSegment):void{
		this.switchDegree(seg.getParam('id'));
	}
	switchDegree(deg:string){
		this.degree = deg;
		this._catalogService.getDegreeReqs(this.degree).subscribe(reqs=>this.reqs=reqs, err=>console.log(err));
	}
}
