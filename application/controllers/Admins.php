<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admins extends CI_Controller {


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
     *  Function trouble tickets management
     */
    public function roles()
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



}
