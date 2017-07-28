import { Component } from '@angular/core';
import {IMyOptions, IMyDateModel} from 'mydatepicker';
import { IMultiSelectOption } from 'angular-2-dropdown-multiselect';
import { AppService } from "app/app.service";


@Component({
  selector: 'app-leave',
  templateUrl: './applyleave.component.html',

})
export class ApplyleaveComponent {
    type: any;
    title = 'app works!';
optionsModel: number[];
days:any
count:number;
from
to

leaveIssue={
    from:'',
    to:'',
    days:'',
    reason:'',
    type:'',
    emp_id:''
}

constructor(private service:AppService){
  
}
private myOptions: IMultiSelectOption[] = [
            { id: 1, name: 'Sick Leave' },
            { id: 2, name: 'Prevelege Leave' },
            { id: 3, name: 'Compensatory Leave' },
            { id: 4, name: 'Stude Leave' },
            { id: 5, name: 'Casual Leave' },

        ];


   private myDatePickerOptions: IMyOptions = {
        // other options...
        dateFormat: 'dd-mm-yyyy',
    };

     onDateChanged(event: IMyDateModel) {
        // event properties are: event.date, event.jsdate, event.formatted and event.epoc
         console.log('onDateChanged(): ', event.date, ' - jsdate: ', new Date(event.jsdate).toLocaleDateString(), ' - formatted: ', event.formatted, ' - epoc timestamp: ', event.epoc);
     this.from=event.jsdate;   

      var one_day=1000*60*60*24;
var date1=new Date(this.from);
var date2=new Date(this.to);
console.log(date1,'date 1');
console.log(date2,'date 2');
    var date1_ms=date1.getTime();
    var date2_ms=date2.getTime();


console.log(date2_ms,'date ms');

    var diff_ms=date2_ms-date1_ms + one_day;

    var final=Math.round(diff_ms/one_day);
    console.log(Math.round(diff_ms/one_day),"  <=== time");
   
this.count=final;
 }

 onDateChanged2(event: IMyDateModel) {
        // event properties are: event.date, event.jsdate, event.formatted and event.epoc
         console.log('onDateChanged(): ', event.date, ' - jsdate: ', new Date(event.jsdate).toLocaleDateString(), ' - formatted: ', event.formatted, ' - epoc timestamp: ', event.epoc);
    this.to=event.jsdate;     
 

  var one_day=1000*60*60*24;
var date1=new Date(this.from);
var date2=new Date(this.to);
console.log(date1,'date 1');
console.log(date2,'date 2');
    var date1_ms=date1.getTime();
    var date2_ms=date2.getTime();


console.log(date2_ms,'date ms');

    var diff_ms=date2_ms-date1_ms + one_day;

    var final=Math.round(diff_ms/one_day);
    console.log(Math.round(diff_ms/one_day),"  <=== time");
   
this.count=final;

}
    submitLeave(value){


      console.log(value,'valueee');
      console.log(new Date(value.jsdate).toLocaleDateString(),'===> date');
    console.log(value.startdate.formatted,'hsj');
    
  for(var i=0;i<this.myOptions.length;i++){
             if(this.myOptions[i].id==value.type[0]){
                 this.type=this.myOptions[i].name;
             }
         }
     
console.log(value.startdate.formatted,'<== from' , value.enddate.formatted,'<== to', this.type,'<==type',this.count,'<==days',value.reason,'<== reason');

      this.leaveIssue.from=value.startdate.formatted;
      this.leaveIssue.to=value.enddate.formatted;
      this.leaveIssue.type=this.type;
      this.leaveIssue.reason=value.reason;
      this.leaveIssue.days=this.count.toString();
      this.leaveIssue.emp_id=this.service.empId;

      console.log(this.leaveIssue.emp_id,'emp id in leave apply');
      
this.service.leaveapply(this.leaveIssue);

    }
     onChange(value ) {
       
          console.log(value,'options value');
        console.log(this.optionsModel,'options model');
    }
}
