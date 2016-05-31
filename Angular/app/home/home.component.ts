import { Component } from '@angular/core';
import { CanActivate } from 'angular2/router';

@Component({
    selector: 'nu-home',
    templateUrl: `app/home/home.component.html`
})
export class HomeComponent {
    pageTitle: string = 'NU Home Demo';
    logoUrl: string = 'https://media4.giphy.com/media/5D6kjdPsBRYUo/200_s.gif';
}
