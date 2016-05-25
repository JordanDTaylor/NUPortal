import { Component, Input } from '@angular/core';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';

@Component({
    selector: 'nu-course',
    template: `
    <div *ngIf='course==undefined'>
        <h3>Unable to find course</h3>
    </div>
    <div *ngIf='course!=undefined'>
        {{ course.Code }} {{ course.Name }}
    </div>
     `
})
export class CourseComponent {
    @Input() course: any = undefined;
}
