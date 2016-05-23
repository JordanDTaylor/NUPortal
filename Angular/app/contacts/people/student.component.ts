import { Component, OnChanges, Input, Output, EventEmitter } from '@angular/core';

import { IStudent } from './student';

@Component({
  selector: 'nu-student',
  templateUrl: 'app/contacts/people/student.component.html'
})
export class StudentComponent{
	@Input() student: IStudent = {};
}