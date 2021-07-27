<?php
/*
Theme Name: Xeroalpha Theme 
Unique Name: Xeroalpha Theme
Theme URI: https://btngroup.shop
Author: BTN Group
Author URI: https://btngroup.shop
Version: 0.0.2
Description: Custom Landing Page theme for Xerochat
*/
?>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Mobile Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title><?php echo $this->config->item('product_name'); if($this->config->item('slogan')!='') echo " | ".$this->config->item('slogan')?></title>
    <meta name="description" content="<?php echo $this->config->item('slogan'); ?>">
    <meta name="author" content="<?php echo $this->config->item('institute_address1');?>">
<!-- OG Meta Tags to improve the way the post looks when you share the page on LinkedIn, Facebook, Google+ -->
    <meta property="og:site_name" content="<?php echo $this->config->item('product_name'); ?>" /> <!-- website name -->
    <meta property="og:site" content="<?php echo $this->config->item('slogan'); ?>" /> <!-- website link -->
    <meta property="og:title" content="<?php echo $this->config->item('product_name'); ?>"/> <!-- title shown in the actual shared post -->
    <meta property="og:description" content="<?php echo $this->config->item('slogan'); ?>" /> <!-- description shown in the actual shared post -->
    <meta property="og:image" content="<?php echo base_url();?>assets/img/favicon.png" /> <!-- image link, make sure it's jpg -->
    <meta property="og:url" content="<?php echo base_url();?>" /> <!-- where do you want your post to link to -->
    <meta property="og:type" content="article" />

    <!-- Website Title -->
    <title><?php echo $this->config->item('product_name'); if($this->config->item('slogan')!='') echo " | ".$this->config->item('slogan')?></title>
    
    <!-- Styles -->
    <link href="<?php echo base_url('home/xit_load_files/css/dark-version.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/bootstrap-extended.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/bootstrap.min.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/animate.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/owl.carousel.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/fontawesome-all.css'); ?>" rel="stylesheet">
       <link href="<?php echo base_url('home/xit_load_files/css/swiper.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/jquery.bxslider.min.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/jquery.mCustomScrollbar.min.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/odometer-theme-default.css'); ?>" rel="stylesheet">
    <!--<link href="<?php echo base_url('home/xit_load_files/css/flaticon.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/newfont.css'); ?>" rel="stylesheet">-->
    <link href="<?php echo base_url('home/xit_load_files/css/jquery.fancybox.min.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/style.css'); ?>" rel="stylesheet">
    <link href="https://cdn.lineicons.com/2.0/LineIcons.css" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo base_url();?>home/xit_load_files/css/modal-video.min.css">
    <!-- Favicon  -->
    <link rel="shortcut icon" href="<?php echo base_url();?>assets/img/favicon.png">


    <style>
   .icon-sun, .lni-sun {
    display: none; 
}
.main-header-eight {
    animation-duration: 0.7s;
    animation-fill-mode: both;
    animation-name: fadeInDown;
    top: 0;
    padding: 18px 0px;
    animation-timing-function: ease;
    transition: 0.3s all ease-in-out;
    background-image: linear-gradient(
-45deg
, #e511e6 32%, #6b2c94 100%);
}
.switch-mode{
    padding: 5px 15px;
    border: 1px solid #ddd;
    border-radius: 20px;
}
.h-eight-social li{
float: left;
list-style: none;
}
.ei-footer-copyright .ei-copyright-menu .h-eight-social li a {
    margin-left: 12px;
}
.app-eight-home{top: 0 !important;}
#goog-gt-tt, .goog-logo-link, .goog-te-banner-frame {
   display: none !important;
}
.goog-te-gadget {
    font-size: 0 !important;
}
#google_translate_element{
    float: left;
}
.goog-te-gadget .goog-te-combo {
    padding: 5px;
    border-radius: 5px;
    margin-top: -5px;
}
@media screen and (max-width: 580px){
.eight-banner-section .eight-banner-content h1 {
    font-size: 23px;
    max-width: 98%;
    overflow: hidden;
}
}
</style>

</head>

