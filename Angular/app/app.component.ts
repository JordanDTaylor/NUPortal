import { Component } from '@angular/core';
import { HTTP_PROVIDERS } from '@angular/http';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';
import { HomeComponent} from './home/home.component';
import 'rxjs/Rx';
import { ContactComponent } from './contacts/contact.component'
import { ContactService } from './contacts/contact.service'
import { CatalogComponent} from './catalog/catalog.component';
import { CatalogService } from './catalog/catalog.service';

@Component({
    selector: 'nu-app',
    templateUrl: `app/app.component.html`,
    styleUrls: ['app/app.component.css'],
    directives: [ROUTER_DIRECTIVES],
    providers: [ContactService, CatalogService, HTTP_PROVIDERS, ROUTER_PROVIDERS]
})
@Routes([
    { path: '/', component: HomeComponent },
    { path: '/home', component: HomeComponent },
    { path: '/contact', component: ContactComponent }
    { path: '/catalog', component: CatalogComponent }
])
export class AppComponent {
    pageTitle: string = 'NuPortal';
    logoUrl: string = 'assets/images/logo.png';
    pageTitle: string = 'NuPortal';
    logoUrl: string = 'https://www.google.com/images/nav_logo242.png';
}
