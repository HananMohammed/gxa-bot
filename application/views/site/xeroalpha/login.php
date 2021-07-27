<link href="<?php echo base_url('home/xit_load_files/css/new-style.css'); ?>" rel="stylesheet">
<style> </style>
	  <?php
          if($this->session->flashdata('login_msg')!='')
          {
              echo "<div class='alert alert-danger text-center'>";
                  echo $this->session->flashdata('login_msg');
              echo "</div>";
          }
          if($this->session->flashdata('reset_success')!='')
          {
              echo "<div class='alert alert-success text-center'>";
                  echo $this->session->flashdata('reset_success');
              echo "</div>";
          }
          if($this->session->userdata('reg_success') != ''){
            echo '<div class="alert alert-success text-center">'.$this->session->userdata("reg_success").'</div>';
            $this->session->unset_userdata('reg_success');
          }
          if(form_error('username') != '' || form_error('password')!="" )
          {
            $form_error="";
            if(form_error('username') != '') $form_error.=form_error('username');
            if(form_error('password') != '') $form_error.=form_error('password');
            echo "<div class='alert alert-danger text-center'>".$form_error."</div>";

          }
			$default_user = $default_pass ="";

        ?>

<div class="wrapper pd-5 pt-5 ei-faq-section position-relative" style="background: transparent;">
    <div class="logo-gaxa">
    <a href="<?php echo base_url();?>">
        <img style="max-height:45px !important" src="<?php echo base_url();?>assets/img/logo.png" alt="logo"></a>
