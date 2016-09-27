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


    /**
     * Function network zones management
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
     * Function Servers management
     */
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
            $crud->field_type('internet','true_false');
            $crud->set_relation('status_id','srvstatus','statusname');
            $crud->set_relation_n_n('projects', 'key_project', 'projects', 'server_id', 'project_id',  'name');
            $crud->set_relation_n_n('ip', 'key_mainip', 'ipaddress', 'server_id', 'ip_id', 'ip');
          #  $crud->set_relation_n_n('ip', 'serviphost', 'servers', 'servername', 'servername', 'ip');
            $crud->set_relation_n_n('hosts', 'key_hosts', 'hosts', 'server_id', 'host_id', 'hostname');
            $crud->set_relation_n_n('Admin', 'key_admin', 'users', 'admin_id', 'user_id', 'Sername');
            $crud->set_relation_n_n('Owner', 'key_owner', 'users', 'owner_id', 'user_id', 'Sername');

            $crud->columns('id', 'servername', 'ip','projects','status_id',  'internet', 'cpu', 'hdd','Owner','Admin');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }


    /**
     * Function ipaddress management
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
     *   Function OS types management
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
     *  Function demons management
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
            $crud->set_relation('user_id','users','Sername');
            $crud->set_relation('project_id','projects','name');
            $crud->set_relation('taststatus_id','taskstatus','statusname');
            $crud->required_fields('server_id','user_id','trouble');
            $crud->columns('id', 'server_id','user_id','trouble','taststatus_id');
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
            $crud->set_relation('user_id','users','login');
            $crud->set_relation('taststatus_id','taskstatus','statusname');
            $crud->set_relation('project_id','projects','name');
            $crud->required_fields('server_id','user_id','note');
            $crud->columns('id', 'server_id','service_id','user_id','note','taststatus_id');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }
    /**
     *  Function Servers status management
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
     * Function task status management
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
     * Function Services management
     */
    public function services()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('services');
            $crud->set_subject('Servises');
            $crud->required_fields('name');
            $crud->set_relation_n_n('ip', 'key_ip', 'ipaddress', 'host_id', 'ip_id', 'ip');
            $crud->set_relation('host_id','hosts','hostname');
            $crud->set_relation_n_n('Servers', 'key_srvsrc', 'servers', 'service_id', 'server_id',  'servername');
            $crud->set_relation_n_n('Admin', 'key_svcadm', 'users', 'admin_id', 'user_id', 'Sername');
            $crud->set_relation_n_n('Owner', 'key_svcown', 'users', 'owner_id', 'user_id', 'Sername');
            $crud->set_relation_n_n('Project', 'key_srvprj', 'projects','server_id', 'project_id',  'name');
            $crud->set_relation_n_n('Application', 'key_dmnsvc', 'demons', 'service_id', 'demon_id', 'demonname');
            $crud->columns('service_id', 'servicename','host_id','Owner','Project');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }
    /**
     *  Function domains management
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
     *  Function hosts management
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
     *  Function DNS registrators management
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

