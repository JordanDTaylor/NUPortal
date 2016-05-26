
import {PipeTransform, Pipe} from "@angular/core";
import {DatePipe} from "@angular/common";

@Pipe({ name: 'dateString' })
export class DateString implements PipeTransform {
    transform(value: string, args): string {
        var parsedDate = Date.parse(value);
        if (isNaN(parsedDate)) {
            return "";
        }
        else {
            return new DatePipe().transform(new Date(parsedDate), args);
        }
    }
}
