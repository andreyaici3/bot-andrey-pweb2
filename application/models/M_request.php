<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_request extends CI_Model {
    public function getRr($request = '', $response = '', $id = ''){
        if ($request != ''){
            $this->db->where('request', $request);
        }

        if ($response != ''){
            $this->db->where('response', $response);
        }

        if ($id != ''){
            $this->db->where('id', $id);
        }
        $this->db->order_by('request', 'ASC');
        return $this->db->get('format_request_response');   
    }

    public function add($array){
        $data = $this->save($array);
        $this->db->insert('format_request_response', $data);
        redirect('requestResponse', 'refresh');
    }

    public function save($data){
        $arr = [
            'request'   => $data['request'],
            'response'  => $data['response'],
            'regex'     => ( isset($data['regex']) ? 1 : 0 )
        ];
        return $arr;
    }

    public function delete($id){
        $this->db->delete('format_request_response', ['id' => $id]);
        redirect('requestResponse', 'refresh');
    }

    public function update($array){
        $data = $this->save($array);
        $this->db->update('format_request_response', $data, ['id' => $array['id']] );
        redirect('requestResponse', 'refresh');
    }
}