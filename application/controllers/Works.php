<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Works extends CI_Controller {


    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->helper('url');
        $this->load->library('grocery_CRUD');
        $this->is_logged_in();
    }

    function is_logged_in()
    {
        $is_logged_in = $this->session->userdata('is_logged_in');
        if (!isset($is_logged_in) || $is_logged_in != true) {
            echo 'You don\'t have permission to access this page. <a href="/Login">Login</a>';
            die();
            //$this->load->view('login_form');
        }
    }

    public function view_output($output = null)
    {
        $this->load->view('default.php', $output);
    }

    public function index()
    {
        $this->view_output((object)array('output' => '', 'js_files' => array(), 'css_files' => array()));
    }


       /**
     *  Function trouble tickets management
     */
    public function troubles()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('troubles');
            $crud->set_subject('troubles');
            $crud->set_relation('server_id','servers','servername');
            $crud->set_relation('user_id','users','sername');
            $crud->set_relation('project_id','projects','name');
            $crud->set_relation('taskstatus_id','taskstatus','statusname');
            $crud->set_relation('parent_id','troubles','trouble');
            $crud->required_fields('server_id','user_id','trouble');
            $crud->columns('id', 'server_id','user_id','trouble','taskstatus_id');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }

    /**
     *  Function collection planning work management
     */
    public function workdata()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('workdata');
            $crud->set_subject('workdata');
            $crud->set_relation('server_id','servers','servername');
            $crud->set_relation('service_id','services','servicename');
            $crud->set_relation('user_id','users','sername');
            $crud->set_relation('taskstatus_id','taskstatus','statusname');
            $crud->set_relation('project_id','projects','name');
            $crud->required_fields('server_id','user_id','note');
            $crud->columns('id', 'server_id','service_id','user_id','note','taskstatus_id');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }
    public function scenarios()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('scenarios');
            $crud->set_subject('Scenarios');
            $crud->set_relation('user_id','users','sername');
            $crud->required_fields('server_id','user_id','note');
            $crud->columns('header','name', 'updated','user_id');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }


    function log_after_insert($post_array,$primary_key)
    {
        $user_logs_insert = array(
            "user_id" => $primary_key,
            "created" => date('Y-m-d H:i:s'),
            "last_update" => date('Y-m-d H:i:s')
        );

        $this->db->insert('user_logs',$user_logs_insert);

        return true;
    }


}

