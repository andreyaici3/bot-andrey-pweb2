<div class="page-content">
    <section class="row">
        <div class="col-md-12">
            <div class="card" style="min-height: 300px;">
                <div class="card-header">
                    <b>FORMAT REQUEST & RESPONSE</b>
                </div>
                <div class="card-body px-3 py-2-3">
                    <table class="table table-striped table-hovered" id="table1">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Request</th>
                                <th>Response</th>
                                <th>Status Regex</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i =1; foreach ($data as $key){ ?>
                                <tr>
                                    <td><?= $i++ ?></td>
                                    <td><?= $key->request ?></td>
                                    <td><?= $key->response ?></td>
                                    <td align="center">
                                        <?php 
                                            if ($key->regex == 0){
                                                echo "<span class='btn btn-xs btn-success'>Bukan Regex</span>";
                                            } else {
                                                echo "<span class='btn btn-xs btn-primary'>Regex</span>";
                                            }
                                        ?>
                                    </td>
                                    <td align="center">
                                        <?php
                                            if ($key->request != "/start" && $key->request != "noformat" && $key->request != "daftar" ){
                                                echo "<a href='". base_url('hapusRequest/' . $key->id) . "' class='btn btn-xs btn-danger'>hapus</a>";
                                            }
                                        ?>
                                        <a href='<?= base_url('editRequest/' . $key->id) ?>' class='btn btn-xs btn-success'>Edit</a>
                                    </td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                    <a class="btn btn-primary" href="<?= base_url('addRequest') ?>">Tambah Format</a>
                </div>
                
            </div>
        </div>        
    </section>
</div>