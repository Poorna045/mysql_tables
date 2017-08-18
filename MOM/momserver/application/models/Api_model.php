<?php

class Api_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();

        $this->load->database();
        $CI =   &get_instance();
        $this->db2 = $this->load->database('db2', TRUE);   
    }
    
    // validate login details
    function login($username, $password){
        $this->db->where('reg_no', $username);
        $this->db->where('password', md5($password));
        $this->db->limit(1);
        $ugt = $this->db->get('users');
        $cnt = $ugt->num_rows();

        if ($cnt) {
            $data = $ugt->row();
            return array("success"=>true, "reg_no"=>$data->reg_no, "utype"=>$data->utype, "name"=>$data->name);
        } 
        else {
            return array("success"=>false, "error"=>$username);
        }
    }

   
 // push all details
   public function pushalldetails($data){
       $this->db->insert('raghuerp_mom.meetingdetails',$data['Meetings']);
       $lastid=$this->db->insert_id();

    // $lastid='1';

 $this->db->query("update raghuerp_mom.meetingdetails  m set m.presences='".$data['Attendance']['presences']."',m.absences='".$data['Attendance']['absences']."' where m.mid='".$lastid."'");

       foreach($data['Agenda'] as $agenda){
           $agenda['mid']=$lastid;
         $view=explode(",",$agenda['agresponsibleperson']);

         for($k=0;$k<sizeof($view);$k++){
             $agenda['agresponsibleperson']=$view[$k];
            $this->db->insert('raghuerp_mom.agenda',$agenda); 
         }

           
       }
        foreach($data['objectives'] as $agenda){
           $agenda['mid']=$lastid;
           $view=explode(",",$agenda['objowner']);
           
                    for($k=0;$k<sizeof($view);$k++){
                        $agenda['objowner']=$view[$k];
                        $this->db->insert('raghuerp_mom.objectives',$agenda); 
                    }

       }
        foreach($data['decisions'] as $agenda){
           $agenda['mid']=$lastid;

           $view=explode(",",$agenda['decisiontaken']);
           
                    for($k=0;$k<sizeof($view);$k++){
                        $agenda['decisiontaken']=$view[$k];
                        $this->db->insert('raghuerp_mom.decisions',$agenda); 
                    }
          
       }
        foreach($data['actions'] as $agenda){
           $agenda['mid']=$lastid;

           $view=explode(",",$agenda['actresponsibleperson']);
           
                    for($k=0;$k<sizeof($view);$k++){
                        $agenda['actresponsibleperson']=$view[$k];  
                        $this->db->insert('raghuerp_mom.actions',$agenda); 
                    }
        
       }
     if($data['next']['status']=='Sure'){
         $data['next']['nextexpmeetdate']='';
     }else{
          $data['next']['nextdate']='';
           $data['next']['nextvenue']=''; 
     }
      $data['next']['mid']=$lastid;
      
        $this->db->insert('raghuerp_mom.nextmeeting',$data['next']);

       return $lastid;
   }


   //get all meeting details by role
   public function getmeetingdetailsbyrole($reg_no,$data){

       if($data['utype']=='adm'){
         
         $datas=$this->db->query("SELECT * FROM raghuerp_mom.meetingdetails ORDER BY raghuerp_mom.meetingdetails.meetingdate DESC")->result();
      
         for($i=0;$i<sizeof($datas);$i++){
         
           $datas[$i]->facilitator=$this->checkidvalid($datas[$i]->facilitator);    
            
         }
       }
       else{
           
           $datas=$this->db->query("SELECT * FROM raghuerp_mom.meetingdetails WHERE raghuerp_mom.meetingdetails.reg_no='".$reg_no."' ORDER BY raghuerp_mom.meetingdetails.meetingdate DESC")->result();
      
         for($i=0;$i<sizeof($datas);$i++){
         
            $datas[$i]->facilitator=$this->checkidvalid($datas[$i]->facilitator);    
            
         }
      
       }
       return $datas;
   }

   
   // get all Action Data
   public function getallactiondata($data){

       if($data['utype']=='adm'){
         
        //  $datas=$this->db->query("SELECT m.*,a.actresponsibleperson,a.acid,a.actdescription,a.actexpectcompletion,a.acstatus,a.actualcompdate FROM raghuerp_mom.actions a inner join raghuerp_mom.meetingdetails m on a.mid=m.mid ORDER BY a.acid DESC")->result();
         

                  $datas=$this->db->query("SELECT m.* ,concat(a.actresponsibleperson,' ',(select p.firstname from raghuerp_db1.staff p where p.reg_no=a.actresponsibleperson ) )  as actresponsibleperson,a.acid,a.actdescription,a.actexpectcompletion,a.acstatus,a.actualcompdate,(case
  when a.actualcompdate='0000-00-00' and CURDATE()<=a.actexpectcompletion then concat(datediff(curdate(),a.actexpectcompletion) * -1,' Day(s) Left')
  when a.actualcompdate='0000-00-00' and CURDATE()>a.actexpectcompletion then concat(datediff(curdate(),a.actexpectcompletion),' Day(s) Overdue')
  when a.actualcompdate!='0000-00-00' and a.actexpectcompletion<=a.actualcompdate then concat(datediff(a.actualcompdate,a.actexpectcompletion),' Day(s) Delayed') when a.actualcompdate!='0000-00-00' and a.actexpectcompletion>a.actualcompdate then concat(datediff(a.actualcompdate,a.actexpectcompletion) * -1,' Day(s) Before Time') 
  END ) due  FROM raghuerp_mom.actions a inner join raghuerp_mom.meetingdetails m on a.mid=m.mid ORDER BY a.acid DESC")->result();

        //    for($i=0;$i<sizeof($datas);$i++){
         
        //     $datas[$i]->actresponsibleperson=$this->checkidvalid($datas[$i]->actresponsibleperson);    
            
        //  }
       
       }
       else{
           
        //    $datas=$this->db->query("SELECT SELECT m.*,a.actresponsibleperson,a.acid,a.actdescription,a.actexpectcompletion,a.acstatus,a.actualcompdate FROM raghuerp_mom.actions a inner join raghuerp_mom.meetingdetails m on a.mid=m.mid and FIND_IN_SET('".$data['reg_no']."', a.actresponsibleperson) ORDER BY a.acid DESC")->result();
       
           $datas=$this->db->query("SELECT m.*,concat(a.actresponsibleperson,' ',(select p.firstname from raghuerp_db1.staff p where p.reg_no=a.actresponsibleperson ) )  as actresponsibleperson,a.acid,a.actdescription,a.actexpectcompletion,a.acstatus,a.actualcompdate,(case
  when a.actualcompdate='0000-00-00' and CURDATE()<=a.actexpectcompletion then concat(datediff(curdate(),a.actexpectcompletion) * -1,' Day(s) Left')
  when a.actualcompdate='0000-00-00' and CURDATE()>a.actexpectcompletion then concat(datediff(curdate(),a.actexpectcompletion),' Day(s) Overdue')
  when a.actualcompdate!='0000-00-00' and a.actexpectcompletion<=a.actualcompdate then concat(datediff(a.actualcompdate,a.actexpectcompletion),' Day(s) Delayed') when a.actualcompdate!='0000-00-00' and a.actexpectcompletion>a.actualcompdate then concat(datediff(a.actualcompdate,a.actexpectcompletion) * -1,' Day(s) Before Time') 
  END ) due  FROM raghuerp_mom.actions a inner join raghuerp_mom.meetingdetails m on a.mid=m.mid and a.actresponsibleperson='".$data['reg_no']."' ORDER BY a.acid DESC")->result();


        //     for($i=0;$i<sizeof($datas);$i++){
         
        //     $datas[$i]->actresponsibleperson=$this->checkidvalid($datas[$i]->actresponsibleperson);    
            
        //  }
       }
       return $datas;
   }


     //get all meeting details by role
     public function getalldetailsbymid($data){



           $datas['Meetings']=$this->db->query("SELECT * FROM raghuerp_mom.meetingdetails WHERE mid='".$data['mid']."'")->row();

            $datas['Meetings']->facilitator=$this->checkidvalid($datas['Meetings']->facilitator);    
              $datas['Meetings']->presences=$this->checkidvalid($datas['Meetings']->presences);  
                $datas['Meetings']->absences=$this->checkidvalid($datas['Meetings']->absences);  
            
         

    	   $datas['Agenda']=$this->db->query("SELECT *,concat(a.agresponsibleperson,' ',(select p.firstname from raghuerp_db1.staff p where p.reg_no=a.agresponsibleperson ) )  as agresponsiblepersons FROM raghuerp_mom.agenda a  WHERE mid='".$data['mid']."'")->result();

           
        //   for($i=0;$i<sizeof($datas['Agenda']);$i++){
         
        //     $datas['Agenda'][$i]->agresponsibleperson=$this->checkidvalid($datas['Agenda'][$i]->agresponsibleperson);     
            
        //  }

	       $datas['objectives']=$this->db->query("SELECT *,concat(a.objowner,' ',(select p.firstname from raghuerp_db1.staff p where p.reg_no=a.objowner ) )  as objowners FROM raghuerp_mom.objectives a  WHERE mid='".$data['mid']."'")->result();

	       $datas['decisions']=$this->db->query("SELECT *,concat(a.decisiontaken,' ',(select p.firstname from raghuerp_db1.staff p where p.reg_no=a.decisiontaken ) )  as decisiontakens FROM raghuerp_mom.decisions a WHERE mid='".$data['mid']."'")->result();

        //    for($i=0;$i<sizeof($datas['decisions']);$i++){
            
        //        $datas['decisions'][$i]->decisiontaken=$this->checkidvalid($datas['decisions'][$i]->decisiontaken);     
               
        //       }

	       $datas['actions']=$this->db->query("SELECT *,concat(a.actresponsibleperson,' ',(select p.firstname from raghuerp_db1.staff p where p.reg_no=a.actresponsibleperson ) )  as actresponsiblepersons,(case
  when a.actualcompdate='0000-00-00' and CURDATE()<=a.actexpectcompletion then concat(datediff(curdate(),a.actexpectcompletion) * -1,' Day(s) Left')
  when a.actualcompdate='0000-00-00' and CURDATE()>a.actexpectcompletion then concat(datediff(curdate(),a.actexpectcompletion),' Day(s) Overdue')
  when a.actualcompdate!='0000-00-00' and a.actexpectcompletion<=a.actualcompdate then concat(datediff(a.actualcompdate,a.actexpectcompletion),' Day(s) Delayed') when a.actualcompdate!='0000-00-00' and a.actexpectcompletion>a.actualcompdate then concat(datediff(a.actualcompdate,a.actexpectcompletion) * -1,' Day(s) Before Time') 
  END ) due   FROM raghuerp_mom.actions a WHERE mid='".$data['mid']."'")->result();

           
        //     for($i=0;$i<sizeof($datas['actions']);$i++){
         
        //     $datas['actions'][$i]->actresponsibleperson=$this->checkidvalid($datas['actions'][$i]->actresponsibleperson);     
            
        //    }


    	   $datas['next']=$this->db->query("SELECT * FROM raghuerp_mom.nextmeeting WHERE mid='".$data['mid']."'")->row();

            $datas['next']->attendeeslist=$this->checkidvalid($datas['next']->attendeeslist); 
            $datas['next']->nextfacilitator=$this->checkidvalid($datas['next']->nextfacilitator);    
            
           


           return $datas;
     }

 
   // check valid id's
   public function checkidvalid($data){
      $str = "RECEEE01,RECCSE548,RECMECH001,xyz123";
      $view=explode(",",$str);
      $datas=[];
      $p=0;
      foreach($view as $ag){
         
            $dck= $this->db->query("select concat( ' ',d.reg_no,' - ',d.firstname ) as names  from raghuerp_db1.staff d WHERE d.reg_no='".$ag."'  ")->row();
            
                $datas[$p]=$dck->names;
                $p++;
            
       }
 
      $dsdata = implode(',', $datas);

       return $dsdata;
   }


    // Get Multiple query results function
    public function GetMultipleQueryResult($queryString)  {
        if (empty($queryString)) {
                    return false;
        }

        $index     = 0;
        $ResultSet = array();

        /* execute multi query */
        if (mysqli_multi_query($this->db->conn_id, $queryString)) {
            do {
                if (false != $result = mysqli_store_result($this->db->conn_id)) {
                    $rowID = 0;
                    while ($row = $result->fetch_assoc()) {
                        $ResultSet[$index][$rowID] = $row;
                        $rowID++;
                    }
                }
                $index++;
            } while (mysqli_more_results($this->db->conn_id) && mysqli_next_result($this->db->conn_id));
        }
        return $ResultSet;
    }


}
?>
