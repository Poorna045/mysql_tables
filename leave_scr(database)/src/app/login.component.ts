import { Component } from '@angular/core';
import { Router } from "@angular/router";
import { AppService } from "app/app.service";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  
})
export class LoginComponent {
  title = 'app works!';

userData={
    username:'',
    password:''
};

  loginData=[
      {username:'poorna@gmail.com' ,password: '123456',emp_id:'1'},
      {username:'manoj@gmail.com' ,password: '123456',emp_id:'2'},
  ];

constructor(private router:Router,private service:AppService){}

log(){
    if(this.userData.username == this.loginData[0].username && this.userData.password == this.loginData[0].password   )
  {
    console.log(this.loginData[0].emp_id,'emp id in login page');
    
    this.service.empId=this.loginData[0].emp_id; 
     console.log(this.service.empId,'service emp id in login page');
      this.router.navigate(['/dashboard']);
   }
    if(this.userData.username == this.loginData[1].username && this.userData.password == this.loginData[1].password  )
    {
    this.service.empId=this.loginData[1].emp_id; 
      this.router.navigate(['/dashboard']);

    }
}
}
