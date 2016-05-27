import {Component} from "@angular/core";

import {ScheduleService} from "../schedule.service";
import {CurrentComponent} from "./schedule-current.component";
import {ICurrentSchedule} from "./schedule-current";


@Component({
  selector: 'schedule-currentList',
  template:
  `
  <div >
    <table class="table-bordered table-striped">
        <thead class="bg-info" >
            <tr>
                <td>Code</td>
                <td>Name</td>
                <td>Credits</td>
                <td>StartTime</td>
                <td>EndTime</td>
                <td>IsMonday?</td>
                <td>IsTuesday?</td>
                <td>IsWednesday?</td>
                <td>IsThursday?</td>
                <td>IsFriday?</td>
                <td>RoomNumber</td>
            </tr>
        </thead>
        <tbody>
            <tr *ngFor="let curr of currentClasses" >
                <td>{{curr.code}}</td>
                <td>{{curr.name}}</td>
                <td>{{curr.credits}}</td>
                <td>{{curr.startTime}}</td>
                <td>{{curr.endTime}}</td>
                <td>{{curr.isMonday}}</td>
                <td>{{curr.isTuesday}}</td>
                <td>{{curr.isWednesday}}</td>
                <td>{{curr.isThursday}}</td>
                <td>{{curr.isFriday}}</td>
                <td>{{curr.roomNum}}</td>
            </tr>
        </tbody>
    </table>
</div>
  `
})
export class CurrentScheduleListComponent {
    currentClasses: ICurrentSchedule[] = [];
    errorMessage: string = "";
    studentId: number = 2;
    constructor(public schedService:ScheduleService) { }

    ngOnInit():void {
        this.schedService.getCurrentlyEnrolledStudentSchedule()
            .subscribe(
                currentClasses => this.currentClasses = currentClasses,
                error => this.errorMessage = <any>error
            );
    }
}