<body class="app-eight-home" data-spy="scroll" data-target=".navigation-eight" data-offset="50">
 
    <!-- preloader - start 
    <div id="preloader" class="ei-preloader"></div>
    <div class="ei-up">
        <a href="#" id="scrollup" class="ei-scrollup text-center"><i class="fas fa-angle-up"></i></a>
    </div>-->
    <!-- Start of header section
        ============================================= -->
        <header id="header-eight" class="main-header-eight">
            <div class="appheader-content">
                <div class="site-logo float-left">
                    <a href="<?php echo base_url();?>"><img style="max-height:45px !important;filter:  brightness(0) invert(1);" src="<?php echo base_url();?>assets/img/logo.png" alt=""></a>
                </div>
                <nav class="navigation-eight ul-li">
                    <ul>
                        <li><a class="nav-link" href="#eight-banner"><?php echo $this->lang->line('Home'); ?></a></li>
                        <li><a class="nav-link" href="#feature-eight"><?php echo $this->lang->line('Features'); ?></a></li>
                        <li><a class="nav-link" href="#eight-service"><?php echo $this->lang->line('Why choose Us'); ?></a></li>
                        <li><a class="nav-link" href="#s2-pricing"><?php echo $this->lang->line('Pricing'); ?></a></li>
                        <li><a class="nav-link" href="#ei-faq"><?php echo $this->lang->line('FAQ'); ?></a></li>
                        
                    </ul>
                </nav>
                <div class="h-eight-social ul-li float-right clearfix">
                    <ul>
                        <li class="sign-up-btn-eight text-center float-right clearfix">
                        <a  class="pointer" href="<?php echo base_url('home/login_page'); ?>"><?php echo $this->lang->line('Sign In'); ?></a>
                        </li>
                         <!--<li class=""><a class="nav-link-style switch-mode"><i class="lni lni-night"> Dark</i> <i class="lni lni-sun" style="display: none"> Light</i></a></li> --> 
                    
                    </ul>
                </div>
            </div>
            <!-- /desktop-menu -->
            <div class="appi-ei-mobile_menu relative-position">
                <div class="appi-ei-mobile_menu_button appi-ei-open_mobile_menu">
                    <i class="fas fa-bars"></i>
                </div>
                <div class="appi-ei-mobile_menu_wrap">
                    <div class="mobile_menu_overlay appi-ei-open_mobile_menu"></div>
                    <div class="appi-ei-mobile_menu_content">
                        <div class="appi-ei-mobile_menu_close appi-ei-open_mobile_menu">
                            <i class="far fa-times-circle"></i>
                        </div>
                        <div class="m-brand-logo text-center">
                            <img src="<?php echo base_url();?>assets/img/logo.png" alt="logo" style="max-height: 70px;filter:  brightness(0) invert(1);" alt="">
                        </div>
                        <nav class="appi-ei-mobile-main-navigation  clearfix ul-li">
                            <ul id="main-nav" class="navbar-nav text-capitalize clearfix">
                                <li><a class="nav-link" href="#eight-banner"><?php echo $this->lang->line('Home'); ?></a></li>
                                <li><a class="nav-link" href="#feature-eight"><?php echo $this->lang->line('Features'); ?></a></li>
                                <li><a class="nav-link" href="#eight-service"><?php echo $this->lang->line('Why choose Us'); ?></a></li>
                                <li><a class="nav-link" href="#s2-pricing"><?php echo $this->lang->line('Pricing'); ?></a></li>
                                <li><a class="nav-link" href="#ei-faq"><?php echo $this->lang->line('FAQ'); ?></a></li>
                                <li><a class="nav-link" href="<?php echo base_url('home/login_page'); ?>"><?php echo $this->lang->line('Sign In'); ?></a></li>
                            </ul>
                        </nav>
                        
                           
                    </div>
                </div>
            </div>
            <!-- /mobile-menu -->
        </header>
    <!-- End of header section
        ============================================= -->



    <!--ABOUT AREA-->
    <section class="about-area section-padding" id="app" style="padding: 100px;background: #f1f1f1;">
        <div class="container">
            <div class="row flex-v-center">
                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                    <div class="about-content sm-mb50 sm-center text-justify" style="padding-top: 80px;">
                        <?php $this->load->view($body);  ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--ABOUT AREA END-->
  <!-- Start of Footer  section
        ============================================= -->
        <section id="ei-footer" class="ei-footer-section position-relative">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="ei-footer-widget pera-content appeight-headline text-center">
                            <div class="ei-footer-logo">
                               <img style="max-height: 70px" src="<?php echo base_url();?>assets/img/logo.png">
                            </div>
                            <!--<p>
                                 <?php echo $this->config->item('slogan'); ?>
                            </p>-->
                           <div class="ei-payment-mathod">
                                  <div class="ei-footer-social pt-1">
                                           <?php 
                                $facebook = $this->config->item('facebook');
                                $twitter  = $this->config->item('twitter');
                                $linkedin = $this->config->item('linkedin');
                                $youtube  = $this->config->item('youtube');

                                if($facebook=='' && $twitter=='' && $linkedin=='' && $youtube=='') $cls='hidden';
                            ?>
                                    <a title="Facebook" target="_blank" class="facebook <?php if($facebook=='') echo "hidden"; ?>" href="<?php echo $facebook; ?>"><i class="fab fa-facebook-f"></i>
                                    </a>
                                    <a title="Twitter" target="_blank" class="twitter <?php if($twitter=='') echo "hidden"; ?>" href="<?php echo $twitter; ?>"><i class="fab fa-twitter"></i>
                                    </a>
                                    <a title="Linkedin" target="_blank" class="linkedin <?php if($linkedin=='') echo "hidden"; ?>" href="<?php echo $linkedin; ?>"><i class="fab fa-linkedin"></i>
                                    </a>
                                    <a title="Youtube" target="_blank" class="youtube <?php if($youtube=='') echo "hidden"; ?>" href="<?php echo $youtube; ?>"><i class="fab fa-youtube"></i>
                                    </a>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="ei-footer-widget appeight-headline ul-li-block">
                            <h3 class="ei-widget-title"><?php echo $this->lang->line("Useful link:"); ?></h3>
                            <ul>
                                <li><a href="#"><?php echo $this->lang->line("Home"); ?></a></li>
                                <li><a href="#feature-eight"><?php echo $this->lang->line("Feature"); ?></a></li>
                                <li><a href="<?php echo base_url('home/gdpr'); ?>"><?php echo $this->lang->line("GDPR Compliant"); ?></a></li>
                                <li><a href="#ei-faq"><?php echo $this->lang->line("FAQ"); ?></a></li>
                                <li><a href="<?php echo base_url("blog"); ?>"><?php echo $this->lang->line("Blog"); ?></a></li>
                                <li><a href="#ei-testimonial"><?php echo $this->lang->line("Testimonials"); ?></a></li>
                                <li><a href="#"  data-toggle='modal' data-target="#contactus"><?php echo $this->lang->line("Contact"); ?></a></li>
                                <li><a href="#s2-pricing"><?php echo $this->lang->line("Pricing"); ?></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="ei-footer-widget appeight-headline  ul-li-block">
                            <h3 class="ei-widget-title"><?php echo $this->lang->line("Contact"); ?>:</h3>
                            <h4>
                                <i class="fas fa-phone"></i>
                                
                                <?php echo $this->lang->line("Call Us"); ?> <?php echo $this->config->item('institute_mobile');?>
                               
                                <span><?php echo $this->lang->line("(Sat - Thursday)"); ?></span>
                            </h4>
                            </br>
                            
                            <div class="download-btn">
                               <h4>
                               <i class="fas fa-map-marker-alt"></i>
                                <?php echo $this->config->item('institute_address1');?>
                                <span><?php echo $this->config->item('institute_address2');?></span>
                            </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ei-footer-copyright">
                <div class="container">
                    <div class="ei-footer-copyright-content">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="ei-copyright-text">
                                     <p class="text"><?php echo $this->lang->line("Copyright"); ?> &copy; <?php echo date("Y");?>  <a target="_blank" href="<?php echo site_url(); ?>"><?php echo $this->config->item("institute_address1"); ?></a></p>
                       
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="ei-copyright-menu">
                                    <a href="<?php echo base_url('home/terms_use'); ?>"><?php echo $this->lang->line("Terms of Service"); ?></a>
                                    <a href="<?php echo base_url('home/privacy_policy'); ?>"><?php echo $this->lang->line("Privacy Policy"); ?></a>
                                  <div class="h-eight-social ul-li float-right clearfix">
                    <ul>
                         <li class=""><a class="nav-link-style switch-mode"><i class="lni lni-night"> Dark</i> <i class="lni lni-sun" style="display: none"> Light</i></a></li>  
                    
                    </ul>
                </div>
                                </div>
                                <div id="google_translate_element"></div>
                                <script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}
