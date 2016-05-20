import { Component } from '@angular/core';
import { ROUTER_PROVIDERS, Routes, ROUTER_DIRECTIVES} from '@angular/router';

@Component({
    selector: 'nu-course',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
        <h3>{{ courseCode }} - {{ courseCred }} credits - {{ courseName }}</h3>
        <span>{{ courseDesc }}</span>
    </div>
     `
})
export class CourseComponent {
    pageTitle: string = 'Course';
    courseCode: string = 'FAK-000';
    courseName: string = 'Fake Course 0';
    courseCred: int = 0;
    courseDesc: string = 'A fake course which should never be seen, and exists only to take up space in the db.';
}
