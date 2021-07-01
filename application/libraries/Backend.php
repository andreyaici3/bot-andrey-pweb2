<?php
	class Backend {
		protected $_ci;

		function __construct() {
			$this->_ci = &get_instance(); //Untuk Memanggil function load, dll dari CI. ex: $this->load, $this->model, dll
		}

		function views($template = NULL, $data = NULL) {
			if ($template != NULL) {
				$data['_header'] 				= $this->_ci->load->view('_layout/_backend/_header', $data, TRUE);
				//Menu
				// $data['_menu'] 					= $this->_ci->load->view('_layout/_backend/_menu', $data, TRUE);
				//Sidebar
				$data['_sidebar'] 				= $this->_ci->load->view('_layout/_backend/_sidebar', $data, TRUE);
				// //Content
				$data['_mainContent'] 			= $this->_ci->load->view($template, $data, TRUE);
				$data['_content'] 				= $this->_ci->load->view('_layout/_backend/_content', $data, TRUE);
				//
                $data['_breadcrumb'] 				= $this->_ci->load->view('_layout/_backend/_breadcrumb', $data, TRUE); 
				$data['_footer'] 				= $this->_ci->load->view('_layout/_backend/_footer', $data, TRUE);

				echo $data['_template'] 		= $this->_ci->load->view('_layout/_backend/_template', $data, TRUE);
			}
        }
        
        public function DateEnToIn($tanggal){
            $pecah = explode('-', $tanggal);
            $tahun = $pecah[0];
            $bulan = $pecah[1];
            $tanggal = $pecah[2];
            $pecahs = explode(' ', $tanggal);

            return $pecahs[0] . '-' . $bulan . '-' . $tahun . " " . $pecahs[1];
        }

        public function dateIn($tanggal){
            $duaBagian = explode(' ', $tanggal);
            $new = $this->DateEnToIn($duaBagian[0]);
            return $new . ' ' . $duaBagian[1];
        }
	}
	
?>