</script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ei-footer-shape1 position-absolute" data-parallax='{"x" : 60}'><img src="<?php echo base_url('home/xit_load_files/images/fo-shape1.png'); ?>" alt=""></div>
            <div class="ei-footer-shape2 position-absolute" data-parallax='{"y" : 60}'><img src="<?php echo base_url('home/xit_load_files/images/fo-shape2.png'); ?>" alt=""></div>
            <div class="ei-footer-shape3 position-absolute"><img src="<?php echo base_url('home/xit_load_files/images/eimap.png'); ?>" alt=""></div>
        </section>
       <!-- COOKIES -->
    <?php if($this->session->userdata('allow_cookie')!='yes') : ?>
        <div class="text-center cookiealert">
            <div class="cookiealert-container">
                <a style="font-size: 16px; color:#fff;text-decoration: none;" href="<?php echo base_url('home/privacy_policy#cookie_policy');?>">
                    <?php echo $this->lang->line("This site requires cookies in order for us to provide proper service to you.");?>
                </a>
                <a type="button" href="#" style="color:#000;" class="btn btn-warning btn-sm acceptcookies" aria-label="Close">
                    <?php echo $this->lang->line("Got it !"); ?>
                </a>

            </div>
        </div>
    <?php endif; ?>
    <!-- /COOKIES -->
      <!-- End of Footer  section
        ============================================= -->            

      <?php $this->load->view("include/fb_px"); ?> 
    <?php $this->load->view("include/google_code"); ?> 
        
    <!-- Scripts -->
    <script src="<?php echo base_url('home/xit_load_files/js/jquery-modal-video.min.js');?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/jquery.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/popper.min.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/bootstrap.min.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/appear.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/owl.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/jquery.fancybox.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/wow.min.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/aos.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/slick.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/pagenav.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/odometer.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/bxslider.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/jquery.barfiller.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/jquery.mCustomScrollbar.concat.min.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/parallax-scroll.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/swiper.min.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/typer-new.js'); ?>"></script> 
    <script src="<?php echo base_url('home/xit_load_files/js/script.js'); ?>"></script> 
    
    <script>

