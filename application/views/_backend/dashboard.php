<div class="page-heading">
    <h3>Statistics BOT Telegram</h3>
</div>
<div class="page-content">
    <section class="row">
        <div class="col-12 col-lg-12    ">
            <div class="row">
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="stats-icon purple">
                                        <i class="iconly-boldShow"></i>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h6 class="text-muted font-semibold">Pesan Masuk</h6>
                                    <h6 class="font-extrabold mb-0"><?= $this->db->get_where('kotak_masuk', ['visibility' => 1])->num_rows() ?> Pesan</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="stats-icon blue">
                                        <i class="iconly-boldProfile"></i>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h6 class="text-muted font-semibold">Pesan Keluar</h6>
                                    <h6 class="font-extrabold mb-0"><?php 
                                        $this->db->join('kotak_masuk', 'kotak_masuk.message_id = response.message_id');
                                        $this->db->where('kotak_masuk.visibility', 1);
                                        echo $this->db->get('response')->num_rows();
                                    
                                    ?> Pesan</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="stats-icon green">
                                        <i class="iconly-boldAdd-User"></i>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h6 class="text-muted font-semibold">Member</h6>
                                    <h6 class="font-extrabold mb-0"><?= $this->member->getMember()->num_rows() ?></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="stats-icon red">
                                        <i class="iconly-boldBookmark"></i>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h6 class="text-muted font-semibold">Request & response</h6>
                                    <h6 class="font-extrabold mb-0"><?= $this->db->get('format_request_response')->num_rows() ?></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </section>
    <section class="row">
        <div class="col-12 col-lg-12">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-8 mx-auto">
                                    <img src="<?= base_url(); ?>assets/images/samples/dashboard.png" class="img-fluid rounded mx-auto d-block">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>