import { Injectable } from "@angular/core";
import { Http, Headers, Response, RequestOptions } from "@angular/http";
import "rxjs";




@Injectable()


export class AppService {
empId;
username;
  private url = './../server.json';
  private getUrl = "http://localhost/CI/getdata";
  private postUrl = "http://localhost/CI/postdata";
  private logUrl = "http://localhost/CI/logstatus";
  private leaveapplyurl="http://localhost/leaveCI/leaveapply";

  data: any
  constructor(private http: Http) {
    console.log(this.empId,'emp id in service');
    

  }
  getList() {
    return this.http.get(this.url)
      .map((response: Response) => response.json());


  }
  newData() {
    return this.http.get(this.getUrl)
      .map((response: Response) => response.json());
    // console.log(response.json(),'service data1!!') 

  }


  postData(value: any) {

 

    let bodyString = JSON.stringify(value);
    let headers = new Headers({ 'Content-Type': 'application/json', 'Accept': 'application/json' });
    let options = new RequestOptions({ headers: headers });

    console.log(bodyString, 'body');


    return this.http.post(this.postUrl, bodyString, options)
      .map((res: Response) => res.json());
  }

  loginInfo(data:any){


    let bodyString = JSON.stringify(data);
    let headers = new Headers({ 'Content-Type': 'application/json', 'Accept': 'application/json' });
    let options = new RequestOptions({ headers: headers });

   return this.http.post(this.logUrl, bodyString, options)
      .map((res: Response) => res.json());
  }

  leaveapply(value){
     

 let bodyString = JSON.stringify(value);
    let headers = new Headers({ 'Content-Type': 'application/json', 'Accept': 'application/json' });
    let options = new RequestOptions({ headers: headers });

    console.log(bodyString, 'body');


    return this.http.post(this.leaveapplyurl, bodyString, options)
      .map((res: Response) => res.json());

  }
}