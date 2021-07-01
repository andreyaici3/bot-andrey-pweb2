<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends AUTH_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function index(){
        $data = [
            'title' => 'Dashboard',
            'menu'  => 'dashboard',
            'submenu' => ''
        ];
        $this->backend->views('_backend/dashboard', $data);
	}

    public function listMessageIn(){
        $data = [
            'title' => 'Kotak Masuk',
            'menu'  => 'km',
            'submenu' => '',
            'data'   => $this->api->getMessageIn()
        ];
        
        $this->backend->views('_backend/message/masuk', $data);
    }   

    public function listMessageOut(){
        $data = [
            'title' => 'Kotak Keluar',
            'menu'  => 'kk',
            'submenu' => '',
            'data'   => $this->api->getMessageOut()
        ];
        
        $this->backend->views('_backend/message/keluar', $data);
    }  
    
    public function listRr(){
        $data = [
            'title' => 'Request & Response',
            'menu'  => 'fj',
            'submenu' => '',
            'data'  => $this->request->getRr()->result()
        ];
        
        $this->backend->views('_backend/request/list', $data);
    }  

    public function listMember(){
        $data = [
            'title' => 'Daftar Member',
            'menu'  => 'member',
            'submenu' => '',
            'data'  => $this->member->getMember()->result()
        ];
        
        $this->backend->views('_backend/member/list', $data);
    }

    public function addRequest(){
        $data = [
            'title' => 'Tambah Format',
            'menu'  => 'fj',
            'submenu' => ''
        ];
        
        $this->backend->views('_backend/request/add', $data);
    }

    public function editRequest($id){
        $data = [
            'title' => 'Edit Format',
            'menu'  => 'fj',
            'submenu' => '',
            'data'  => $this->request->getRr('', '', $id)->row()
        ];
        
        $this->backend->views('_backend/request/edit', $data);
    }

    public function hapusRequest($id){
        $this->request->delete($id);
    }

    public function prosesRequest(){
        $this->request->add($this->input->post());   
    }

    public function hapusMember($id){
        $this->member->hapusMember($id);
    }

    public function prosesEditRequest(){
        $this->request->update($this->input->post());
    }

    public function cek(){
        $this->api->cek();
    }

}
?>