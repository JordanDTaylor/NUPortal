import {Component} from "@angular/core";

import {ScheduleService} from "../schedule.service";
import {IPlannedSchedule} from "./planned-schedule";


@Component({
  selector: 'schedule-plannedList',
  template:
  `
  <div >
    <table class="table-bordered table-striped">
        <thead class="bg-info" >
            <tr>
                <td>CourseCode</td>
                <td>Quarter</td>
            </tr>
        </thead>
        <tbody>
            <tr *ngFor="let planned of plannedClasses" >
                <td>{{planned.courseCode}}</td>
                <td>{{planned.Quarter}}</td>
            </tr>
        </tbody>
    </table>
</div>
  `
})
export class PlannedScheduleListComponent {
    plannedClasses: IPlannedSchedule[] = [];
    errorMessage: string = "";
    studentId: number = 2;
    constructor(public schedService:ScheduleService) { }

    ngOnInit():void {
        this.schedService.getCurrentlyPlannedStudentSchedule()
            .subscribe(
                plannedClasses => this.plannedClasses = plannedClasses,
                error => this.errorMessage = <any>error
            );
    }
}