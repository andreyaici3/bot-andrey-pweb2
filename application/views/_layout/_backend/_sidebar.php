<ul class="menu">
    <li class="sidebar-item">
        <a href="" class='sidebar-link'>
            <img src="assets/images/faces/1.jpg" alt="Face 1" width="20%">
            <span><?= $this->userdata->name ?></span>
        </a>
    </li>
    <li class="sidebar-title">Menu</li>

    <li class="sidebar-item <?= ($menu == 'dashboard') ? 'active' : '' ?>">
        <a href="<?= base_url('Dashboard') ?>" class='sidebar-link'>
            <i class="bi bi-grid-fill"></i>
            <span>Dashboard</span>
        </a>
    </li>

    <li class="sidebar-title">BOT ANDREY KOMPUTER</li>

    <li class="sidebar-item <?= ($menu == 'member') ? 'active' : '' ?>">
        <a href="<?= base_url('member') ?>" class='sidebar-link'>
            <i class="bi bi-hexagon-fill"></i>
            <span>Member</span>
        </a>
    </li>

    <li class="sidebar-item <?= ($menu == 'km') ? 'active' : '' ?>">
        <a href="<?= base_url('kotakMasuk') ?>" class='sidebar-link'>
            <i class="bi bi-hexagon-fill"></i>
            <span>Kotak Masuk</span>
        </a>
    </li>

    <li class="sidebar-item <?= ($menu == 'kk') ? 'active' : '' ?>">
        <a href="<?= base_url('kotakKeluar') ?>" class='sidebar-link'>
            <i class="bi bi-hexagon-fill"></i>
            <span>Kotak Keluar</span>
        </a>
    </li>

    <li class="sidebar-item <?= ($menu == 'fj') ? 'active' : '' ?>">
        <a href="<?= base_url('requestResponse') ?>" class='sidebar-link'>
            <i class="bi bi-hexagon-fill"></i>
            <span>Format Jawaban</span>
        </a>
    </li>

    <li class="sidebar-item">
        <a href="<?= base_url('start') ?>" target='_blank' class='sidebar-link'>
            <i class="bi bi-hexagon-fill"></i>
            <span>Start Bot</span>
        </a>
    </li>

    <li class="sidebar-item">
        <a href="<?= base_url('Logout') ?>" class='sidebar-link'>
            <i class="bi bi-puzzle"></i>
            <span>Logout</span>
        </a>
    </li>

</ul>