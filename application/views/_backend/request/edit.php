<section id="basic-horizontal-layouts">
    <div class="row match-height">
        <div class="col-md-6 col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">FORM INPUT FORMAT REQUEST DAN RESPONSE</h4>
                </div>
                <div class="card-content">
                    <div class="card-body">
                        <form class="form form-horizontal" method="POST" action="<?= base_url('prosesEditRequest') ?>">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Request</label>
                                    </div>
                                    <div class="col-md-8 form-group">
                                        <input type="text" name="request" placeholder="string request" class="form-control" value="<?= $data->request ?>" <?php
                                            if ($data->request == "noformat"|| $data->request == "/start" || $data->request == "daftar"){
                                                echo "readonly";
                                            }
                                        
                                        ?>>
                                        <input type="hidden" name="id" value="<?= $data->id ?>">
                                    </div>
                                    <div class="col-md-4">
                                        <label>String Response</label>
                                    </div>
                                    <div class="col-md-8 form-group">
                                        <textarea name="response" id="" cols="30" rows="10" class="form-control"><?= $data->response ?></textarea>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Bentuk Regex.?</label>
                                    </div>
                                    <div class="col-md-8 form-group">
                                        <input type="checkbox" <?= ($data->regex == 1) ? "checked" : "" ?> name="regex" value="Ya">Ya
                                    </div>
                                    <div class="col-sm-12 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>