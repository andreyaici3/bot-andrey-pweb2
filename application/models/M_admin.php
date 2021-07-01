<?php

defined('BASEPATH') or exit('No direct script access allowed');



class M_admin extends CI_Model{
    public function select($id = '', $cookie = '')
    {
        if ($id != '') {
            $this->db->where('users.email', $id);
        }

        if ($cookie != '') {
            $this->db->where('users.saveCookies', $cookie);
        }

        $data = $this->db->get('users');
        return $data->row();
    }

    public function update_cookie($cookie)
    {
        $array = array(
            'saveCookies'    => get_cookie('uFapFap')
        );

        $data = $this->db->where('email', $this->session->userdata('userdata')->email)
            ->update('users', $array);
        return $data;
    }
   
}

/* End of file M_admin.php */

/* Location: ./application/models/M_admin.php */