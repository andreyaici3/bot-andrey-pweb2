<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_member extends CI_Model {

    public function daftar($input, $idTelegram){
        $status = $this->db->get_where('member', ['id_pengirim' => $idTelegram]);
        if ($status->num_rows() == 0){
            $data = [
                'nama'  => str_replace("#", "", $input[0][0]),
                'no_hp' => str_replace("#", "", $input[0][1]),
                'alamat' => str_replace("#", "", $input[0][2]),
                'pin'   => '1234',
                'saldo' => 0,
                'id_pengirim' => $idTelegram
            ];
            
            $this->db->insert('member', $data);
            $data['status'] = 1;
            
        } else {
            $data = [
                'status' => 1,
                'id_pengirim' => 1,
                'id_telegram' => $idTelegram
            ];
        }  
        return $data;  
    }

    public function updateName($input, $idTelegram){
        $status = $this->db->get_where('member', ['id_pengirim' => $idTelegram]);
        
        if ($status->num_rows() == 1){
            $data = [
                'nama'  =>$input[0][1]
            ];
            
            $this->db->update('member', $data, ['id_pengirim' => $idTelegram]);
            $data['status'] = 1;
            return $data;
        }
    }

    public function getMember($id = ''){
        if ($id != ''){
            $this->db->where('id_pengirim', $id);
        }
        return $this->db->get('member');
    }

    public function hapusMember($id = '', $idTelegram = ''){
        if ($id != ''){
            $this->db->where('kode_member', $id);
        }
        if ($idTelegram != ''){
            $this->db->where('id_pengirim', $idTelegram);
        }
        $this->db->delete('member');
        redirect('member', 'refresh');
    }
}

/* End of file M_admin.php */
/* Location: ./application/models/M_admin.php */
