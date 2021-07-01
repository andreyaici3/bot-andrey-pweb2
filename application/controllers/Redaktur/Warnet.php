<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Warnet extends AUTH_Controller {

	public function __construct(){
		parent::__construct();
        $this->load->model('M_trx');
	}

	public function index(){
        $data = [
            'title' => 'Warnet',
            'menu'  => 'warnet',
            'list'  =>  $this->M_trx->get(date("m")),
            'submenu' => 'dashboard'
        ];
        $this->backend->views('_backend/warnet/index', $data);
	}

    public function add(){
        $data = [
            'title' => 'Warnet',
            'menu'  => 'warnet',
            'submenu' => 'dashboard'
        ];
        $this->backend->views('_backend/warnet/add', $data);
    }

    public function prosesAdd(){
        $data = $this->M_trx->save($this->input->post());
        $this->db->insert('ss_trx', $data);
        $this->M_trx->tambahSetoran($data['id_user'], 
            ($data['shift1'] != 0) ? $data['shift1'] : $data['shift2']
        );
        redirect('warnet');
    }

    public function rekap(){
        $data = [
            'title' => 'Rekap Laporan Warnet',
            'menu'  => 'warnet',
            'submenu' => 'rekap'
        ];
        $this->backend->views('_backend/warnet/rekap', $data);
    }



}
?>