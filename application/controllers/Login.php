<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Login extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_auth');
        $this->load->model('M_admin');
    }

    public function index()
    {
        $session = $this->session->userdata('status');

        if ($session == '') {
            $getCookie = get_cookie('uFapFap');
            if (isset($getCookie)) {
                $this->session->set_userdata('cookie', $getCookie);
            }
            $this->load->view('_backend/auth/login');
        } else {
            redirect('Home');
        }
    }

    public function sign()
    {
        $username = trim($_POST['uname']);
        $password = trim($_POST['passwd']);
        $data = $this->M_auth->login($username, $password);     

        if ($data == false) {
            $this->session->set_flashdata("msg", $this->alert->error_login("<br/>", "Please check your username or password. <br/> . Contact Admin " . $this->config->item('instance_name')));
            redirect('Login');
        } else {
            date_default_timezone_set('Asia/Jakarta');
            $session = [
                'userdata' => $data,
                'status' => "Loged in"
            ];

            $cookie = setcookie('uFapFap', sha1($username . $password . time()), time() + 604800);
            $arr = array("saveCookies" => $cookie);
            $this->db->update('users', $arr, ['users.email' => $username]);
            $this->session->set_userdata('file_manager', true);
            $this->session->set_userdata($session);
            $this->M_admin->update_cookie($cookie);
            redirect('Dashboard');
        }
    }

    public function out()
    {
        $this->session->sess_destroy();
        get_cookie('uFapFap');
        redirect('Login');
    }

    public function send()
    {
        error_reporting(0);
        date_default_timezone_set("asia/jakarta");
        $updates = file_get_contents("php://input");

        $pesan_balik = '';

        $updates = json_decode($updates, true);
        $pesan = $updates['message']['text'];
        $chat_id = $updates['message']['chat']['id'];

        $pesan = strtoupper($pesan);
        $datas = explode("#", $pesan);

        if ($datas[0] == "LOGIN") {
            $Email             = $datas[1];
            $Password         = $datas[2];
            $TanggalLahir     = $datas[3];

            $arr = array(
                'TokenTelegram' => $chat_id
            );
            $dataLogin = $this->M_auth->login($Email, $Password);
            if ($dataLogin == null) {
                $pesan_balik = "Mohon maaf login gagal, silahkan periksa Email, password, dan tanggal lahir.\n";
            } else {
                $result = $this->M_db->update('mis_members', $arr, 'Email', $dataLogin->Username);
                $result = $this->db->affected_rows();

                if ($result > 0) {
                    $pesan_balik = "Selamat kamu berhasil login, silahkan tunggu notifikasi surat masuk lainnya.";
                } else {
                    $pesan_balik = "Mohon maaf, kamu telah login dengan Token = " . $dataLogin->TokenTelegram;
                }
            }
        } elseif ($datas[0] == "DAFTAR") {
            $dataLagi['FirstName']     = $datas[1];
            $dataLagi['LastName']     = $datas[2];
            $dataLagi['Email']         = $datas[3];

            $InstanceName             = $datas[4];

            $dataLagi['InstanceID'] = $this->M_instance->select('', $InstanceName)->row()->ID;

            $cekData = $this->M_member->select('', '', $dataLagi['Email'])->num_rows();

            if ($cekData > 0) {
                $pesan_balik = "Email telah terpakai, silahkan gunakan email lainnya.";
            } else {
                $result = $this->M_member->simpan($dataLagi);
                $result = $this->db->affected_rows();

                if ($result > 0) {
                    $pesan_balik = "Terima kasih Data Anda sudah kami simpan, silahkan melakukan Login.\n\nEmail = " . $dataLagi['Email'] . "\nPassword = '123456789'\n\nTtd. Admin | " . $InstanceName;
                } else {
                    $pesan_balik = "Data gagal disimpan silahkan coba lagi";
                }
            }
        } elseif ($datas[0] == "/LOGIN") {
            $pesan_balik = "Format untuk LOGIN :\n\nLOGIN#EMAIL#PASSWORD#TANGGALLAHIR\n\nContoh :\nLOGIN#20190810043@uniku.ac.id#PASSWORD123#2001-06-17\n\n";
        } elseif ($datas[0] == "/REGISTER") {
            $pesan_balik = "Format untuk PENDAFTARAN :\n\nDAFTAR#[NAMADEPAN]#[NAMABELAKANG]#[EMAIL] \n\nContoh : \nDAFTAR#Mohammad#Irwansyah Somantri#mirwansyah1933@gmail.com\n\n";
        } elseif ($datas[0] == "/START") {
            $pesan_balik = "Selamat datang di MansurTele\n\n_Aku adalah robot notifikasi yang dibuat dengan tujuan untuk memberikan pemberitahuan adanya pesan masuk di akun kamu, ayo login ke akun kamu._ :D\n\nTtd. MansurTele | Manajemen Surat";
        } else {
            $pesan_balik = "Mohon maaf format yang Anda kirim salah, silahkan kirim ulang dengan format yang sudah ditentukan.\n\nTerimakasih\nTtd. Admin | Manajemen Surat";
        }
        if (isset($updates['message']['new_chat_member'])) {
            $pesan_balik .= "\n Lalalala";
        }
        //$chat_id = "612103810";
        //$pesan_balik = "Testing ".$updates['message']['text']." --- ".$datas[0];
        $url = "https://api.telegram.org/bot1019164591:AAEyQ6JnZa7Si7DNE6NmIXPI4UAq2peFbHo/sendMessage?parse_mode=markdown&chat_id=$chat_id&text=" . urlencode($pesan_balik);

        $ch = curl_init();

        $optArray = array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true
        );

        curl_setopt_array($ch, $optArray);
        $result = curl_exec($ch);

        $err = curl_error($ch);
        curl_close($ch);

        if ($err <> "") echo "Error: $err";
        else echo "{Woops, SudoKu in here, <a href='https://ilmungawur.club'>https://ilmungawur.club</a>}";
    }
    public function downloadPesan()
    {
        $data     = $this->input->get();

        $result = $this->M_mail->simpan_view($data);
        $send = "<script>
					window.open('" . base_url() . "assets/surat/" . $data['InstanceID'] . "/" . base64_decode($data['File']) . "', '_blank');
				</script>
					";
        echo $send;
    }
}
