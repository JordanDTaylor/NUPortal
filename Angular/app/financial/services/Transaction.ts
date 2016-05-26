export interface ITransaction{
    id: number;
    StudentId: number;
    Date: Date;
    Description: string;
    Reference: string;
    Amount: number;
    Balance: number;
    Qualifies: boolean;
    Scholarship_Grant: boolean;
}
