<?php
/**
 * Created by PhpStorm.
 * User: ABorisov
 * Date: 27.09.2016
 * Time: 15:04
 */
class Membership_model extends CI_Model {

    function validate()
    {
        $this->db->where('login', $this->input->post('username'));
        $this->db->where('password', md5($this->input->post('password')));
        $query = $this->db->get('users');

        if($query->num_rows == 1)
        {
            return true;
        }

    }

    function create_member()
    {

        $new_member_insert_data = array(
            'sername' => $this->input->post('first_name'),
            'name' => $this->input->post('last_name'),
            'email' => $this->input->post('email_address'),
            'login' => $this->input->post('username'),
            'password' => md5($this->input->post('password'))
        );

        $insert = $this->db->insert('users', $new_member_insert_data);
        return $insert;
    }
}