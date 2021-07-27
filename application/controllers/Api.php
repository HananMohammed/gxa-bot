<?php require_once("Home.php"); // including home controller

class Api extends Home
{
    public function __construct()
    {
        parent::__construct();
   
    }


    public function api_key_check($api_key="",$is_admin=0)
    {
        $user_id="";
        if($api_key!="")
        {
            $explde_api_key=explode('-',$api_key);
            $user_id="";
            if(array_key_exists(0, $explde_api_key))
            $user_id=$explde_api_key[0];
        }

        if($api_key=="")
        {        
           $response['status']='error';
           $response['message'] = 'API Key is required';
           return $response;
        }

        $join=array('native_api'=>"native_api.user_id=users.id,left");
        $where['where']=array("users.id"=>$user_id,"api_key"=>$api_key,"users.status"=>"1");
        if($is_admin)
            $where['where']['user_type']="Admin";
        $user_info= $this->basic->get_data("users",$where,"",$join);

        if(count($user_info)==1){
            $response['status']='success';  
            $response['user_id']=$user_id;  
            return $response;
        }
        else{

            $response['status']='error';
            $response['message']='Either API Key Invalid or Member Validity Expired';
            return $response;
        }
    } 



    public function create_system_user(){

    	$api_key=$this->input->post('api_key');
        $api_key_response= $this->api_key_check($api_key,"1");

        if($api_key_response['status']!="success"){
            echo json_encode($api_key_response);
            exit; 
        }

        $name=$this->input->post('name');
        if(!$name) $name="";
        $email=$this->input->post('email');
        if(!$email) $email="";
        $mobile=$this->input->post('mobile');
        if(!$mobile) $mobile="";
        $password=md5($this->input->post('password'));
        if(!$password) $password="";
        $address=$this->input->post('address');
        if(!$address) $address="";

        $user_type="Member";
        $status="1";
        $package_id=$this->input->post('package_id');
        if(!$package_id) $package_id="";

        $expired_date=$this->input->post('expired_date');
        if(!$expired_date) $expired_date="";
                                               
        $data=array
        (
            'name'=>$name,
            'email'=>$email,
            'mobile'=>$mobile,
            'password'=>$password,
            'address'=>$address,
            'user_type'=>$user_type,
            'status'=>$status,
            'add_date' => date("Y-m-d H:i:s")
        );
        $data["package_id"] = $package_id;
        $data["expired_date"] = $expired_date;

        if($name=="" || $email=="" || $password=="" || $package_id=="" || $expired_date==""){

            $response['status']='error';
            $response['message']='All mandatory field is not provided';
            echo json_encode($response);
            exit;

        }

        if(!$this->basic->is_exist("package",array("id"=>$package_id))){
            $response['status']='error';
            $response['message']='Package ID not found';
            echo json_encode($response);
            exit;
        }

        if($this->basic->is_exist("users",array("email"=>$email))){
            $response['status']='error';
            $response['message']='Email already exists';
            echo json_encode($response);
            exit;
        }

        $this->basic->insert_data('users',$data);
        $new_user_id=$this->db->insert_id();
        if($new_user_id){

            $response['status']='success';
            $response['id']=$new_user_id;
            echo json_encode($response);
            exit;
        }

    }


    public function update_user($user_id=""){

        if($user_id==""){
            $response['status']='error';
            $response['message']="Provide User ID with End Point URL";
            echo json_encode($response);
            exit;
        }


        $api_key=$this->input->post('api_key');
        $api_key_response= $this->api_key_check($api_key,"1");

        if($api_key_response['status']!="success"){
            echo json_encode($api_key_response);
            exit; 
        }

        $update_info=array();

        $name=$this->input->post('name');
        if(!$name) $update_info["name"]=$name;
        
        $mobile=$this->input->post('mobile');
        if(!$mobile)    $update_info["mobile"]=$mobile;
        

        $address=$this->input->post('address');
        if(!$address)   $update_info["address"]=$address;
       
        $status=$this->input->post('status');
        if(!$status)  $update_info["status"]=$status;

        $package_id=$this->input->post('package_id');
        if(!$package_id)  $update_info["package_id"]=$package_id;

        $expired_date=$this->input->post('expired_date');
        if(!$expired_date) $update_info["expired_date"]=$expired_date;


       if(!$this->basic->is_exist("users",array("id"=>$user_id))){
            $response['status']='error';
            $response['message']="User not found with the ID: {$user_id}";
            echo json_encode($response);
            exit;
        }

        $this->basic->update_data("users",array("id"=>$user_id),$update_info);

        $response['status']='success';
        echo json_encode($response);
        exit;


    }


