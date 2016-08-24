<?php
/**
 * Created by PhpStorm.
 * User: ABorisov
 * Date: 23.08.2016
 * Time: 15:34
 */


if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ipaddress extends CI_Controller
{

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

    public function manage()
    {
        try {
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('ipaddress');
            $crud->set_subject('ipaddress');
            $crud->required_fields('name','zone_id');
 #           $crud->columns('id', 'name', 'status', 'project_id', 'internet', 'os_id', 'cpu', 'hdd', 'note', 'comment', 'url', 'ip_id', 'admin_id');
            $crud->columns('id', 'ip', 'zone_id');

            $output = $crud->render();

            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }
}