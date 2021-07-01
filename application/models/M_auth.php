<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_auth extends CI_Model {
	public function login($user, $pass) {
        $this->db->select('users.*');
        $this->db->from('users');
        $this->db->where('users.email', $user);
        $this->db->where('users.password', sha1(md5($pass)));
        $this->db->where('users.Active = 1');

        $data = $this->db->get();

		if ($data->num_rows() == 1) {
			return $data->row();
		} else {
			return false;
		}
	}
}

/* End of file M_auth.php */
/* Location: ./application/models/M_auth.php */