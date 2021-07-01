
		<div id="navbar" class="navbar navbar-default ace-save-state">
			<div class="navbar-container ace-save-state" id="navbar-container">
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<div class="navbar-header pull-left">
					<a href="<?=base_url()?>Home" class="navbar-brand">
						<small>
							<i class="fa fa-book align-center"></i>
							<?=$this->config->item('base_name')?>
						</small>
					</a>
				</div>


				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">

						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="<?=base_url()?>assets/images/avatar/<?php if(empty($this->userdata->Image)){ echo "user.jpg"; }else{ echo $this->userdata->Image; } ?>" alt="<?=$this->userdata->name?>" />
								<span class="user-info">
									<small>Halo,</small>
									<?=$userdata->name?>
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								

								<li>
									<a href="<?=base_url()?>Profile">
										<i class="ace-icon fa fa-user"></i>
										Data Diri
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="<?=base_url()?>Logout">
										<i class="ace-icon fa fa-power-off"></i>
										Keluar
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div><!-- /.navbar-container -->
		</div>