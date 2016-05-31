import {Component} from "@angular/core";

import {ScheduleService} from "../schedule.service";
import {IScheduleHistory} from "./schedule-history";


@Component({
  selector: 'schedule-historyList',
  template:
  `
  <div >
    <table class="table-bordered table-striped">
        <thead class="bg-info" >
            <tr>
                <td>Code</td>
                <td>Name</td>
                <td>Credits</td>
                <td>Passed?</td>
                <td>GradePercent</td>
            </tr>
        </thead>
        <tbody>
            <tr *ngFor="let prev of prevClasses" >
                <td>{{prev.code}}</td>
                <td>{{prev.name}}</td>
                <td>{{prev.credits}}</td>
                <td>{{prev.passed}}</td>
                <td>{{prev.gradePercent}}</td>
            </tr>
        </tbody>
    </table>
</div>
  `
})
export class HistoricScheduleListComponent {
    prevClasses: IScheduleHistory[] = [];
    errorMessage: string = "";
    studentId: number = 2;
    constructor(public schedService:ScheduleService) { }

    ngOnInit():void {
        this.schedService.getStudentScheduleHistory()
            .subscribe(
                prevClasses => this.prevClasses = prevClasses,
                error => this.errorMessage = <any>error
            );
    }
}