import { Component } from '@angular/core';
import { HTTP_PROVIDERS } from '@angular/http';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';
import { HomeComponent} from './home/home.component';
import 'rxjs/Rx';
import { ContactComponent } from './contacts/contact.component'
import { ContactService } from './contacts/contact.service'

@Component({
    selector: 'nu-app',
    templateUrl: `app/app.component.html`,
    directives: [ROUTER_DIRECTIVES],
    providers: [ContactService, HTTP_PROVIDERS, ROUTER_PROVIDERS]
})
@Routes([
    { path: '/', component: HomeComponent },
    { path: '/home', component: HomeComponent },
    { path: '/contact', component: ContactComponent }
])
export class AppComponent {
    pageTitle: string = 'Neumont University';
    logoUrl: string = 'assets/images/logo.png';
}
