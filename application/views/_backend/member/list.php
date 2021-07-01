<div class="page-content">
    <section class="row">
        <div class="col-md-12">
            <div class="card" style="min-height: 300px;">
                <div class="card-header">
                    <b>INBOX BOT</b>
                </div>
                <div class="card-body px-3 py-2-3">
                    <table class="table table-striped table-hovered" id="table1">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Tanggal Daftar</th>
                                <th>ID Telegram</th>
                                <th>Nama</th>
                                <th>No Hp</th>
                                <th>Alamat</th>
                                <th>Saldo</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i =1; foreach ($data as $key){ ?>
                                <tr>
                                    <td><?= $i++ ?></td>
                                    <td><?= $key->date_create ?></td>
                                    <td><?= $key->id_pengirim ?></td>
                                    <td><?= $key->nama ?></td>
                                    <td><?= $key->no_hp ?></td>
                                    <td><?= $key->alamat ?></td>
                                    <td><?= "Rp. " . number_format($key->saldo) ?></td>
                                    <td><a href="<?= base_url('hapusMember/' . $key->kode_member) ?>" class="btn btn-xs btn-danger">Hapus</a></td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>        
    </section>
</div>