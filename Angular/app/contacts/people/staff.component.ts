import { Component, OnChanges, Input, Output, EventEmitter } from '@angular/core';

import { IStaff } from './staff';

@Component({
  selector: 'nu-staff',
  templateUrl: 'app/contacts/people/staff.component.html'
})
export class StaffComponent{
	@Input() staff: IStaff = {};
}