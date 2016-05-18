import { Component } from '@angular/core';

@Component({
    selector: 'nu-catalog',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
    </div>
     `
})
export class CatalogComponent {
    pageTitle: string = 'NuPortal Course Catalog';
}