// Dark Mode Setup

var darkMode;

if (localStorage.getItem('dark-mode')) {  
  // if dark mode is in storage, set variable with that value
  darkMode = localStorage.getItem('dark-mode');  
} else {  
  // if dark mode is not in storage, set variable to 'light'
  darkMode = 'light';  
}

// set new localStorage value
localStorage.setItem('dark-mode', darkMode);


if (localStorage.getItem('dark-mode') == 'dark') {
  // if the above is 'dark' then apply .dark to the body
  $('body').addClass('dark-version');  
  // hide the 'dark' button
  $('.nav-link-style .icon-moon').hide();
  // show the 'light' button
  $('.nav-link-style .icon-sun').show();
}


// Toggle dark UI

$('.nav-link-style .lni-night').on('click', function() {  
  $('.nav-link-style .lni-night').hide();
  $('.nav-link-style .lni-sun').show();
  $('body').addClass('dark-version');  
  // set stored value to 'dark'
  localStorage.setItem('dark-mode', 'dark');
});

$('.nav-link-style .lni-sun').on('click', function() {  
  $('.nav-link-style .lni-sun').hide();
  $('.nav-link-style .lni-night').show();
  $('body').removeClass('dark-version');
  // set stored value to 'light'
  localStorage.setItem('dark-mode', 'light');   
});

