import { Component } from '@angular/core';
import { ROUTER_PROVIDERS, ROUTER_DIRECTIVES, Routes } from '@angular/router';
import { CatalogService } from './catalog.service';
import { DegreeRequirementsListComponent } from './degree-requirements-list.component';

@Component({
    selector: 'nu-degree-requirements',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <div *ngFor="let degree of degrees">
            <a [routerLink]="['/catalog', 'degree', degree.Id]">{{degree.Name}}</a>
        </div>
    </div>
     `,
    directives: [ROUTER_DIRECTIVES]
})
export class DegreeRequirementsComponent {
	pageTitle: string = 'Degree Requirements';
	degrees: [] = [];
	
	constructor(private _catalogService: CatalogService){}
	ngOnInit(){
		this._catalogService.getDegrees().subscribe(degs=>this.degrees=degs, err=>console.log(err));
	}
}
