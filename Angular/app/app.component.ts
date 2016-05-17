import { Component } from '@angular/core';

import { HomeComponent} from './home/home.component'

@Component({
    selector: 'nu-app',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <img [src]="logoUrl" />
        <nu-home>Loading Home...</nu-home>
    </div>
     `,
     directives: [HomeComponent]
})
export class AppComponent {
    pageTitle: string = 'NU Angular Demo';
    logoUrl: string = 'https://www.google.com/images/nav_logo242.png';
}
