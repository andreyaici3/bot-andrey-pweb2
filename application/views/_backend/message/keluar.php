<div class="page-content">
    <section class="row">
        <div class="col-md-12">
            <div class="card" style="min-height: 300px;">
                <div class="card-header">
                    <b>OUTBOX BOT</b>
                </div>
                <div class="card-body px-3 py-2-3">
                    <table class="table table-striped table-hovered" id="table1">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Waktu Kirim</th>
                                <th>ID Telegram</th>
                                <th>Isi Pesan</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i =1; foreach ($data as $key){ ?>
                                <tr>
                                    <td><?= $i++ ?></td>
                                    <td><?= $key->date_created ?></td>
                                    <td><?= $key->id_pengirim ?></td>
                                    <td><?= $key->response ?></td>
                                    <td align="center">
                                        <?php 
                                            if ($key->status == 0){
                                                echo "<span class='btn btn-xs btn-warning'>No Response</span>";
                                            } else if ($key->status == 1){
                                                echo "<span class='btn btn-xs btn-success'>Success</span>";
                                            } else {
                                                echo "<span class='btn btn-xs btn-danger'>Timeout</span>";
                                            }
                                        ?>
                                    </td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>        
    </section>
</div>