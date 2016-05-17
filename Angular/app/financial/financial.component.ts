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
    pageTitle: string = 'NUPortal Home Demo';
    logoUrl: string = 'https://media4.giphy.com/media/5D6kjdPsBRYUo/200_s.gif';
}
