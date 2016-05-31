export interface ICurrentSchedule {
    code: string;
    name: string;
    credits: number;
    startTime: TimeRanges;
    endTime: TimeRanges;
    isMonday: boolean;
    isTuesday: boolean;
    isWednesday: boolean;
    isThursday: boolean;
    isFriday: boolean;
    roomNum: number;
}