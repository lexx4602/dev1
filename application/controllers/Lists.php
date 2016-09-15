<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Lists extends CI_Controller {


    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->helper('url');
        $this->load->library('grocery_CRUD');
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
     * Function network zones management (Lists)
     */
    public function zones()
    {
        try {
            $crud = new grocery_CRUD();
            $crud->unset_edit();
            $crud->set_theme('datatables');
            $crud->set_table('zones');
            $crud->set_subject('zones');
            $crud->required_fields('name');
            $crud->columns('zone_id', 'name','notes');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
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
     * Function ipaddress management (Lists)
     */
    public function ipaddress()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('ipaddress');
            $crud->set_subject('ipaddress');
            $crud->set_relation('zone_id','zones','name');
            $crud->required_fields('ip','zone_id');
            $crud->columns('id', 'ip', 'zone_id');
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

    /**
     * Function projects management
     */
    public function projects()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('projects');
            $crud->set_subject('projects');
            $crud->set_relation('user_id','users','Sername');
            $crud->display_as('user_id','Руководитель');
            $crud->display_as('name','Проект');
            $crud->display_as('comment','Краткое описание');
            $crud->display_as('contents','Описание');
            $crud->required_fields('name','user_id');
            $crud->columns('project_id', 'name', 'comment');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }
    /**
     *  Function systems management
     */
    public function systems()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('Systems');
            $crud->set_subject('Systems');
            $crud->set_relation_n_n('Projects','key_systprj','projects','system_id','project_id','name');
            $crud->set_relation_n_n('Owner','key_sysusr','users','system_id','user_id','sername');
            $crud->set_relation_n_n('Services','key_systsvc','services','system_id','service_id','servicename');
            $crud->required_fields('systemname','Owner','Projects','Services');
           #$crud->columns('project_id', 'name', 'comment');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }

    /**
     *   Function OS types management (Lists)
     */
    public function os()
{
    try {
        $crud = new grocery_CRUD();

        $crud->set_theme('datatables');
        $crud->set_table('os');
        $crud->set_subject('os');
        $crud->required_fields('name','release');
        $crud->columns('os_id', 'name', 'release');
        $output = $crud->render();
        $this->view_output($output);

    } catch (Exception $e) {
        show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
    }

}

    /**
     *  Function demons management (Lists)
     */
    public function demons()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('demons');
            $crud->set_subject('Applications');
            $crud->required_fields('demonname');
            $crud->columns('demon_id', 'demonname');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }



    /**
     *  Function Servers status management (Lists)
     */
    public function srvstatus()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('srvstatus');
            $crud->set_subject('srvstatus');
            $crud->required_fields('statusname');
            $crud->columns('status_id', 'statusname', 'comment');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }

    /**
     * Function task status management (Lists)
     */
    public function taskstatus()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('taskstatus');
            $crud->set_subject('taskstatus');
            $crud->required_fields('statusname');
            $crud->columns('taststatus_id', 'statusname', 'comment');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }

    /**
     *  Function domains management (Lists)
     */
    public function domains()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('domains');
            $crud->set_subject('domains');
            $crud->set_relation('project_id','projects','name');
            $crud->set_relation('dnsreg_id','dnsreg','name');
            $crud->required_fields('name','expired');
            $crud->columns('domain_id', 'name', 'expired','project_id','dnsreg_id');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }


    /**
     *  Function hosts management (Lists)
     * TODO: ACL support
     */
    public function hosts()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            #$crud->set_theme('twitter-bootstrap');
            $crud->set_table('hosts');
            $crud->set_subject('hosts');
            $crud->set_relation('domain_id','domains','name');

            $crud->set_relation_n_n('ip', 'key_ip', 'ipaddress', 'host_id', 'ip_id', 'ip');
            $crud->columns('host_id', 'hostname','domain_id','ip');
            $crud->required_fields('domain_id');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }


    /**
     *  Function DNS registrators management (Lists)
     */
    public function dnsreg()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('dnsreg');
            $crud->set_subject('dnsreg');
            $crud->required_fields('name');
            $crud->columns('dnsreg_id', 'name');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }


}