    public function get_user_info(){

        $api_key=$this->input->get('api_key');
        $api_key_response= $this->api_key_check($api_key,"1");

        if($api_key_response['status']!="success"){
            echo json_encode($api_key_response);
            exit; 
        }
        
        $user_id=$this->input->get('user_id');
        $email = $this->input->get('email');
        if($email) $email=urldecode($email);

        if(!$user_id && !$email){
            $response['status']='error';
            $response['message']="Provide either user ID or Email to filter";
            echo json_encode($response);
            exit;
        }

        if($user_id)
            $where['where']['id']=$user_id;
        if($email)
            $where['where']['email']=$email;

        $select="id,name,email,mobile,address,user_type,status,add_date,last_login_at,expired_date,package_id,last_login_ip";
        $user_info= $this->basic->get_data("users",$where,$select);

        if(!isset($user_info[0])){

            $response['status']='error';
            $response['message']="No Matching User Found";
            echo json_encode($response);
            exit;
        }

        $response['status']='success';
        $response['user_info']=$user_info[0];
        $response=json_encode($response);
        echo $response;

    }


    public function get_all_packages(){

        $api_key=$this->input->get('api_key');
        $api_key_response= $this->api_key_check($api_key,"1");

        if($api_key_response['status']!="success"){
            echo json_encode($api_key_response);
            exit; 
        }

        $select="id,package_name,module_ids,price,validity,deleted,visible,highlight";
        $package_info= $this->basic->get_data("package",'',$select);

        $response['status']='success';
        $response['user_info']=$package_info[0];
        $response=json_encode($response);
        echo $response;

    }



    // Member level funciton 

    public function subscriber_information(){


        $api_key=$this->input->get('api_key');
        $api_key_response= $this->api_key_check($api_key);

        if($api_key_response['status']!="success"){
            echo json_encode($api_key_response);
            exit; 
        }

        $user_id=$api_key_response['user_id']; 
        $subscriber_id=$this->input->get('subscriber_id');

        if(!$subscriber_id){
            $response['status']='error';
            $response['message']="Provide subscriber_id field";
            echo json_encode($response);
            exit;
        }

        if($subscriber_id)
            $where['where']['subscribe_id']=$subscriber_id;
            $where['where']['messenger_bot_subscriber.user_id']=$user_id;

        $select="subscribe_id as subscriber_id,contact_group_id as labels,first_name,last_name,full_name,gender,locale,timezone,page_name,messenger_bot_subscriber.page_id,unavailable,last_error_message,last_error_message_conversation as last_error_message_conversation_broadcast,refferer_source,subscribed_at,email,phone_number,birthdate,last_subscriber_interaction_time,";
        $join=array("facebook_rx_fb_page_info"=>"facebook_rx_fb_page_info.id=messenger_bot_subscriber.page_table_id,left");

        $subscriber_info= $this->basic->get_data("messenger_bot_subscriber",$where,$select,$join);

        if(!isset($subscriber_info[0])){

            $response['status']='error';
            $response['message']="No Matching Subscriber Found";
            echo json_encode($response);
            exit;
        }

        $response['status']='success';
        $response['subscriber_info']=$subscriber_info[0];
        $response=json_encode($response);
        echo $response;

    }



    public function get_all_labels(){

    	$api_key=$this->input->get('api_key');
        $api_key_response= $this->api_key_check($api_key);

        if($api_key_response['status']!="success"){
            echo json_encode($api_key_response);
            exit; 
        }

        $user_id=$api_key_response['user_id']; 
        $page_id=$this->input->get('page_id');

        if(!$page_id){
            $response['status']='error';
            $response['message']="Provide page_id field";
            echo json_encode($response);
            exit;
        }

     
        $where['where']=array("messenger_bot_broadcast_contact_group.user_id"=>$user_id,"facebook_rx_fb_page_info.page_id"=>$page_id,'bot_enabled'=>"1");
        $select="label_id,group_name as label_name";
        $join=array("facebook_rx_fb_page_info"=>"facebook_rx_fb_page_info.id=messenger_bot_broadcast_contact_group.page_id,left");

        $label_info= $this->basic->get_data("messenger_bot_broadcast_contact_group",$where,$select,$join);

        if(!isset($label_info[0])){

            $response['status']='error';
            $response['message']="No Matching Label Found";
            echo json_encode($response);
            exit;
        }

        $response['status']='success';
        $response['label_info']=$label_info;
        $response=json_encode($response);
        echo $response;

    }



