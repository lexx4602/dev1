<?php
/**
 * Created by PhpStorm.
 * User: ABorisov
 * Date: 29.08.2016
 * Time: 11:07
 */
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class IPServ_query_model extends grocery_CRUD_model {

    private  $query_str = '';
    function __construct() {
        parent::__construct();
    }

    function get_list() {
        $query=$this->db->query($this->query_str);

        $results_array=$query->result();
        return $results_array;
    }

    public function set_query_str($query_str) {
        $this->query_str = $query_str;
    }
}