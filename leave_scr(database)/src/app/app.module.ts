import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { FormsModule, FormBuilder } from '@angular/forms';
import {RouterModule,Routes} from '@angular/router';


import { MyDatePickerModule } from 'mydatepicker';
import { MultiselectDropdownModule } from 'angular-2-dropdown-multiselect';



import { AppComponent } from './app.component';
import { DashboardComponent } from "app/dashboard.component";
import { LoginComponent } from "app/login.component";
import { ApplyleaveComponent } from "app/applyleave.component";
import { AppService } from "app/app.service";
import { LeavehistoryComponent } from "app/leavehistory.component";
import { LeavedashboardComponent } from "app/leavedashboard.component";
import { LeaveapprovalComponent } from "app/leaveapproval.component";
import { EmpleavesdataComponent } from "app/empleavesdata.component";

@NgModule({
  declarations: [
    AppComponent,
    DashboardComponent,
    LoginComponent,
    ApplyleaveComponent,
    LeavehistoryComponent,
    LeavedashboardComponent,
    LeaveapprovalComponent,
    EmpleavesdataComponent,
    

  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    MyDatePickerModule,
    MultiselectDropdownModule,
    RouterModule.forRoot([
        { path:'login' , component: LoginComponent},
        { path:'dashboard' , component: DashboardComponent},
        { path:'applyleave' , component: ApplyleaveComponent},
        
               
          { path:'' , redirectTo:'login',pathMatch:'full'},
          { path:'**' , redirectTo:'login',pathMatch:'full'},
    
       ]),
  ],
  providers: [AppService],
  bootstrap: [AppComponent]
})
export class AppModule { }