    public function create_label(){

     	$api_key=$this->input->post('api_key',true);
     	$label_name=$this->input->post('label_name',true);
        $page_id=$this->input->post('page_id',true);

        $api_key_response= $this->api_key_check($api_key);

        if($api_key_response['status']!="success"){
            echo json_encode($api_key_response);
            exit; 
        }

        $user_id=$api_key_response['user_id']; 

        if(!$page_id){
            $response['status']='error';
            $response['message']="Provide page_id field";
            echo json_encode($response);
            exit;
        }

        else if(!$label_name){

        	$response['status']='error';
            $response['message']="Provide label_name field";
            echo json_encode($response);
            exit;
        }


      $getdata = $this->basic->get_data("facebook_rx_fb_page_info",array("where"=>array("page_id"=>$page_id,"user_id"=>$user_id,"bot_enabled"=>"1")));
      $page_access_token = isset($getdata[0]['page_access_token'])?$getdata[0]['page_access_token']:"";

      if($page_access_token==""){
      	$response['status']='error';
        $response['message']="No Enabled Bot Found";
        echo json_encode($response);
        exit;
      }

      $this->load->library('fb_rx_login');

      $response = $this->fb_rx_login->create_label($page_access_token,$label_name);
      if(isset($response['id']) && !empty($response['id']))
      { 
        $inserted_data = array(
          'user_id'=> $user_id,
          'group_name'=> $label_name,
          'label_id'=> $response['id'],
          'page_id'=> $page_id
        ); 

        if($this->basic->insert_data("messenger_bot_broadcast_contact_group",$inserted_data))
        {
          $return['status'] = "success";
          $return['label_id'] = $response['id'];
        }
        
      }
      if(isset($response['error']))
      {
        $return['status'] = "error";
        $return['message'] = $response['error'];
      }

      echo json_encode($return);
    }



    public function assign_label(){


    	$api_key=$this->input->post('api_key',true);
    	$psid=$this->input->post('subscriber_id',true);
        $fb_page_id=$this->input->post('page_id',true);
        $label_ids=$this->input->post('label_ids',true);
        $label_ids=explode(",",$label_ids);

        $api_key_response= $this->api_key_check($api_key);

        if($api_key_response['status']!="success"){
            echo json_encode($api_key_response);
            exit; 
        }

        $user_id=$api_key_response['user_id']; 


        $pageinfo=$this->basic->get_data("facebook_rx_fb_page_info",array("where"=>array("page_id"=>$fb_page_id,"user_id"=>$user_id,"bot_enabled"=>"1")));
        $page_auto_id=isset($pageinfo[0]["id"])?$pageinfo[0]["id"]:"";
        $page_access_token=isset($pageinfo[0]["page_access_token"])?$pageinfo[0]["page_access_token"]:"";

       	if($page_access_token==""){
	      	$response['status']='error';
	        $response['message']="No Enabled Bot Found";
	        echo json_encode($response);
	        exit;
        }

      	$label_info=$this->basic->get_data("messenger_bot_broadcast_contact_group",array("where_in"=>array("label_id"=>$label_ids)));

      	if(empty($label_info)){

      		$response['status']='error';
	        $response['message']="No Label Found";
	        echo json_encode($response);
	        exit;
      	}
        
        $this->load->library('fb_rx_login');
        
        foreach($label_info as $value){

            $label_auto_id=isset($value['id'])?$value['id']:0;
            $label_id=isset($value['label_id'])?$value['label_id']:"";
          
            $response= $this->fb_rx_login->assign_label($page_access_token,$psid,$label_id);

            if(isset($response['error'])){

			    $return['status'] = "error";
			    $return['message'] = $response['error']['message'];
			    echo json_encode($return);
			    exit; 
			}

            $subscriberdata=$this->basic->get_data("messenger_bot_subscriber",array("where"=>array("subscribe_id"=>$psid,"page_id"=>$fb_page_id)));

            $contact_group_id=isset($subscriberdata[0]["contact_group_id"])?$subscriberdata[0]["contact_group_id"]:"";
            $explode=explode(',', $contact_group_id);
            array_push($explode, $label_auto_id);
            $new=array_unique($explode);
            $contact_group_id=implode(',', $new);
            $contact_group_id=trim($contact_group_id,',');

            $this->basic->update_data("messenger_bot_subscriber",array("subscribe_id"=>$psid,"page_id"=>$fb_page_id),array("contact_group_id"=>$contact_group_id));

        }


    	$response['status']='success';
        $response=json_encode($response);
    	echo $response;

    }



}

