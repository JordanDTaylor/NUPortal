import {Component} from "@angular/core";

@Component({
    selector: 'login',
    styles: [],
    template: `
    <form action="/login" method="POST">
        
        <label for="unam">UserName</label>
        <input type="text" name="username" id="unam" /><br/>
        
        <label for="pword">Password</label>
        <input type="password" name="password" id="pword" /><br/>
        
        <input type="submit" value="Login" />
    </form>
`
})

export class LoginPage {
}
