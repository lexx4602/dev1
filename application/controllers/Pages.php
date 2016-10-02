<?php

/**
 * Created by PhpStorm.
 * User: lexx
 * Date: 30.09.2016
 * Time: 15:01
 */
class Pages  extends CI_Controller {

    function index()
    {
        $data['main_content']='login_form';
        $this->load->view('includes/template',$data);

    }
    public function pages()
    {
        try {
            $crud = new grocery_CRUD();
            $crud->unset_edit();
            $crud->set_theme('datatables');
            $crud->set_table('pages');
            $crud->set_subject('Pages');
            $crud->required_fields('name');
            $crud->columns('zone_id', 'name','notes');
            $output = $crud->render();
            $this->view_output($output);

        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }

    }


}