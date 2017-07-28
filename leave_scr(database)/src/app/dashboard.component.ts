import { Component } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-dash',
  templateUrl: './dashboard.component.html',

})
export class DashboardComponent {
  title = 'app works!';
  applyleave = false;
  leavedash = false;
  leavehistory = false;
  leaveapproval = false;
  empleavesdata = false;

  leaveApply() {
    this.applyleave = true;
    this.leavedash = false;
    this.leavehistory = false;
    this.leaveapproval = false;
    this.empleavesdata = false;
  }

  leaveDash() {
    this.leavedash = true;
    this.applyleave = false;
    this.leavehistory = false;
    this.leaveapproval = false;
    this.empleavesdata = false;

  }

  leaveHistory() {
    this.leavehistory = true;
    this.applyleave = false;
    this.leavedash = false;
    this.leaveapproval = false;
    this.empleavesdata = false;


  }

  leaveApproval() {
    this.leaveapproval = true;
    this.applyleave = false;
    this.leavedash = false;
    this.leavehistory = false;
    this.empleavesdata = false;


  }

  empLeave() {
    this.empleavesdata = true;
    this.applyleave = false;
    this.leavedash = false;
    this.leavehistory = false;
    this.leaveapproval = false;


  }
}
