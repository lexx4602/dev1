<?php

/**
 * Created by PhpStorm.
 * User: ABorisov
 * Date: 27.09.2016
 * Time: 14:55
 */
class Site extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->is_logged_in();
    }

    function members_area()
    {
        $this->load->view('logged_in_area');
    }

    function another_page() // just for sample
    {
        echo 'good. you\'re logged in.';
    }

    function is_logged_in()
    {
        $is_logged_in = $this->session->userdata('is_logged_in');
        $username = $this->session->userdata('username');
        if (!isset($is_logged_in) || $is_logged_in != true) {
            echo 'You don\'t have permission to access this page. <a href="../login">Login</a>';
            die();
            //$this->load->view('login_form');
        }
    }

}