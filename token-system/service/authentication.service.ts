import { Injectable } from '@angular/core';
import { Http, Headers, Response, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { AppSettings } from '../app.settings';
import 'rxjs/add/operator/map'
import { ApiService } from '../_services/api.service';
@Injectable()
export class AuthenticationService {
    public userLoggedIn: boolean = false;
    constructor(private http: Http, private _apiService: ApiService) { }

    login(username: string, password: string) {
        let headers = new Headers({ 'Content-Type': 'application/json' });
        let options = new RequestOptions({ headers: headers });

        var params = new URLSearchParams();
        params.append('username', username);
        params.append('password', password);

        return this.http.post(AppSettings.LOGIN_API, params.toString(), options)
            .map((response: Response) => {
                // login successful if there's a jwt token in the response
                let user = response.json();
                if (user && user.token) {
                    // store user details and jwt token in local storage to keep user logged in between page refreshes
                    localStorage.setItem('currentUser', user.token);
                    this.userLoggedIn = true;
                }
            });
    }

    logout() {
        // remove user from local storage to log user out
        localStorage.removeItem('currentUser');
        this._apiService.unsubscribe();
    }
}