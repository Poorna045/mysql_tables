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
           $this->db->insert('raghuerp_mom.agenda',$agenda); 
       }
        foreach($data['objectives'] as $agenda){
           $agenda['mid']=$lastid;
           $this->db->insert('raghuerp_mom.objectives',$agenda); 
       }
        foreach($data['decisions'] as $agenda){
           $agenda['mid']=$lastid;
           $this->db->insert('raghuerp_mom.decisions',$agenda); 
       }
        foreach($data['actions'] as $agenda){
           $agenda['mid']=$lastid;
           $this->db->insert('raghuerp_mom.actions',$agenda); 
       }
     if($data['next']['status']=='Sure'){
         $data['next']['nextexpmeetdate']='';
     }else{
          $data['next']['nextdate']='';
           $data['next']['nextvenue']=''; 
     }
        $this->db->insert('raghuerp_mom.nextmeeting',$data['next']);

       return $lastid;
   }


 
 // check valid id's
   public function checkidvalid($data){
      //$str = "1,2,CSE2CR,3,CSE1CR";
$view=explode(",",$data['Meetings']['facilitator']);
$datas=[];
$p=0;
foreach($view as $ag){
         
            $dck= $this->db->query("select d.reg_no  from raghuerp_db1.staff d WHERE NOT EXISTS (select s.firstname  from raghuerp_db1.students s where s.reg_no='".$ag."' ) ")->result();
            if(sizeof($dck)>0){
                $datas[$p]=$ag;
                $p++;
            }
       }

    //   $data= $this->db->query("select s.firstname  from raghuerp_db1.students s where FIND_IN_SET (s.reg_no,'".$data['Meetings']['facilitator']."')")->result();
    //    $lastid=$this->db->insert_id();

//  $this->db->query("update raghuerp_mom.meetingdetails  m set m.presences='".$data['Attendance']['presences']."',m.absences='".$data['Attendance']['absences']."' where m.mid='".$lastid."'");

       //('".$data['Meetings']['facilitator']."')

       return $datas;
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