</script>  
<style type="text/css">
    .add-970-90 img{width: 970px; }
    .add-300-600 img{width: 300px;}
    .add-320-100 img{width: 320px; }
    .add-300-250 img{width: 300px; }
    .s2-pricing_list {    height: 400px;
        overflow: auto;}
    .s2-pricing_section .s2-pricing_item .s2-pricing_price {
    background-color: #9c00e2;
        }
    .s2-pricing_section .s2-pricing_item .s2-pricing_price .s2-icon_bg svg {
    fill: #ffffff;
}
    .year {display:none;}
        .custom-switch.switch-lg .custom-control-label::before, .custom-switch.switch-lg .custom-control-label:after {
    border-radius: 20px;    padding: 10px;
}
.custom-switch-success .custom-control-input:checked~.custom-control-label::before {
    background-color: #28c76f!important;
    color: #fff;
    -webkit-transition: all .2s ease-out;
    transition: all .2s ease-out;
}
.dark-version p, .dark-version .eg-funfact-text ul {
    color: #fff;
}
    @media (max-width: 767px) { /* in xs device */
      .add-970-90,.add-300-600,.add-320-100,.add-300-250 {
        text-align: center !important;
      } 
      .add-970-90 img,.add-300-600 img,.add-320-100 img,.add-300-250 img{
        margin: 15px 0 !important;
      } 
      .footer-copyright{border-top:none !important;margin-top:20px;}
    }
    @media (min-width: 768px) and (max-width: 991px) { /* in sm device */
      .add-970-90,.add-300-600,.add-320-100,.add-300-250 {
        text-align: center !important;
      } 
      .add-970-90 img,.add-300-600 img,.add-320-100 img,.add-300-250 img{
        margin: 15px 0; !important;
      } 
      .footer-copyright{border-top:none !important;margin-top:20px;}
    }
    .cookiealert{background: #000;padding: 15px 0;opacity: .7;position: fixed;bottom:0;left: 0;z-index: 99999;width: 100%;}
    .add-300-600 img,.add-300-250 img
    {
        border-radius: 15px;
        -moz-border-radius: 15px;
        -webkit-border-radius: 15px;
    } 
</style>
<script type="text/javascript">
    $(document).ready(function() {
        $(document.body).on('click', '.acceptcookies', function(event) {
            event.preventDefault();
            var base_url = '<?php echo base_url(); ?>';
            $('.cookiealert').hide();
            $.ajax({
                url: base_url+'home/allow_cookie',
                type: 'POST',
            })
        });
        
        $("#annual_plan_check").on('change', function() {
        console.log($(this).is(':checked'));
    if ($(this).is(':checked')) {
        $('.table1').hide('fast');
        $('.year').show('fast');
    }else{
       $('.table1').show('fast');
        $('.year').hide('fast');
    }
});

jQuery('.grad4').last().addClass('year');
jQuery('.grad5').last().addClass('year');
jQuery('.grad6').last().addClass('year');
    });
</script>    
    </body>
    <div id="contactus" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4><?php echo $this->lang->line("Contact Us");?></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                
            </div>
     <div class="card-body contact-form form-style-one mt-15 pt-5 pb- 5 pr-5 pl-5">
                     <div class="form-input mt-15">
                         <?php 
                                        if($this->session->userdata('mail_sent') == 1) {
                                        echo "<div class='alert alert-success text-center'>".$this->lang->line("we have received your email. we will contact you through email as soon as possible")."</div>";
                                        $this->session->unset_userdata('mail_sent');
                                        }
                                    ?>
                            </div>
                        <form action="<?php echo site_url("home/email_contact"); ?>" method="post">
                        <div class="form-input mt-1">
                                <div class="input-items default">
                                        <input type="text" class="form-control" required id="subject" <?php echo set_value("subject"); ?> placeholder="<?php echo $this->lang->line("message subject");?>" name="subject">
                                            
                                    
                                </div>
                            </div> <!-- form input -->
                            <div class="form-input mt-1">
                                <div class="input-items default">
                                       <input type="email" class="form-control" required id="email" <?php echo set_value("email"); ?> placeholder="<?php echo $this->lang->line("email");?>" name="email">
                                   
                                </div>
                            </div> <!-- form input -->
                            <div class="form-input mt-1">
                                <div class="input-items default">
                                    <input type="number" class="form-control" step="1" required id="captcha" <?php echo set_value("captcha"); ?> placeholder="<?php echo $contact_num1. "+". $contact_num2." = ?"; ?>" name="captcha">
                                                    <span class="red">
                                                        <?php 
                                                        if(form_error('captcha')) 
                                                            echo form_error('captcha'); 
                                                        else  
                                                        { 
                                                            echo $this->session->userdata("contact_captcha_error"); 
                                                            $this->session->unset_userdata("contact_captcha_error"); 
                                                        } 
                                                        ?>
                                                    </span>
                              
                                </div>
                            </div> <!-- form input -->
                            
                            <div class="form-input mt-1">
                                <div class="input-items default">
                                       <textarea class="form-control" rows="3" required id="message" <?php echo set_value("message"); ?> placeholder="  <?php echo $this->lang->line("message");?>" name="message"></textarea>
                                            
                                   
                                </div>
                            </div> <!-- form input -->
                            <p class="form-message"></p>
                            <div class="form-input standard-buttons mt-2">
                                <button class="main-btn btn btn-primary float-right standard-two" type="submit"><?php echo $this->lang->line("Send Message");?></button>
                            </div> <!-- form input -->
                        </form>
                    </div> <!-- contact form -->
        </div>

      </div>
    </div>
    
<div id="myModal" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                
            </div>
            <div class="single-item" style="text-align: center; margin-top: 10px;">
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

          <div class="card-body">
           <div class="card-body">
          <form method="POST" action="<?php echo base_url('home/login'); ?>" class="needs-validation" novalidate>
            <div class="form-group">
              <label for="email"><?php echo $this->lang->line("Email"); ?></label>
              <input id="email" type="email" value="<?php echo $default_user ?>" class="form-control" name="username" tabindex="1" required autofocus>
              <!-- <div class="invalid-feedback">
                Please fill in your email
              </div> -->
            </div>

            <div class="form-group">
              <div class="d-block">
                <label for="password" class="control-label"><?php echo $this->lang->line("Password"); ?></label>
                <div class="float-right">
                  <a href="<?php echo site_url();?>home/forgot_password" class="text-small">
                    <?php echo $this->lang->line("Forgot your password?"); ?>
                  </a>
                </div>
              </div>
              <input id="password" type="password" value="<?php echo $default_pass ?>"  class="form-control" name="password" tabindex="2" required>

              <input type="hidden" name="csrf_token" id="csrf_token" value="<?php echo $this->session->userdata('csrf_token_session'); ?>">

              <!-- <div class="invalid-feedback">
                please fill in your password
              </div> -->
            </div>

            <!-- <div class="form-group">
              <div class="custom-control custom-checkbox">
                <input type="checkbox" name="remember" class="custom-control-input" tabindex="3" id="remember-me">
                <label class="custom-control-label" for="remember-me">Remember Me</label>
              </div>
            </div> -->

            <div class="form-group">
              <button type="submit" class="btn btn-primary btn-lg btn-block login_btn" tabindex="4">
                <i class="fa fa-sign-in-alt"></i> <?php echo $this->lang->line("login"); ?>
              </button>
            </div>
          </form>
          
          <?php if($this->config->item('enable_signup_form')!='0') : ?>
          <div class="row sm-gutters">
            <div class="col-12 col-sm-12 col-md-12 col-lg-6" style="padding-top: 15px;">
                <?php echo $google_login_button2=str_replace("ThisIsTheLoginButtonForGoogle",$this->lang->line("Login with Google"), $google_login_button); ?>
             </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6" style="padding-top: 15px;">
                <?php echo $fb_login_button2=str_replace("ThisIsTheLoginButtonForFacebook",$this->lang->line("Login with Facebook"), $fb_login_button); ?>
            </div>

            <div class="col-12">
                 <div class="text-muted text-center">
                    <br><?php echo $this->lang->line("Do not have an account?"); ?> <a href="<?php echo base_url('home/sign_up'); ?>"><?php echo $this->lang->line("Create one"); ?></a>
                </div>
             </div>
          </div>
            <?php endif; ?>

        </div>
          
        </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"><?php echo $this->lang->line('Close'); ?></button>
            </div>
        </div>

      </div>
    </div>
    
</html>