<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admins extends CI_Controller {


    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->helper('url');
        $this->load->library('grocery_CRUD');
        $this->is_logged_in();
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
    public function roles()
    {
        try {
            $crud = new grocery_CRUD();

            #$crud->set_theme('datatables');
            $crud->set_table('Object');
            $crud->set_subject('Roles');
            $crud->set_relation('lists','acltype','acltypename');
            $crud->set_relation('pages','acltype','acltypename');
            $crud->set_relation('users','acltype','acltypename');
            $crud->set_relation('systems','acltype','acltypename');
            $crud->set_relation_n_n('system_n', 'key_sysobj', 'Systems',  'object_id','system_id', 'systemname');
            $crud->set_relation('servers','acltype','acltypename');
            $crud->set_relation_n_n('Server_n', 'key_srvobj', 'servers',  'object_id','server_id', 'servername');

            $crud->set_relation('services','acltype','acltypename');
            $crud->set_relation_n_n('Service_n', 'key_svcobj', 'services',  'object_id','service_id', 'servicename');

            $crud->set_relation('hosts','acltype','acltypename');
            $crud->set_relation_n_n('Host_n', 'key_hostobj', 'hosts',  'object_id','host_id', 'hostname');

            $crud->set_relation('projects','acltype','acltypename');
            $crud->set_relation_n_n('project_n', 'key_prjobj', 'projects',  'object_id','project_id', 'name');


             $crud->columns(array('objectname','lists','pages','users','systems','system_n','servers','server_n','services','service_n',
                'hosts','Host_n','projects','project_n'));

            $crud->required_fields('objectname','comment');
          #  $crud->columns('objectname','comment');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }

    function is_logged_in()
    {
        $is_logged_in = $this->session->userdata('is_logged_in');
        if (!isset($is_logged_in) || $is_logged_in != true) {
            echo 'You don\'t have permission to access this page. <a href="/login">Login</a>';
            die();
            //$this->load->view('login_form');
        }
    }


    /**
     * Function groups management
     */
    public function groups()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('groups');
            $crud->set_subject('Groups');
            #  $crud->field_type('groupname', 'readonly');
            $crud->set_relation_n_n('Groups', 'key_usrgp', 'users', 'group_id', 'user_id', 'Sername');
            $crud->required_fields('groupname');
            $crud->columns('group_id', 'groupname', 'note');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    /**
     *Function users management
     */
    public function users()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('users');
            $crud->set_subject('users');
            $crud->set_relation_n_n('Groups', 'key_usrgp', 'groups',  'user_id','group_id', 'groupname');
            $crud->field_type('password', 'password');
            $crud->required_fields('login','password','email');
            # $crud->add_fields('login','password','email');
            $crud->columns('user_id', 'login', 'email','sername');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }



}

