<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . "/libraries/REST_Controller.php";

if (isset($_SERVER['HTTP_ORIGIN'])) {
	header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
	header('Access-Control-Allow-Credentials: true');
	header('Access-Control-Max-Age: 86400');    // cache for 1 day
}

// Access-Control headers are received during OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

	if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
		header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

	if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
		header("Access-Control-Allow-Headers:        {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

	exit(0);
}


class Api extends REST_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Api_model');
		$this->load->helper('jwt');
	}
	public function __destruct() {  
	    $this->db->close();  
	} 
    
	public function index_get()
	{
		$this->response('NULL');
	}
	public function validLogin_post()
	{
		$username = $this->post('username');
		$password = $this->post('password');
		$result = $this->Api_model->login($username, $password);
		
		if ($result['success']) {
			// user logged in, generate a token and return
			$id = $result['reg_no'];
			$token = array();
			$token['reg_no'] = $id;
			$result['token'] = JWT::encode($token, $this->config->item('jwt_key'));
			$result['name'] = $result['name'];
			$result['utype'] = $result['utype'];
			$this->response($result);
		} else {
			// authentication failed, return error
			$this->response(
				array(
					"success"	=> $result['success'], 
					"error"		=> $result['error'],
				)
			);
		}
	}	
		
	function getData($type, $params=null) {
		$success = true;
		$error = '';
		$result = '';
		$response = [];
				
		if(!$_SERVER['HTTP_TOKEN']) {
			$success = false;
			$error = "Token not provided";
		}
		
		if ($success) {
			try 
			{
				$token = JWT::decode($_SERVER['HTTP_TOKEN'], $this->config->item('jwt_key'));
	
				if ($token->reg_no) {		
					switch($type) {
						case 'userData'				: $result = $this->Api_model->userData($token->reg_no); break;
						case 'changePassword'		: $result = $this->Api_model->changePassword($token->reg_no, $params); break;
						case 'pushalldetails'		: $result = $this->Api_model->pushalldetails($params); break;
						case 'checkidvalid'		: $result = $this->Api_model->checkidvalid($params); break;
						case 'getmeetingdetailsbyrole'		: $result = $this->Api_model->getmeetingdetailsbyrole($token->reg_no,$params); break;
					    case 'getalldetailsbymid'		: $result = $this->Api_model->getalldetailsbymid($params); break;
						case 'getallactiondata'		: $result = $this->Api_model->getallactiondata($params); break;
					
						// case 'getStaff'				: $result = $this->api_model->getStaff($token->reg_no, $params); break;
						// case 'Upload'				: $result = $this->Api_model->Upload($token->reg_no,$params); break;
					}
				
					$success = true;
				}
			} 
			catch (Exception $e)
			{
				$success = false;
				$error = "Token authentication failed";
			}					
		}
		
		$response['success'] = $success;
		$response['error'] = $error;
		if ($success) {
			$response['data'] = $result;
		}		
		$this->response($response);
	}

// push all details
public function pushalldetails_post(){
	$data['Meetings']=$this->post('Meetings');
	$data['Attendance']=$this->post('Attendance');
	$data['Agenda']=$this->post('Agenda');
	$data['objectives']=$this->post('objectives');
	$data['decisions']=$this->post('decisions');
	$data['actions']=$this->post('actions');
	$data['next']=$this->post('next');
	$data['reg_no']=$this->post('reg_no');
	// $time=  strtotime($data['Meetings']['meetingtime']);
    //     $data['Meetings']['meetingtime'] = date('H:i:s', $time);
		// $time=  strtotime($data['next']['nextdate']);
        // $data['next']['nextdate'] = date('Y-m-d H:i:s', $time);
		 $data['Meetings']['reg_no']=$data['reg_no'];

	    $this->getData('pushalldetails',$data);
}


// get meeting details by role
public function getmeetingdetailsbyrole_post(){
	
	$data['utype']=$this->post('utype');


	    $this->getData('getmeetingdetailsbyrole',$data);
}


// get all details by mid
public function getalldetailsbymid_post(){
	$data['mid']=$this->post('mid');


	    $this->getData('getalldetailsbymid',$data);
}

// get all Action Data
public function getallactiondata_post(){
	$data['utype']=$this->post('utype');
    $data['reg_no']=$this->post('reg_no');

	    $this->getData('getallactiondata',$data);
}

// check valid id's
public function checkidvalid_post(){
	$data=$this->post('data');
	// $data['Meetings']=(object) null;
	// $data['Meetings']=$this->post('Meetings');
	// echo $type . gettype($data['Meetings']) . 'testing  </br>';
	//  print_r($data);
	// $data['Attendance']=$this->post('Attendance');
	// $data['Agenda']=$this->post('Agenda');
	// $data['objectives']=$this->post('objectives');
	// $data['decisions']=$this->post('decisions');
	// $data['actions']=$this->post('actions');
	// $data['next']=$this->post('next');
	
//	$datas['data']=$data[$type];
	
	

	    $this->getData('checkidvalid',$data);
}

	// Get Multiple query results function
	public function GetMultipleQueryResult($queryString)
    {
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