</div>
    <div class="content" id="login" style="display:block">
    <div class="row" dir="rtl">
        <div class="col-sm-12 text text-center" style="direction:ltr;border-bottom: 1px solid #bbb8b8;margin-top: 15px;">
            <h6 style="color: #68129c ; font-size: 20px; font-weight: 600; margin-bottom: 15px;"><i class="fas fa-sign-in-alt"></i> Login</h6>
        </div>
        <div class="col-md-6 col-sm-12 mt-5 xs-mt" dir="ltr">
            <form method="POST" action="<?php echo base_url('home/login'); ?>" class="needs-validation">
                <input type="hidden" name="csrf_token"  id="csrf_token" value="<?php echo $this->session->userdata('csrf_token_session'); ?>">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input id="email" class="form-control" type="email" value="<?php echo $default_user ?>"  placeholder="Email"  name="username" tabindex="1" required autofocus>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" type="password"  class="form-control" value="<?php echo $default_pass ?>"  placeholder="Password"  name="password" tabindex="2" required>
                </div>
                <div class="forgot-pass">
                    <a href="<?php echo site_url();?>home/forgot_password"><?php echo $this->lang->line("Forgot Password?"); ?></a>
                </div>
                <button type="submit" class="new-btn"><i class="fas fa-sign-in-alt"></i> <?php echo $this->lang->line("Sign in"); ?></button>
                <div class="social pt-3" style="text-align: center;">
                    <?php echo $google_login_button2=str_replace("ThisIsTheLoginButtonForGoogle",$this->lang->line("Google"), $google_login_button); ?>
                    <?php echo $fb_login_button2=str_replace("ThisIsTheLoginButtonForFacebook",$this->lang->line("Facebook"), $fb_login_button); ?>
                </div>
                <?php if($this->config->item('enable_signup_form')!='0') : ?>
                    <div class="signup"><?php echo $this->lang->line("Don't have an account?"); ?>
                        <a  class=" pointer" style="color: #26063a;" href="<?php echo base_url('home/sign_up'); ?>"> <?php echo $this->lang->line("Create one"); ?></a>
                    </div>
                <?php endif; ?>

            </form>
        </div>
        <div class="col-md-6 col-sm-12 mt-5 pl-5 xs-mt mycontent-parent" dir="ltr">
            <div class="mycontent-left">
                <div class="row">
                    <div class="col-sm-3">
                        <img src="<?php echo base_url();?>assets/img/screenshot1.png">
                    </div>
                    <div class="col-sm-9 icons-text">
                        <h6>FACEBOOK MESSENGER BOT</h6>
                        <p>Turn Conversation Into Customer Loyalty- Smartest Replay For your facebook business</p>
                    </div>
                    <div class="col-sm-3">
                        <img src="<?php echo base_url();?>assets/img/screenshot4.png">
                    </div>
                    <div class="col-sm-9 icons-text">
                        <h6>MULTI SOCIAL AUTOMATION</h6>
                        <p>Bulk Post and auto share your Website, Youtube to Multi-Facebook Pages, Groups</p>
                    </div>
                    <div class="col-sm-3">
                        <img src="<?php echo base_url();?>assets/img/screenshot3.png">
                    </div>
                    <div class="col-sm-9 icons-text">
                        <h6>SMS & MAIL MARKETING</h6>
                        <p>Broadcast Email , SMS to Messenger Collected Emails, SMS or Custom imported list</p>
                    </div>
                    <div class="col-sm-3">
                        <img src="<?php echo base_url();?>assets/img/screenshot2.png">
                    </div>
                    <div class="col-sm-9 icons-text">
                        <h6>ECOMMERCE FEATURE</h6>
                        <p>Easy to set-up Ecommerce Store & Restaurant inside/outside Messenger and start selling online fast </p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
    <div class="opa">
         <span class="ei-faq-shape fq-shape-style1" data-parallax='{"x" : 50}'>
             <img src="<?php echo base_url('home/xit_load_files/images/fq-shape1.png'); ?>" alt="">
         </span>
         <span class="ei-faq-shape fq-shape-style2">
             <img src="<?php echo base_url('home/xit_load_files/images/fq-shape2.png'); ?>" alt="">
         </span>
         <span class="ei-faq-shape fq-shape-style3">
             <img src="<?php echo base_url('home/xit_load_files/images/fq-shape3.png'); ?>" alt="">
         </span>
         <span class="ei-faq-shape fq-shape-style4" data-parallax='{"y" : 60}'>
             <img src="<?php echo base_url('home/xit_load_files/images/fq-shape4.png'); ?>" alt="">
         </span>
         <span class="ei-faq-shape fq-shape-style5">
             <img src="<?php echo base_url('home/xit_load_files/images/fq-shape5.png'); ?>" alt="">
         </span>
         <span class="ei-faq-shape fq-shape-style6">
             <img src="<?php echo base_url('home/xit_load_files/images/fq-shape6.png'); ?>" alt="">
         </span>
         <span class="ei-faq-shape fq-shape-style8">
             <img src="<?php echo base_url('home/xit_load_files/images/fq-shape8.png'); ?>" alt="">
         </span>
         <span class="ei-faq-shape fq-shape-style7">
             <img src="<?php echo base_url('home/xit_load_files/images/fq-shape7.png'); ?>" alt="">
             <img src="<?php echo base_url('home/xit_load_files/images/fq-shape7.png'); ?>" alt="">
             <img src="<?php echo base_url('home/xit_load_files/images/fq-shape7.png'); ?>" alt="">
         </span>
    </div>
</div>
<div class="waveWrapper waveAnimation" style="position: fixed; bottom: 0;">
    <div class="bgTop">
        <div class="wave waveTop" style="background-image: url('<?php echo base_url('home/xit_load_files/images/b-shapeup.png'); ?>')"></div>
    </div>
    <div class=" bgMiddle">
        <div class="wave waveMiddle" style="background-image: url('<?php echo base_url('home/xit_load_files/images/b-shapemiddle.png'); ?>')"></div>
    </div>
    <div class="bgBottom">
        <div class="wave waveBottom" style="background-image: url('<?php echo base_url('home/xit_load_files/images/b-shapemiddle.png'); ?>')"></div>
    </div>
</div>
<div class="waveWrapper waveAnimation nav-link-style"  style="position: fixed; bottom: 0;">
    <div class="waveWrapperInner bgTop lni-sun">
        <div class="wave waveTop" style="background-image: url('<?php echo base_url('home/xit_load_files/images/dw1.png'); ?>')"></div>
    </div>
    <div class="waveWrapperInner bgMiddle lni-sun">
        <div class="wave waveMiddle" style="background-image: url('<?php echo base_url('home/xit_load_files/images/dw3.png'); ?>')"></div>
    </div>
    <div class="waveWrapperInner bgBottom lni-sun">
        <div class="wave waveBottom" style="background-image: url('<?php echo base_url('home/xit_load_files/images/dw3.png'); ?>')"></div>
    </div>
</div>
