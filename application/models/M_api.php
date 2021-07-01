<?php

defined('BASEPATH') or exit('No direct script access allowed');

class M_api extends CI_Model {

    private $botToken = "1821592046:AAE8hvGka2U7TjAYJhaROCKwlaOgcyHSRE8";

    public function __construct(){
        parent::__construct();
        $this->load->model('M_member', 'member');
    }

    public function getApi(){
        $ch = curl_init();
        $API = "https://api.telegram.org/bot". $this->botToken ."/getUpdates";
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
        curl_setopt($ch, CURLOPT_URL, $API);
        $result = curl_exec($ch);
        curl_close($ch);
        $data =  $result;

        $data = json_decode($data);


        foreach ($data->result as $key){
            $arr[] = [
                
                    'id'    => $key->update_id,
                    'pesan' => $key->message  
                
            ];
        }

        return $arr;   
    }

    public function insert(){
        $data = $this->getApi();
        foreach ($data as $key){
            $result = $this->db->get_where('kotak_masuk', ['update_id' => $key['id']])->num_rows();
            if ($result == 0){
                $kotakMasuk = [
                    'update_id' => $key['id'],
                    'message_id'=> $key['pesan']->message_id,
                    'id_pengirim'   => $key['pesan']->from->id,
                    'date'  => date('Y-m-d H:i:s', $key['pesan']->date),
                    'text'  => $key['pesan']->text
                ];
                $this->db->insert('kotak_masuk', $kotakMasuk);
                $response = [
                    'message_id'=> $key['pesan']->message_id,
                    'status'    => 0
                ];
                $this->db->insert('response', $response);
            }
        }
    }

    public function getMessageIn(){
        $this->insert();
        $data = $this->db
                ->order_by('date', 'DESC')
                ->get('kotak_masuk');   
        return $data->result();
    }

    public function getMessageOut(){
        $this->insert();
        $data = $this->db
                ->join('kotak_masuk', 'kotak_masuk.message_id = response.message_id')
                ->order_by('date_created', 'DESC')
                ->get('response');   
        return $data->result();
    }
    
  

