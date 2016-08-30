<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Servers extends CI_Controller {


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

    public function zones()
    {
        try {
            $crud = new grocery_CRUD();

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
    public function manage()
    {
        try {
            $crud = new grocery_CRUD();
            #$query = parent::db->query('select * from ipaddress');

            $crud->set_theme('datatables');
            $crud->set_table('servers');
            $crud->set_subject('Servers');
            $crud->required_fields('servername');
            $crud->set_relation('os_id','os','release');

            $crud->set_relation('status_id','status','statusname');
            $crud->set_relation_n_n('projects', 'projectkey', 'projects', 'server_id', 'project_id',  'name');
            $crud->set_relation_n_n('ip', 'mainipkey', 'ipaddress', 'server_id', 'ip_id', 'ip');
          #  $crud->set_relation_n_n('ip', 'serviphost', 'servers', 'servername', 'servername', 'ip');
            $crud->set_relation_n_n('hosts', 'hostskey', 'hosts', 'server_id', 'host_id', 'hostname');
            $crud->set_relation_n_n('Admin', 'adminkey', 'users', 'admin_id', 'user_id', 'Sername');
            $crud->set_relation_n_n('Owner', 'ownerkey', 'users', 'owner_id', 'user_id', 'Sername');

            $crud->columns('id', 'servername', 'ip','projects','status_id',  'internet', 'cpu', 'hdd','Owner','Admin');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }
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
    public function users()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('users');
            $crud->set_subject('users');
            $crud->required_fields('login','password','email');
            $crud->columns('user_id', 'login', 'email','sername');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }


    }

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

    public function troubles()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('troubles');
            $crud->set_subject('troubles');
            $crud->set_relation('server_id','servers','servername');
            $crud->set_relation('user_id','users','Sername');
            $crud->set_relation('project_id','projects','name');
            $crud->required_fields('server_id','user_id','trouble');
            $crud->columns('id', 'server_id','user_id','trouble');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }
    public function workdata()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('workdata');
            $crud->set_subject('workdata');
            $crud->set_relation('server_id','servers','servername');
            $crud->set_relation('service_id','services','servicename');
            $crud->set_relation('user_id','users','login');
            $crud->set_relation('project_id','projects','name');
            $crud->required_fields('server_id','user_id','note');
            $crud->columns('id', 'server_id','service_id','user_id','note');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }

    public function status()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('status');
            $crud->set_subject('status');
            $crud->required_fields('statusname');
            $crud->columns('status_id', 'statusname', 'comment');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }

    public function services()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('services');
            $crud->set_subject('Servises');
            $crud->required_fields('name');
            $crud->set_relation_n_n('ip', 'ipkey', 'ipaddress', 'host_id', 'ip_id', 'ip');

            $crud->set_relation('domain_id','domains','name');
            $crud->set_relation_n_n('Servers', 'srvsrckey', 'servers', 'service_id', 'server_id',  'servername');
            $crud->set_relation_n_n('Admin', 'adminkey', 'users', 'admin_id', 'user_id', 'Sername');
            $crud->set_relation_n_n('Owner', 'ownerkey', 'users', 'owner_id', 'user_id', 'Sername');
            $crud->set_relation_n_n('Project', 'srvprjkey', 'projects','server_id', 'project_id',  'name');
            $crud->columns('service_id', 'servicename','Hosts','Owner','Project');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }

    public function domains()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('domains');
            $crud->set_subject('domains');
            $crud->set_relation('user_id','users','login');
            $crud->set_relation('dnsreg_id','dnsreg','name');
            $crud->required_fields('name','expired');
            $crud->columns('domain_id', 'name', 'expired','user_id','dnsreg_id');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }


    public function hosts()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('hosts');
            $crud->set_subject('hosts');
            $crud->set_relation('domain_id','domains','name');

            $crud->set_relation_n_n('ip', 'ipkey', 'ipaddress', 'host_id', 'ip_id', 'ip');
            $crud->columns('host_id', 'hostname','domain_id','ip');
            $crud->required_fields('domain_id');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }


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

