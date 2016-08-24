<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Servers extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
#	public function index()
#	{
#		$this->load->view('welcome_message');
#	}
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

            $crud->set_theme('datatables');
            $crud->set_table('servers');
            $crud->set_subject('Servers');
            $crud->required_fields('name');
            $crud->set_relation('os_id','os','release');
            $crud->set_relation('status_id','status','statusname');
            $crud->set_relation_n_n('projects', 'projectkey', 'projects', 'server_id', 'project_id',  'name');
            $crud->set_relation_n_n('ip', 'ipkey', 'ipaddress', 'server_id', 'ip_id', 'ip');
            $crud->set_relation_n_n('Admin', 'adminkey', 'users', 'admin_id', 'user_id', 'login');
            $crud->set_relation_n_n('Owner', 'ownerkey', 'users', 'owner_id', 'user_id', 'login');

            $crud->columns('id', 'name', 'ip','projects','status_id',  'internet', 'cpu', 'hdd','Owner','Admin');
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
            $crud->set_relation('user_id','users','login');
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
            $crud->set_relation('server_id','servers','name');
            $crud->set_relation('user_id','users','login');
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
            $crud->set_relation('server_id','servers','name');
            $crud->set_relation('user_id','users','login');
            $crud->required_fields('server_id','user_id','note');
            $crud->columns('id', 'server_id','user_id','note');
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

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */