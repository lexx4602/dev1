<?php
/**
 * Created by PhpStorm.
 * User: ABorisov
 * Date: 13.10.2016
 * Time: 18:14
 */
class Dynmenu extends CI_Controller {


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

    public function groups()
    {
        try {
            $crud = new grocery_CRUD();
            $crud->unset_edit();
            $crud->set_theme('datatables');
            $crud->set_table('dyn_groups');
            $crud->set_subject('Menu Groups');
            #$crud->required_fields('name');
            #$crud->columns('zone_id', 'name','notes');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }

    public function menu()
    {
        try {
            $crud = new grocery_CRUD();
            $crud->unset_edit();
            $crud->set_theme('datatables');
            $crud->set_table('dyn_menu');
            $crud->set_subject('Menu Points');
            #$crud->required_fields('name');
            #$crud->columns('zone_id', 'name','notes');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }




}