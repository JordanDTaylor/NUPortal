/// <reference path="../../js/project.js" />

import { Component, AfterViewChecked } from '@angular/core';
import { ROUTER_DIRECTIVES } from '@angular/router';

import { IStudent } from './people/student';
import { IStaff } from './people/staff';

import { StudentComponent } from './people/student.component';
import { StaffComponent } from './people/staff.component';

import { ContactService } from './contact.service';

// import goPick = require('./project');

@Component({
    selector: 'nu-contact',
    templateUrl: 'app/contacts/contact.component.html',
    directives: [StudentComponent, StaffComponent, ROUTER_DIRECTIVES]
})
export class ContactComponent implements AfterViewChecked {
    pageTitle: string = "Contacts"
    searchText: string;
    onKey(event: any) {
        console.log(this.searchText);
    }

    errorMessage: string;
    students: IStudent[];
    allStaff: IStaff[];


    constructor(private _contactService: ContactService) {}

    ngOnInit(): void {
        GoPicker()
        this._contactService.getStudents()
            .subscribe(
            student => this.students = student,
            error => this.errorMessage = <any>error
            )
        this._contactService.getAllStaff()
            .subscribe(
            staff => this.allStaff = staff,
            error => this.errorMessage = <any>error
            )
    }

    ngAfterViewChecked() {
        window['GoPicker'].call()
    }
}

