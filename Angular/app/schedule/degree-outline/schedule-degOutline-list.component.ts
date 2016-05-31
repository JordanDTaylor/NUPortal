import {Component} from "@angular/core";

import {ScheduleService} from "../schedule.service";
import {IDegreeOutline} from "./schedule-degOutline";


@Component({
  selector: 'schedule-degreeOutList',
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
            <!--<tr *ngFor="let degs of degreeOutlines" >
                <td>{{degs.code}}</td>
                <td>{{degs.name}}</td>
                <td>{{degs.credits}}</td>
                <td>{{degs.startTime}}</td>
                <td>{{degs.endTime}}</td>
                <td>{{degs.isMonday}}</td>
                <td>{{degs.isTuesday}}</td>
                <td>{{degs.isWednesday}}</td>
                <td>{{degs.isThursday}}</td>
                <td>{{degs.isFriday}}</td>
                <td>{{degs.roomNum}}</td>-->
            </tr>
        </tbody>
    </table>
</div>
  `
})
export class DegreeOutlineListComponent {
    degreeOutlines: IDegreeOutline[] = [];
    errorMessage: string = "";
    studentId: number = 2;
    constructor(public schedService:ScheduleService) { }

    /*ngOnInit():void {
        this.schedService.getCurrentlyEnrolledStudentSchedule()
            .subscribe(
                degreeOutlines => this.degreeOutlines = degreeOutlines,
                error => this.errorMessage = <any>error
            );
    }*/
}