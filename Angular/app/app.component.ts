import { Component } from '@angular/core';

import { FinancialComponent} from './financial/financial.component'

@Component({
    selector: 'nu-app',
    template: `
    <div>
        <nu-financial>Loading Financial Page...</nu-financial>
    </div>
     `,
     directives: [FinancialComponent]
})
export class AppComponent {
    // pageTitle: string = 'NU Angular Demo';
    // logoUrl: string = 'https://www.google.com/images/nav_logo242.png';
}