    public function cek(){
        $this->insert();
        $kotakMasuk = $this->db->get('kotak_masuk')->result();
        
        foreach ($kotakMasuk as $key){
            $row = $this->db->get_where('response', ['message_id' => $key->message_id])->row();
            
            if ($row->status == 0){
                
                $reg = "/[a-zA-Z0-9_]+/";
                preg_match_all($reg, $key->text, $hasil);
                $cekPendaftaran = $this->db->get_where('member', ['id_pengirim' => $key->id_pengirim])->num_rows();
                $format = $this->db
                    ->like('request', $hasil[0][0], 'both')
                    ->get('format_request_response')->row();

                
                
                //PENDAFTARAN
                if (strtolower($hasil[0][0]) == "daftar"){
                    if (@$hasil[0][1] != "" && @$hasil[0][2] != ""){
                        $data = $this->member->daftar($this->regex($key->text, $format->response), $key->id_pengirim);
                        if ( $data['status'] == 1 && @$data['id_pengirim'] != 1 ){
                            $pesan = "Pendaftaran ". $data['nama']. " Berhasil. Silahkan Untuk Bertransaksi";
                            $this->sendMessage($pesan, $key->id_pengirim);
                            $status = [
                                'status' => 1,
                                'response' => $pesan
                            ];
                        } else if ($data['status'] == 1 && $data['id_pengirim'] == 1){
                            $pesan = "Sorry!, Anda Sudah Terdaftar Di Sistem";
                            $this->sendMessage($pesan, $key->id_pengirim);
                            $status = [
                                'status' => 1,
                                'response' => $pesan
                            ];
                        }
                        $this->db->update('response', $status, ['id' => $row->id]);
                    } else {
                        $pesan = "Gunakan Format DAFTAR#NAMA#NOHP#ALAMAT Untuk melakukan Pendfataran";
                        $this->sendMessage($pesan, $key->id_pengirim);
                        $status = [
                            'status' => 1,
                            'response' => $pesan
                        ];
                        $this->db->update('response', $status, ['id' => $row->id]);
                    }
                } else if (strtolower($hasil[0][0]) == "un"){
                    if ($cekPendaftaran == 1){
                        
                        if (@$hasil[0][1] != ""){
                            $data = $this->member->updateName($hasil, $key->id_pengirim);

                            if ($data['status'] == 1){
                                $pesan = "Nama Berhasil Diubah";
                                $this->sendMessage($pesan, $key->id_pengirim);
                                $status = [
                                    'status' => 1,
                                    'response' => $pesan
                                ];
                                $this->db->update('response', $status, ['id' => $row->id]);
                            }
                        } else {
                            $pesan = "Gunakan Format UN#NAMA Untuk melakukan Ubah Nama";
                            $this->sendMessage($pesan, $key->id_pengirim);
                            $status = [
                                'status' => 1,
                                'response' => $pesan
                            ];
                            $this->db->update('response', $status, ['id' => $row->id]);
                        }


                    } else {
                        $pesan = $this->db->get_where('format_request_response', ['request' => "nodaftar"])->row()->response;
                        $this->harusDaftar($pesan, $key->id_pengirim, $row->id);
                    }
                }
                
                else if (strtolower($hasil[0][0]) == "ch"){
                    if ($cekPendaftaran == 1){
                        $pesan = $this->db->get_where('format_request_response', ['request' => $key->text])->row()->response;
                        $this->sendMessage($pesan, $key->id_pengirim);
                        $status = [
                            'status' => 1,
                            'response' => $pesan
                        ];
                        $this->db->update('response', $status, ['id' => $row->id]); 
                    } else {
                        $pesan = $this->db->get_where('format_request_response', ['request' => "nodaftar"])->row()->response;
                        $this->harusDaftar($pesan, $key->id_pengirim, $row->id);
                    }
                    
                }

                else if (strtolower($hasil[0][0]) == strtolower("PROFILE")){
                    if ($cekPendaftaran == 1){
                        $profile = $this->db->get_where('member', ['id_pengirim' => $key->id_pengirim])->row();
                        $pesan = "DATA IDENTITAS KAMU YANG SAAT INI TERDAFTAR\nNama: $profile->nama\nNo Hp: $profile->no_hp\nAlamat: $profile->alamat\nID Telegram: $profile->id_pengirim\nSaldo: $profile->saldo\nTanggal Daftar: " . $profile->date_create;
                        $this->sendMessage($pesan, $key->id_pengirim);
                        $status = [
                            'status' => 1,
                            'response' => $pesan
                        ];
                        $this->db->update('response', $status, ['id' => $row->id]); 
                    } else {
                        $pesan = $this->db->get_where('format_request_response', ['request' => "nodaftar"])->row()->response;
                        $this->harusDaftar($pesan, $key->id_pengirim, $row->id);
                    }
                    
                }

               
                //PENDAFTARAN
                else {
                    if ($format != null){
                        if ($format->regex == 0){
                            
                            if ($cekPendaftaran == 1 || $format->request == "/start"){
                                $pesan = $this->db->get_where('format_request_response', ['request' => $format->request])->row()->response;
                                $this->sendMessage($pesan, $key->id_pengirim);
                                $status = [
                                    'status' => 1,
                                    'response' => $pesan
                                ];
                                $this->db->update('response', $status, ['id' => $row->id]);   
                            } 
                            else {
                                $pesan = $this->db->get_where('format_request_response', ['request' => "nodaftar"])->row()->response;
                                $this->harusDaftar($pesan, $key->id_pengirim, $row->id);
                                
                            }
                        }
                    } else {

                         
                       
                            $pesan = $this->request->getRr('noformat')->row()->response;
                            $this->sendMessage($pesan, $key->id_pengirim);
                            $status = [
                                'status' => 1,
                                'response' => $pesan
                            ];
                            $this->db->update('response', $status, ['id' => $row->id]);   
                       

                    }
                }
                
            }
        }
        $this->load->view('ref');        
    }

    public function harusDaftar($pesan, $id, $ids){
        $this->sendMessage($pesan, $id);
        $status = [
            'status' => 1,
            'response' => $pesan
        ];
        $this->db->update('response', $status, ['id' => $ids]); 
    }

    public function regex($input, $regex){
        $hasil = [];
        preg_match_all($regex, $input, $hasil);
        return $hasil;
    }

    public function sendMessage($pesan, $chatId) {
        $pesan = [
            'text'  => $pesan,
            'chat_id' => $chatId
        ];
        $API = "https://api.telegram.org/bot". $this->botToken ."/sendmessage?". http_build_query($pesan);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
        curl_setopt($ch, CURLOPT_URL, $API);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }

    
}