<?php $affiliate_id = isset($_GET['ref']) ? $_GET['ref']:"";?>
<link href="<?php echo base_url('home/xit_load_files/css/new-style.css'); ?>" rel="stylesheet">
<div class="wrapper pd-5 pt-5 ei-faq-section position-relative" style="background: transparent;">
    <!--    Start SignUp-->
    <div class="logo-gaxa">
        <a href="<?php echo base_url();?>">
            <img style="max-height:45px !important" src="<?php echo base_url();?>assets/img/logo.png" alt="logo"></a>
    </div>
    <div class="content" id="login" style="display:block">
        <div class="row" dir="rtl">
            <div class="col-sm-12 text text-center" style="direction:ltr;border-bottom: 1px solid #bbb8b8;margin-top: 15px;">
                <h6 style="color: #68129c ; font-size: 20px; font-weight: 600; margin-bottom: 15px;"><i class="fas fa-sign-in-alt"></i> Signup</h6>
            </div>
            <div class="col-md-6 col-sm-12 mt-5 xs-mt" dir="ltr">
                <?php
                if($this->session->userdata('reg_success') == 1) {
                    echo "<div class='alert alert-success text-center'>".$this->lang->line("An activation code has been sent to your email. please check your inbox to activate your account.")."</div>";
                    $this->session->unset_userdata('reg_success');
                }
                if($this->session->userdata('reg_success') == 'limit_exceed') {
                    echo "<div class='alert alert-danger text-center'>".$this->lang->line("Signup has been disabled. Please contact system admin.")."</div>";
                    $this->session->unset_userdata('reg_success');
                }
                if(form_error('name') != '' || form_error('email') != '' || form_error('confirm_password') != '' ||form_error('password')!="" )
                {
                    $form_error="";
                    if(form_error('name') != '') $form_error.=str_replace(array("<p>","</p>"), array("",""), form_error('name'))."<br>";
                    if(form_error('email') != '') $form_error.=str_replace(array("<p>","</p>"), array("",""), form_error('email'))."<br>";
                    if(form_error('password') != '') $form_error.=str_replace(array("<p>","</p>"), array("",""), form_error('password'))."<br>";
                    if(form_error('confirm_password') != '') $form_error.=str_replace(array("<p>","</p>"), array("",""), form_error('confirm_password'))."<br>";
                    echo "<div class='alert alert-danger text-center'>".$form_error."</div>";

                }
                if(form_error('captcha'))
                    echo "<div class='alert alert-danger text-center'>".form_error('captcha')."</div>";
                else if($this->session->userdata("sign_up_captcha_error")!='')
                {
                    echo "<div class='alert alert-danger text-center'>".$this->session->userdata("sign_up_captcha_error")."</div>";
                    $this->session->unset_userdata("sign_up_captcha_error");
                }
                ?>
                <form method="POST" action="<?php echo site_url('home/sign_up_action');?>">
                    <input type="hidden" name="csrf_token" id="csrf_token" value="<?php echo $this->session->userdata('csrf_token_session'); ?>">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text"  id="name"  placeholder="Name" name="name" class="form-control" value="<?php echo set_value('name');?>">
                    </div>
                    <div class="form-group">
                        <label for="name">Email</label>
                        <input type="email"  id="email" name="email" placeholder="Email" class="form-control" value="<?php echo set_value('email');?>" required >
                    </div>
                    <div class="form-group">
                        <label for="mobile">Phone Number</label>
                        <input type="number"  id="mobile" name="mobile" placeholder="Phone Number" class="form-control" value="<?php echo set_value('mobile');?>">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" type="password"  placeholder="Password"  name="password"  class="form-control"value="<?php echo set_value('password') ?>"  required>
                    </div>
                    <div class="form-group">
                        <label for="password2">Confirm Password</label>
                        <input id="password2" type="password"  placeholder="Confirm Password"  name="confirm_password"  class="form-control"value="<?php echo set_value('confirm_password') ?>" >
                    </div>
                    <div class="form-group">
                        <label for="captcha">Captcha</label>
                        <span id="basic-addon3" class="ml-3 text-right"><?php echo $num1. "+". $num2." = ?";?></span>
                        <input type="number" class="form-control" name="captcha" placeholder="<?php echo $this->lang->line("answer here"); ?>" required >
                    </div>
                    <div class="field">
                        <input type="radio" class="term" name="agree" required  id="agree">
                        <a target="_BLANK" href="<?php echo site_url();?>home/terms_use"><?php echo $this->lang->line("I agree with the terms and conditions");?></a>
                    </div>
                    <button type="submit" class="new-btn"><i class="fas fa-sign-in-alt"></i> <?php echo $this->lang->line("sign up"); ?></button>
                    <div class="signup"><?php echo $this->lang->line("Already a member?"); ?>
                        <a class="pointer" href=" <?php echo base_url('home/login_page'); ?>"><?php echo $this->lang->line("Signin Now"); ?></a>
                    </div>

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
    <!--    end SignUp-->
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

		
