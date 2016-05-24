import { Component } from '@angular/core';

@Component({
    selector: 'nu-financial',
    template: `
    <div>
        <h1>{{ pageTitle }}</h1>
    </div>
     `
})

export class FinancialComponent {
    pageTitle: string = 'Neumont Portal - Financial';
}
