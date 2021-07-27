<?php
/*
Theme Name: Xeroalpha Theme 
Unique Name: Xeroalpha Theme
Theme URI: https://btngroup.shop
Author: BTN Group
Author URI: https://btngroup.shop
Version: 1.0.6
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
	<!-- Favicon  -->
    <link rel="shortcut icon" href="<?php echo base_url();?>assets/img/favicon.png">
<style>
   .icon-sun, .lni-sun {
    display: none; 
}
.cookiealert {
    background: #fff;
    position: fixed;
    right: 0;
    z-index: 99999;
    bottom: 20px;
    left: 20px;
    padding: 15px 20px 15px 20px;
    width: 300px;
    max-height: 85%;
    overflow-y: auto;
    max-width: calc(100% - 40px);
    border-radius: 5px;
}
#ei-newslatter p.text {
    color: #fff;
    font-size: 20px;
    margin-bottom: 0;
    padding-left: 10px;
    text-align: center;
}
#ei-newslatter .contact-title{
    color: #fff;
    font-size: 2em;
    text-align: center;
}
.mt-15 {margin-top:15px;}
.mt-20 {margin-top:20px;}
.switch-mode{
    padding: 5px 15px;
    border: 1px solid #ddd;
    border-radius: 20px;
}
.contact-button button {
    height: 48px;
    width: 162px;
    border: none;
    color: #fff;
    border-radius: 30px;
    text-align: center;
    background-color: transparent;
    background-image: linear-gradient(
90deg
, #ff03d0 0%, #4599fb 53%, #70fcff 99%);
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
.main-header-eight .appheader-content {
  padding: 0 !important;
}
@media screen and (max-width: 580px){
.eight-banner-section .eight-banner-content h1 {
    font-size: 23px;
    max-width: 98%;
    overflow: hidden;
}

}
@media (min-width: 992px){

.eight-service-section .eight-service-text h2 {
    margin-left: -70px;
}
}
</style>

</head>

<body class="app-eight-home" data-spy="scroll" data-target=".navigation-eight" data-offset="50">
 
    <!-- preloader - start 
    <div id="preloader" class="ei-preloader"></div>-->
    <div class="ei-up">
        <a href="#" id="scrollup" class="ei-scrollup text-center"><i class="fas fa-angle-up"></i></a>
    </div>
    <!-- Start of header section
        ============================================= -->
        <header id="header-eight" class="main-header-eight">
            <div class="container appheader-content">
                <div class="site-logo float-left">
                    <a href="<?php echo base_url();?>"><img style="max-height:45px !important;" src="<?php echo base_url();?>assets/img/logo.png" alt=""></a>
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
                         <li class=""><a class="nav-link-style switch-mode"><i class="lni lni-night"> Dark</i> <i class="lni lni-sun" style="display: none"> Light</i></a></li>  
                    
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
                            <img src="<?php echo base_url();?>assets/img/logo.png" alt="logo" style="max-height: 70px;" alt="">
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


    <!-- Start of Banner section
        ============================================= -->
        <section id="eight-banner" class="eight-banner-section position-relative">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="eight-banner-content">
                            <div class="banner-content-box appeight-headline pera-content">
                                <h1 class="cd-headline clip is-full-width">
                                   <?php echo $this->lang->line('Social Media Management tools'); ?></br>
                                   <span class="cd-words-wrapper">
                                        <b class="is-visible"><?php echo $this->lang->line('Social Automation'); ?></b>
                                        <b><?php echo $this->lang->line('Comment Automation'); ?></b>
                                        <b ><?php echo $this->lang->line('Facebook ChatBot'); ?></b>
                                        <b><?php echo $this->lang->line('E-commerce Store'); ?></b>
                                        <b><?php echo $this->lang->line('Email Marketing'); ?></b>
										<b><?php echo $this->lang->line('SMS Marketing'); ?></b>
                                    </span>
									
                                </h1>
                                <P><?php echo $this->lang->line('Easily manage all your social media and get results with Visually plan and schedule your social media campaigns'); ?></P>
                                <div class="ei-banner-btn">
                                    <a  class="pointer" href="<?php echo base_url('home/sign_up'); ?>"><i class="fas fa-power-off"></i> <?php echo $this->lang->line('Start Now'); ?></a>
                                   <!-- <a class="pointer" href="<?php echo base_url('home/sign_up'); ?>"><?php echo $this->lang->line('try it for free for 7 days'); ?></a>-->
                               
                                 <!-- Demo video section -->
                                 
                <?php 
                    $demo = $this->config->item('customer_review_video');
                    $customer_review_video = trim(str_replace('https://www.youtube.com/watch?v=','',$demo));
                ?>
                            <a href="https://www.youtube.com/watch?v=<?php echo $customer_review_video; ?>" class="lightbox-image overlay-box <?php if($this->config->item('display_review_block') == '0') echo 'hidden';?>"> 
                            <div class="banner-video-btn video-area-popup text-center"><i class="fas fa-play"></i><i class="video-border"></i></div>
                                </div>
                            </div></a>
                        
                            <div class="ei-banner-mbl-mockup wow fadeInRight" data-parallax='{"y" : 50}' data-wow-delay="600ms" data-wow-duration="1500ms">
                                <img data-parallax='{"y" : 50}' src="<?php echo base_url('home/xit_load_files/images/slide-home.png'); ?>" alt="">
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="waveWrapper waveAnimation">
                <div class="waveWrapperInner bgTop">
                    <div class="wave waveTop" style="background-image: url('<?php echo base_url('home/xit_load_files/images/b-shapeup.png'); ?>')"></div>
                </div>
                <div class="waveWrapperInner bgMiddle">
                    <div class="wave waveMiddle" style="background-image: url('<?php echo base_url('home/xit_load_files/images/b-shapemiddle.png'); ?>')"></div>
                </div>
                <div class="waveWrapperInner bgBottom">
                    <div class="wave waveBottom" style="background-image: url('<?php echo base_url('home/xit_load_files/images/b-shapemiddle.png'); ?>')"></div>
                </div>
            </div>
            <div class="waveWrapper waveAnimation nav-link-style">
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
        </section>
    <!-- End of Banner section
        ============================================= --> 

    <!-- Start of Featured  section
        ============================================= -->
        <section id="feature-eight" class="feature-eight-section position-relative">
            <div class="container">
                <div class="eight-section-title appeight-headline pera-content text-center">
                    <span class="eg-title-tag">
                        <?php echo $this->lang->line("Fetaured services"); ?> <i class="square-shape"><i></i><i></i> <i></i> <i></i> </i>
                    </span>
                    <h2><?php echo $this->lang->line("Why you will choose"); ?>
                        <span><?php echo $this->lang->line("our Platform?"); ?></span></h2>
                        <p><?php echo $this->lang->line("It's Save Precious Time and Money Focus more on generating money than wasting time doing online marketing manually."); ?></p>
                    </div>
                    <!-- /title -->

                    <div class="eight-feature-content">
                        <div class="row justify-content-md-center">
                            <div class="col-lg-3 col-md-6  wow fadeFromUp" data-wow-delay="0ms" data-wow-duration="1500ms">
                                <div class="eight-feature-box text-center position-relative">
                                    <div class="feature-icon8 position-relative">
                                       <i class="lni lni-facebook-messenger"></i>
                                        <span class="ei-icon-bg"></span>
                                    </div>
                                    <div class="feature-text8 appeight-headline pera-content">
                                        <h3><?php echo $this->lang->line("FACEBOOK MESSENGER BOT"); ?></h3>
                                        <p><?php echo $this->lang->line("Turn conversation into customer loyalty -Smartest Reply for your Facebook Business"); ?></p>
                                    </div>
                                    <div class="ei-feature-more">
                                        <a href="<?php echo base_url("messenger_bot/bot_list");?>"><i class="fas fa-plus"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 wow fadeFromUp" data-wow-delay="300ms" data-wow-duration="1500ms">
                                <div class="eight-feature-box text-center position-relative">
                                    <div class="feature-icon8 position-relative">
                                        <i class="lni lni-rocket"></i>
                                        <span class="ei-icon-bg"></span>
                                    </div>
                                    <div class="feature-text8 appeight-headline pera-content">
                                        <h3><?php echo $this->lang->line("MULTI SOCIAL AUTOMATIONS"); ?></h3>
                                        <p><?php echo $this->lang->line("Bulk post and auto share your website,Youtube to Multi-Facebook Pages, Group"); ?> </p>
                                    </div>
                                    <div class="ei-feature-more">
                                        <a href="<?php echo base_url("ultrapost/text_image_link_video_poster");?>"><i class="fas fa-plus"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 wow fadeFromUp" data-wow-delay="900ms" data-wow-duration="1500ms">
                                <div class="eight-feature-box text-center position-relative">
                                    <div class="feature-icon8 position-relative">
                                        <i class="lni lni-bubble"></i>
                                        <span class="ei-icon-bg"></span>
                                    </div>
                                    <div class="feature-text8 appeight-headline pera-content">
                                        <h3><?php echo $this->lang->line("SMS & MAIL MARKETING"); ?></h3>
                                        <p><?php echo $this->lang->line("Broadcast email, SMS  to Messenger collected emails,SMS or custom imported list"); ?></p>
                                    </div>
                                    <div class="ei-feature-more">
                                        <a href="<?php echo base_url("sms_email_manager/create_sms_campaign");?>"><i class="fas fa-plus"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 wow fadeFromUp" data-wow-delay="1200ms" data-wow-duration="1500ms">
                                <div class="eight-feature-box text-center position-relative">
                                    <div class="feature-icon8 position-relative">
                                       <i class="lni lni-cart-full"></i>
                                        <span class="ei-icon-bg"></span>
                                    </div>
                                    <div class="feature-text8 appeight-headline pera-content">
                                        <h3><?php echo $this->lang->line("ECOMMERCE FEATURE"); ?></h3>
                                        <p><?php echo $this->lang->line("Easy to set-up Ecommerce Store & Restaurant inside/outside Messenger and start selling online FAST"); ?></p>
                                    </div>
                                    <div class="ei-feature-more">
                                        <a href="<?php echo base_url("ecommerce");?>"><i class="fas fa-plus"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ei-feature-shape"><img src="<?php echo base_url('home/xit_load_files/images/f-shape1.png'); ?>" alt=""></div>
            </section>
    <!-- End of Featured section
        ============================================= --> 
  <?php if($this->is_ad_enabled && $this->is_ad_enabled1) : ?>    
  <div class="container pb-5">
<div class="row justify-content-center">
    
        <div class=" pb-25 add-970-90 hidden-xs hidden-sm text-center" style=" z-index: 999;"><?php echo $this->ad_content1; ?></div> 
        <div class="pb-25 add-320-100 hidden-md hidden-lg text-center" style="z-index: 999;"><?php echo $this->ad_content1_mobile; ?></div> 
    
  </div>  
 </div>
 <?php endif; ?> 
    <!-- Start of service  section
        ============================================= -->
        <section id="eight-service" class="eight-service-section position-relative">
            <div class="container">
                <div class="eight-service-slide   clearfix wow fadeFromLeft" data-wow-delay="300ms" data-wow-duration="1500ms">
                    <div class="ei-service-slide-btn ul-li-block clearfix">
                        <div class="banner-pager clearfix" id="banner-pager">
                            <a class="pager" data-slide-index="0">
                                <div class="ei-service-icon-text text-right appeight-headline pera-content">
                                    <div class="ei-service-icon float-right text-center">
                                       <i class="lni lni-facebook"></i>
                                    </div>
                                    <div class="ei-service-text">
                                        <h3><?php echo $this->lang->line("FACEBOOK MANAGEMENT"); ?></h3>
                                        <p><?php echo $this->lang->line("Schedule and publish content with auto reply comment and inbox message, Create Chatbot and Ecommerce store"); ?></p>
                                    </div>
                                </div>
                            </a>

                            <a class="pager" data-slide-index="1">
                                <div class="ei-service-icon-text text-right appeight-headline pera-content">
                                    <div class="ei-service-icon float-right text-center">
                                       <i class="lni lni-instagram"></i>
                                    </div>
                                    <div class="ei-service-text">
                                        <h3><?php echo $this->lang->line("INSTAGRAM MANAGEMENT"); ?></h3>
                                        <p><?php echo $this->lang->line("Keep your Instagram presence active 24/7 by automatically scheduling posts to fill the gaps in your calendar"); ?></p>
                                    </div>
                                </div>
                            </a>

                            <a class="pager" data-slide-index="2">
                                <div class="ei-service-icon-text text-right appeight-headline pera-content">
                                    <div class="ei-service-icon float-right text-center">
                                       <i class="lni lni-google"></i>
                                    </div>
                                    <div class="ei-service-text">
                                        <h3><?php echo $this->lang->line("GOOLE MY BUSINESS MANAGEMENT"); ?></h3>
                                        <p><?php echo $this->lang->line("reach your customers and manage multiple locations, automatic review reply, campaigning posts..."); ?></p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="eight-service-text position-relative appeight-headline wow fadeFromRight" data-wow-delay="300ms" data-wow-duration="1500ms">
                    <div class="ei-service-slide-mbl" data-background="<?php echo base_url('home/xit_load_files/images/smu1.png'); ?>">
                        <div class="slide-inner">
                            <div class="ei-service-slide">
                                <div class="slide-item">
                                    <div class="image">
                                        <img src="<?php echo base_url('home/xit_load_files/images/slider-01.png'); ?>" alt="" />
                                    </div>
                                </div>
                                <div class="slide-item">
                                    <div class="image">
                                        <img src="<?php echo base_url('home/xit_load_files/images/slider-02.png'); ?>" alt="" />
                                    </div>
                                </div>
                                <div class="slide-item">
                                    <div class="image">
                                        <img src="<?php echo base_url('home/xit_load_files/images/slider-03.png'); ?>" alt="" />
                                    </div>
                                </div>
                                <div class="slide-item">
                                    <div class="image">
                                        <img src="<?php echo base_url('home/xit_load_files/images/slider-04.png'); ?>" alt="" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <h2><?php echo $this->lang->line("Complete
                       Management Tools?"); ?></h2>
                </div>
            </div>
            <div class="s-shape-bg1" data-parallax='{"x" : -70}'><img src="<?php echo base_url('home/xit_load_files/images/s-shape3.png'); ?>" alt=""></div>
            <div class="s-shape-bg2 text-center"><img src="<?php echo base_url('home/xit_load_files/images/s-shape4.png'); ?>" alt=""></div>
        </section>
    <!-- End of service  section
        ============================================= -->


    <!-- Start of Fun fact   section
        ============================================= -->
        <section id="fun-fact" class="eg-fun-fact-section position-relative">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="eg-funfact-content clearfix position-relative">
                            <div class="eg-fun-fact-mockup wow fadeFromLeft" data-wow-delay="300ms" data-wow-duration="1500ms">
                                <div class="main-mockup">
                                    <img src="<?php echo base_url('home/xit_load_files/images/funface.png'); ?>" alt="">
                                </div>
                                <div class="fn-shape fn-shape-item1" data-parallax='{"y" : 50}'><img src="<?php echo base_url('home/xit_load_files/images/fmu2.png'); ?>" alt=""></div>
                                <div class="fn-shape fn-shape-item2" data-parallax='{"y" : 60}'><img src="<?php echo base_url('home/xit_load_files/images/fmu3.png'); ?>" alt=""></div>
                                <div class="fn-shape fn-shape-item3" data-parallax='{"x" : -50}'><img src="<?php echo base_url('home/xit_load_files/images/fc1.png'); ?>" alt=""></div>
                                <div class="fn-shape fn-shape-item4" data-parallax='{"x" : -40}'><img src="<?php echo base_url('home/xit_load_files/images/fc2.png'); ?>" alt=""></div>
                            </div>
                            <div class="eg-funfact-text float-right wow fadeFromRight" data-wow-delay="300ms" data-wow-duration="1500ms">
                                <div class="eight-section-title appeight-headline pera-content text-left">
                                    <span class="eg-title-tag"> <?php echo $this->lang->line("Fun facts"); ?>
                                        <i class="square-shape"><i></i><i></i><i></i><i></i></i></span>
                                        <h2><?php echo $this->lang->line("We have some awesome"); ?>
                                            <span><?php echo $this->lang->line("funfacts for clients."); ?></span></h2>
                                            <p><?php echo $this->lang->line("Build a Bot in Minutes. Automate business inquiries, increase 10x more sales, you can build the content flow to engage and build relationship with your customers."); ?></p>
                                        </div>
                                        <!-- /title -->
                                        <div class="fun-fact-counter position-relative clearfix">
                                            <div class="eg-counter-number pera-content text-center">
                                                <span class="odometer" data-count="2100">00</span><strong>+</strong>
                                                <p><?php echo $this->lang->line("Active campaign"); ?></p>
                                            </div>
                                            <div class="eg-counter-number pera-content text-center">
                                                <span class="odometer" data-count="200">00</span><strong>+</strong>
                                                <p><?php echo $this->lang->line("Active users"); ?></p>
                                            </div>
                                            <div class="eg-counter-number pera-content text-center">
                                                <span class="odometer" data-count="180">00</span><strong>+</strong>
                                                <p><?php echo $this->lang->line("Ecommerce Store"); ?></p>
                                            </div>
                                            <div class="eg-counter-number pera-content text-center">
                                                <span class="odometer" data-count="250000">00</span><strong>+</strong>
                                                <p><?php echo $this->lang->line("Messages Sent"); ?></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="fn-bg-shape position-absolute"><img src="<?php echo base_url('home/xit_load_files/images/fns1.png'); ?>" alt=""></div>
                </section>
    <!-- End of Fun fact  section
        ============================================= --> 

    <!-- Start of How work  section
        ============================================= -->
        <section id="eg-how-work" class="eg-how-work-section position-relative">
            <div class="how-work-bg-shape position-absolute"><img src="<?php echo base_url('home/xit_load_files/images/hws.png'); ?>" alt=""></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="ei-how-work-content-item wow fadeFromUp" data-wow-delay="300ms" data-wow-duration="1500ms">
                            <div class="eight-section-title appeight-headline pera-content text-left">
                                <span class="eg-title-tag">
                                    <?php echo $this->lang->line("How this Tools is working?"); ?><i class="square-shape"><i></i><i></i><i></i><i></i></i>
                                </span>
                                <h2><?php echo $this->lang->line("This Tools is working by"); ?>
                                    <span><?php echo $this->lang->line("some steps!"); ?></span>
                                </h2>
                            </div>
                            <!-- /title -->
                            <div id="how-workscrollbar" class="how-work-scroller">
                                <div class="eg-how-work-content">
                                    <div class="eg-how-work-icon-text position-relative">
                                        <span class="scroller-no"><?php echo $this->lang->line("1"); ?></span>
                                        <div class="eg-how-work-icon float-left text-center">
                                            <i class="lni lni-inbox"></i>
                                        </div>
                                        <div class="eg-how-work-text appeight-headline pera-content">
                                            <h3><?php echo $this->lang->line("Import Account"); ?></h3>
                                            <p><?php echo $this->lang->line("it's really easy just 1 click import all Pages"); ?></p>
                                        </div>
                                    </div>
                                    <div class="eg-how-work-icon-text position-relative">
                                        <span class="scroller-no"><?php echo $this->lang->line("2"); ?></span>
                                        <div class="eg-how-work-icon float-left text-center">
											 <i class="lni lni-consulting"></i>
                                        </div>
                                        <div class="eg-how-work-text appeight-headline pera-content">
                                            <h3><?php echo $this->lang->line("Connect your Pages"); ?></h3>
                                            <p><?php echo $this->lang->line("Connect your Pages that you want to build Chatbot and Automate"); ?></p>
                                        </div>
                                    </div>
                                    <div class="eg-how-work-icon-text position-relative">
                                        <span class="scroller-no"><?php echo $this->lang->line("3"); ?></span>
                                        <div class="eg-how-work-icon float-left text-center">
                                          <i class="lni lni-vector"></i>
                                        </div>
                                        <div class="eg-how-work-text appeight-headline pera-content">
                                            <h3><?php echo $this->lang->line("Build your Chatbot"); ?></h3>
                                            <p><?php echo $this->lang->line("build your own bot in minutes with our simple drag-and-drop"); ?></p>
                                        </div>
                                    </div>
                                    <div class="eg-how-work-icon-text position-relative">
                                        <span class="scroller-no"><?php echo $this->lang->line("4"); ?></span>
                                        <div class="eg-how-work-icon float-left text-center">
                                            <i class="lni lni-write"></i>
                                        </div>
                                        <div class="eg-how-work-text appeight-headline pera-content">
                                            <h3><?php echo $this->lang->line("Create Campaign"); ?></h3>
                                            <p><?php echo $this->lang->line("Create comment reply, Social Posting, SMS or Email Campaigns"); ?></p>
                                        </div>
                                    </div>
                                    <div class="eg-how-work-icon-text position-relative">
                                        <span class="scroller-no"><?php echo $this->lang->line("5"); ?></span>
                                        <div class="eg-how-work-icon float-left text-center">
                                            <i class="lni lni-travel"></i>
                                        </div>
                                        <div class="eg-how-work-text appeight-headline pera-content">
                                            <h3><?php echo $this->lang->line("Enjoy your travel"); ?></h3>
                                            <p><?php echo $this->lang->line("Enjoy your Holiday and wait for buyer, customer call you"); ?></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="how-work-mockup position-relative wow fadeFromUp" data-wow-delay="600ms" data-wow-duration="1500ms">
                            <div class="hw-mockup-img">
                                <img src="<?php echo base_url('home/xit_load_files/images/hw.gif'); ?>" alt="">
                            </div>
                            <div class="hw-shape1 position-absolute" data-parallax='{"x" : 40}'><img src="<?php echo base_url('home/xit_load_files/images/fc1.png'); ?>" alt=""></div>
                            <div class="hw-shape2 position-absolute" data-parallax='{"x" : -30}'><img src="<?php echo base_url('home/xit_load_files/images/fc2.png'); ?>" alt=""></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <!-- End  of How work  section
        ============================================= -->   
        
     <?php if($this->is_ad_enabled && $this->is_ad_enabled2) : ?>  
    <div class="container">
<div class="row justify-content-center">  
        <div class="add-320-100 hidden-md hidden-lg text-center"><?php echo $this->ad_content2; ?></div> 

    </div>
    </div>
        <?php endif; ?> 
    <!-- Start of App Download  section
        ============================================= -->
        <section id="ei-appdownload" class="ei-appdownload-section position-relative">
            <div class="container">
                <div class="ei-appdownload-content">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="ei-app-mockup-img  wow fadeFromRight" data-wow-delay="300ms" data-wow-duration="1500ms">
                                <img src="<?php echo base_url('home/xit_load_files/images/adtargeting.png'); ?>" alt="">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="ei-app-down-text wow fadeFromLeft" data-wow-delay="600ms" data-wow-duration="1500ms">
                                <div class="eight-section-title appeight-headline pera-content text-left">
                                    <span class="eg-title-tag">
                                      <?php echo $this->lang->line("Targeting Tool"); ?><i class="square-shape"><i></i><i></i><i></i><i></i></i>
                                    </span>
                                    <h2><?php echo $this->lang->line("Interest Targeting Tool"); ?>
                                        <span><?php echo $this->lang->line("Facebook  and Google"); ?></span>
                                    </h2>
                                    <p><?php echo $this->lang->line("AdTargeting is the best Facebook interest targeting tool to discover hidden or niche interests of massive Facebook audiences It can help you max the ROI of Facebook Google marketing targeting"); ?></p>
                                </div>
                                <!-- /title -->
                                <div class="ei-download-btn pera-content">
                                    <div class="download-icon float-left"><i class="lni lni-target-revenue"></i></div>
                                    <p><?php echo $this->lang->line("Are you interested for this app?"); ?></p>
                                    <a href="<?php echo base_url('home/sign_up'); ?>" target="_blank"><?php echo $this->lang->line("Learn more about this tool"); ?> </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ei-appdownloaad-shape app-shape1" data-parallax='{"y" : -100}'><img src="<?php echo base_url('home/xit_load_files/images/apps1.png'); ?>" alt=""></div>
            <div class="ei-appdownloaad-shape app-shape2" data-parallax='{"x" : -120}'><img src="<?php echo base_url('home/xit_load_files/images/apps2.png'); ?>apps2.png" alt=""></div>
            <div class="ei-appdownloaad-shape app-shape3" data-parallax='{"y" : -100}'><img src="<?php echo base_url('home/xit_load_files/images/apps3.png'); ?>" alt=""></div>
        </section>
    <!-- End of App Download section
        ============================================= -->   

<section id="fun-fact" class="eg-fun-fact-section position-relative">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="eg-funfact-content clearfix position-relative">
                            <div class="eg-fun-fact-mockup wow fadeFromLeft animated" data-wow-delay="300ms" data-wow-duration="1500ms" style="visibility: visible; animation-duration: 1500ms; animation-delay: 300ms; animation-name: fadeFromLeft;">
                                <div class="main-mockup">
                                    <img src="<?php echo base_url('home/xit_load_files/images/ecommerce.png'); ?>" alt="">
                                </div>
                                <div class="fn-shape fn-shape-item3" data-parallax="{&quot;x&quot; : -50}" style="transform:translate3d(-50px, 0px, 0px) rotateX(0deg) rotateY(0deg) rotateZ(0deg) scaleX(1) scaleY(1) scaleZ(1); -webkit-transform:translate3d(-50px, 0px, 0px) rotateX(0deg) rotateY(0deg) rotateZ(0deg) scaleX(1) scaleY(1) scaleZ(1); "><img src="<?php echo base_url('home/xit_load_files/images/fc1.png'); ?>" alt=""></div>
                                <div class="fn-shape fn-shape-item4" data-parallax="{&quot;x&quot; : -40}" style="transform:translate3d(-40px, 0px, 0px) rotateX(0deg) rotateY(0deg) rotateZ(0deg) scaleX(1) scaleY(1) scaleZ(1); -webkit-transform:translate3d(-40px, 0px, 0px) rotateX(0deg) rotateY(0deg) rotateZ(0deg) scaleX(1) scaleY(1) scaleZ(1); "><img src="<?php echo base_url('home/xit_load_files/images/fc2.png'); ?>" alt=""></div>
                            </div>
                            <div class="eg-funfact-text float-right wow fadeFromRight animated" data-wow-delay="300ms" data-wow-duration="1500ms" style="visibility: visible; animation-duration: 1500ms; animation-delay: 300ms; animation-name: fadeFromRight;">
                                <div class="eight-section-title appeight-headline pera-content text-left">
                                    <span class="eg-title-tag"> Ecommerce                                       <i class="square-shape"><i></i><i></i><i></i><i></i></i></span>
                                        <h2>Full Featured<span>    
                                        ECOMMERCE-DIGITAL MENU Solution </span></h2>
                                            <p>Easy to set-up Ecommerce Store & Restaurant inside/outside Messenger and start selling online FAST</p>
                                        </div>
                                        <!-- /title -->
                                        <div class="position-relative clearfix">
                                            <ul>
                                            <li>Mobile app like easy to use UI</li>
                                            <li>Multiple stores</li>
                                             <li>Contactless QR menu</li>
                                             <li>Coupon system</li>
                                             <li>Multi Payment gateways: Paypal, Stripe, Razorpay, Paystack, Mollie, Cash On Delivery, Manual/Bank Payment</li>
                                             <li>Order management (shipping, delivery, reject & accept order)</li>
                                             <li>Order confirmation receipt in Messenger, email & SMS</li>
                                            </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="fn-bg-shape position-absolute"><img src="<?php echo base_url('home/xit_load_files/images/fns1.png'); ?>" alt=""></div>
                </section>

    <!--====== Video ENDS ======-->
 
<section id="ei-screenshots" class="ei-screenshots-section position-relative">
            <div class="container text-center">
                <div class="eight-section-title appeight-headline pera-content text-center">
                    <span class="eg-title-tag"> Chatbot Flow Builder<i class="square-shape"> <i></i><i></i><i></i><i></i></i></span>
                    <h2>Visual Drag & Drop 
                        <span>Chatbot Flow Editor</span></h2>
                        <p><?php echo $this->config->item("institute_address1"); ?> flow builder will provide you an overall view of the whole interaction process of building chatbot. In one word, it is such a graphical editor where you can control all of the messages, actions, and interactions among them. You can accomplish the whole process of building your bot on the single graphical editor, without moving to and from. Simply put, the add-on makes your bot building process pretty simple and quite fast. Most importantly, on the flow builder, you can easily feel the senses of your all messages.</p>
                    </div>
                    
     <img src="<?php echo base_url('home/xit_load_files/images/flow.png');?>" class="flow i-amphtml-fill-content i-amphtml-replaced-content" style="    width: 90%;z-index: 1;position: relative;-webkit-box-shadow: 0 0 11px 0 rgb(154 154 154 / 16%);-moz-box-shadow: 0 0 11px 0 rgba(154,154,154,.16);box-shadow: 0 0 11px 0 rgb(154 154 154 / 16%);border-radius: 10px;"></amp-img>
                    
                </div>
                <div class="screenshoot-vector screenshoot-shape1 position-absolute"> <img src="<?php echo base_url('home/xit_load_files/images/ss-shape1.png'); ?>" alt=""></div>
                <div class="screenshoot-vector screenshoot-shape2 position-absolute"> <img src="<?php echo base_url('home/xit_load_files/images/ss-shape2.png'); ?>" alt=""></div>
            </section>
  
            <?php if($this->is_ad_enabled && $this->is_ad_enabled3) : ?>            
  <div class="container text-center">  
        <div class="add-320-100 hidden-md hidden-lg text-center" style="background: #F5F4F4;"><?php echo $this->ad_content3; ?></div> 
 
    </div>
      <?php endif; ?>  
             <?php
    if(!empty($pricing_table_data)) : 
    ?>    
    <section id="s2-pricing" class="s2-pricing_section">
            <div class="container">
                <div class="saas_two_section_title saas2-headline text-center">
                    <span class="title_tag">
                      <h3 class="title">Try <?php echo $this->config->item("institute_address1"); ?> for Free </h3>
                    </span>
                    <div class=" pt-2 pb-1 custom-control custom-switch switch-lg custom-switch-success mr-2">
                    <input type="checkbox" class="custom-control-input" id="annual_plan_check">
                     <label class="custom-control-label" for="annual_plan_check">
                      <span class="switch-text-left">Yearly</span>
                      <span class="switch-text-right">Monthly</span>
                     </label>
                    </div>
                                            
         <p class="pb-75">( Save up to <strong>30% </strong>by paying Yearly.)</p>                             
			           		  
    <p class="mb-2 pb-75">
      All plans include 40+ advanced tools and features to boost your business. Choose the best plan to fit your needs.
    </p>
                </div>
                <!-- /section title -->
                <div class="s2-pricing_content">
                    <div class="row justify-content-md-center">
                         <?php 
                $i=0;
                $classes=array(1=>"tiny",2=>"small",3=>"medium",4=>"pro");
                foreach($pricing_table_data as $pack) :    
                $i++;   
            ?>
                        <div class="col-lg-4 col-md-6 wow fadeFromLeft animated <?php echo $pack["package_name"]; ?> table1 grad<?php echo $i ?>" data-wow-delay="0ms" data-wow-duration="1500ms" style="visibility: visible; animation-duration: 1500ms; animation-delay: 0ms; animation-name: fadeFromLeft;">
                            <div class="s2-pricing_item">
                                <div class="s2-pricing_price relative-position clearfix">
                                    <div class="pricing_icon  float-left text-center">
                                        <svg enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg"><path d="m511.4 38.222c-1.109-20.338-17.284-36.511-37.622-37.621-41.038-2.242-121.342-.061-198.13 39.656-39.145 20.248-80.545 54.577-113.584 94.185-.407.488-.803.979-1.207 1.468l-74.98 5.792c-12.342.954-23.335 7.423-30.161 17.747l-51.154 77.372c-5.177 7.83-6 17.629-2.203 26.212 3.798 8.584 11.602 14.566 20.877 16.003l63.171 9.784c-.223 1.228-.447 2.455-.652 3.683-2.103 12.58 2.065 25.514 11.151 34.599l87.992 87.993c7.533 7.533 17.712 11.686 28.142 11.686 2.148 0 4.308-.177 6.458-.536 1.228-.205 2.455-.429 3.683-.652l9.784 63.172c1.437 9.275 7.419 17.08 16.001 20.877 3.571 1.58 7.35 2.36 11.112 2.36 5.283-.001 10.529-1.539 15.101-4.562l77.372-51.155c10.325-6.827 16.793-17.82 17.745-30.161l5.792-74.979c.489-.404.981-.8 1.469-1.207 39.609-33.039 73.939-74.439 94.186-113.585 39.719-76.791 41.896-157.096 39.657-198.131zm-175.394 393.037-74.011 48.933-9.536-61.565c31.28-9.197 62.223-23.927 91.702-43.66l-3.773 48.845c-.235 3.047-1.833 5.762-4.382 7.447zm-129.895-37.377-87.993-87.993c-2.245-2.246-3.283-5.401-2.774-8.44 2.616-15.643 6.681-30.534 11.713-44.562l132.028 132.028c-16.848 6.035-31.939 9.635-44.534 11.741-3.044.506-6.195-.529-8.44-2.774zm-117.923-222.269 48.844-3.773c-19.734 29.479-34.464 60.422-43.661 91.702l-61.564-9.535 48.934-74.012c1.686-2.55 4.401-4.147 7.447-4.382zm270.155 155.286c-24.233 20.213-47.756 34.833-69.438 45.412l-149.221-149.221c13.858-28.304 30.771-51.873 45.417-69.431 30.575-36.655 68.602-68.276 104.331-86.756 70.474-36.453 144.725-38.416 182.713-36.348 5.028.274 9.027 4.273 9.301 9.302 2.071 37.988.104 112.238-36.349 182.713-18.479 35.728-50.1 73.754-86.754 104.329z"></path><path d="m350.721 236.243c19.202-.002 38.412-7.312 53.031-21.931 14.166-14.165 21.966-32.999 21.966-53.031s-7.801-38.866-21.966-53.031c-29.242-29.243-76.822-29.241-106.062 0-14.166 14.165-21.967 32.999-21.967 53.031s7.802 38.866 21.967 53.031c14.622 14.622 33.822 21.933 53.031 21.931zm-31.82-106.781c8.772-8.773 20.295-13.159 31.818-13.159 11.524 0 23.047 4.386 31.819 13.159 8.499 8.499 13.179 19.799 13.179 31.818s-4.68 23.32-13.179 31.819c-17.544 17.545-46.093 17.544-63.638 0-8.499-8.499-13.18-19.799-13.18-31.818s4.682-23.32 13.181-31.819z"></path><path d="m15.301 421.938c3.839 0 7.678-1.464 10.606-4.394l48.973-48.973c5.858-5.858 5.858-15.355 0-21.213-5.857-5.858-15.355-5.858-21.213 0l-48.972 48.973c-5.858 5.858-5.858 15.355 0 21.213 2.928 2.929 6.767 4.394 10.606 4.394z"></path><path d="m119.761 392.239c-5.857-5.858-15.355-5.858-21.213 0l-94.154 94.155c-5.858 5.858-5.858 15.355 0 21.213 2.929 2.929 6.767 4.393 10.606 4.393s7.678-1.464 10.606-4.394l94.154-94.154c5.859-5.858 5.859-15.355.001-21.213z"></path><path d="m143.429 437.12-48.973 48.973c-5.858 5.858-5.858 15.355 0 21.213 2.929 2.929 6.768 4.394 10.606 4.394s7.678-1.464 10.606-4.394l48.973-48.973c5.858-5.858 5.858-15.355 0-21.213-5.857-5.858-15.355-5.858-21.212 0z"></path></svg>
                                    </div>
                                    <div class="s2-pricing_text">
                                        <span><?php echo $pack["package_name"]; ?></span>
                                        <strong><?php echo $curency_icon; ?> <?php echo $pack["price"]?></strong>
                                        <P><?php echo $pack["validity"]?> <?php echo $this->lang->line("days"); ?></P>
                                    </div>
                                   <div class="s2-icon_bg">
                                        <svg enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg"><path d="m511.4 38.222c-1.109-20.338-17.284-36.511-37.622-37.621-41.038-2.242-121.342-.061-198.13 39.656-39.145 20.248-80.545 54.577-113.584 94.185-.407.488-.803.979-1.207 1.468l-74.98 5.792c-12.342.954-23.335 7.423-30.161 17.747l-51.154 77.372c-5.177 7.83-6 17.629-2.203 26.212 3.798 8.584 11.602 14.566 20.877 16.003l63.171 9.784c-.223 1.228-.447 2.455-.652 3.683-2.103 12.58 2.065 25.514 11.151 34.599l87.992 87.993c7.533 7.533 17.712 11.686 28.142 11.686 2.148 0 4.308-.177 6.458-.536 1.228-.205 2.455-.429 3.683-.652l9.784 63.172c1.437 9.275 7.419 17.08 16.001 20.877 3.571 1.58 7.35 2.36 11.112 2.36 5.283-.001 10.529-1.539 15.101-4.562l77.372-51.155c10.325-6.827 16.793-17.82 17.745-30.161l5.792-74.979c.489-.404.981-.8 1.469-1.207 39.609-33.039 73.939-74.439 94.186-113.585 39.719-76.791 41.896-157.096 39.657-198.131zm-175.394 393.037-74.011 48.933-9.536-61.565c31.28-9.197 62.223-23.927 91.702-43.66l-3.773 48.845c-.235 3.047-1.833 5.762-4.382 7.447zm-129.895-37.377-87.993-87.993c-2.245-2.246-3.283-5.401-2.774-8.44 2.616-15.643 6.681-30.534 11.713-44.562l132.028 132.028c-16.848 6.035-31.939 9.635-44.534 11.741-3.044.506-6.195-.529-8.44-2.774zm-117.923-222.269 48.844-3.773c-19.734 29.479-34.464 60.422-43.661 91.702l-61.564-9.535 48.934-74.012c1.686-2.55 4.401-4.147 7.447-4.382zm270.155 155.286c-24.233 20.213-47.756 34.833-69.438 45.412l-149.221-149.221c13.858-28.304 30.771-51.873 45.417-69.431 30.575-36.655 68.602-68.276 104.331-86.756 70.474-36.453 144.725-38.416 182.713-36.348 5.028.274 9.027 4.273 9.301 9.302 2.071 37.988.104 112.238-36.349 182.713-18.479 35.728-50.1 73.754-86.754 104.329z"></path><path d="m350.721 236.243c19.202-.002 38.412-7.312 53.031-21.931 14.166-14.165 21.966-32.999 21.966-53.031s-7.801-38.866-21.966-53.031c-29.242-29.243-76.822-29.241-106.062 0-14.166 14.165-21.967 32.999-21.967 53.031s7.802 38.866 21.967 53.031c14.622 14.622 33.822 21.933 53.031 21.931zm-31.82-106.781c8.772-8.773 20.295-13.159 31.818-13.159 11.524 0 23.047 4.386 31.819 13.159 8.499 8.499 13.179 19.799 13.179 31.818s-4.68 23.32-13.179 31.819c-17.544 17.545-46.093 17.544-63.638 0-8.499-8.499-13.18-19.799-13.18-31.818s4.682-23.32 13.181-31.819z"></path><path d="m15.301 421.938c3.839 0 7.678-1.464 10.606-4.394l48.973-48.973c5.858-5.858 5.858-15.355 0-21.213-5.857-5.858-15.355-5.858-21.213 0l-48.972 48.973c-5.858 5.858-5.858 15.355 0 21.213 2.928 2.929 6.767 4.394 10.606 4.394z"></path><path d="m119.761 392.239c-5.857-5.858-15.355-5.858-21.213 0l-94.154 94.155c-5.858 5.858-5.858 15.355 0 21.213 2.929 2.929 6.767 4.393 10.606 4.393s7.678-1.464 10.606-4.394l94.154-94.154c5.859-5.858 5.859-15.355.001-21.213z"></path><path d="m143.429 437.12-48.973 48.973c-5.858 5.858-5.858 15.355 0 21.213 2.929 2.929 6.768 4.394 10.606 4.394s7.678-1.464 10.606-4.394l48.973-48.973c5.858-5.858 5.858-15.355 0-21.213-5.857-5.858-15.355-5.858-21.212 0z"></path></svg>
                                    </div>
                                </div>
                                <div class="s2-pricing_list ul-li-block">
                                    <ul>
                                         <?php 
                                $module_ids=$pack["module_ids"];
                                $monthly_limit=json_decode($pack["monthly_limit"],true);
                                $module_names_array=$this->basic->execute_query('SELECT module_name,id FROM modules WHERE FIND_IN_SET(id,"'.$module_ids.'") > 0  ORDER BY module_name ASC');

                                foreach ($module_names_array as $row) : ?>
                                        <li>
                                            <div class="s2-pricing_list_icon s2-checked  float-left text-center"></div>
                                            <?php 
                                        $limit=0;
                                        $limit=$monthly_limit[$row["id"]];

                                        if($limit=="0") 
                                            $limit2="<b style='
    float: right'>".$this->lang->line("unlimited")."</b>";
                                        else 
                                            $limit2=$limit;

                                        if($row["id"]!="1" && $limit!="0") 
                                            
                                            $limit2="<b  style='
    float: right'>".$limit2."/".$this->lang->line("month")."</b>";
                                            echo $this->lang->line($row["module_name"]);

                                        if($row["id"]!="13" && $row["id"]!="14" && $row["id"]!="16") 
                                            echo " : <b  style='
    float: right'>". $limit2."</b>"."<br>";
                                        else 
                                            echo "<br>";
                                    ?>
                                </li>
                            <?php endforeach; ?>
                                    </ul>
                                </div>
                                <div class="s2-pricing_btn">
                                    <a href="<?php echo base_url('home/login'); ?>"> Try it now</a>
                                </div>
                            </div>
                        </div>
                     
 <?php
                // if($i%4==0) break;
                endforeach;
            ?>
                </div>
            </div>
        </div>
    </section>            
<?php endif; ?>        
   <!-- Start of Testimonial section
  
    ============================================= -->
    <section id="ei-testimonial" class="ei-testimonial-section position-relative <?php if($this->config->item('display_review_block') == '0') echo 'hidden';?>">
        <div class="container">
            <div class="eight-section-title appeight-headline pera-content text-center">
                <span class="eg-title-tag">
                    <?php echo $this->lang->line("Testimonials"); ?><i class="square-shape"> <i></i><i></i><i></i><i></i> </i>
                </span>
                <h2>
                   <?php echo $this->lang->line("Client’s review for"); ?> 
                    <span><?php echo $this->lang->line("work satisfaction."); ?></span>
                </h2>
                <p><?php echo $this->lang->line("Learn From Other Small Business Owners"); ?></p>
            </div>
            <!-- /title -->
            <div class="ei-testimonial-content">
                <div id="testimonial-scroller" class="testimonial-scroller-area owl-carousel">
				 <?php 
                                $customerReview = $this->config->item('customer_review');
                                $ct=0;
							    foreach($customerReview as $singleReview) : 
                                $ct++;
                                $original = $singleReview[2];
                                $base     = base_url();

                                if (substr($original, 0, 4) != 'http') {
                                    $img = $base.$original;
                                } else {
                                   $img = $original;
                                }

                            ?>
                    <div class="ei-testimonial-img-text position-relative">
                        <div class="test--quote-icon">
                            <i class="fas fa-quote-right"></i>
                        </div>
                        <div class="ei-testimonial-img float-left text-center">
                            <img src="<?php echo $img; ?>" alt="">
                        </div>
                        <div class="ei-testimonial-text">
                            <div class="ei-testimonial-name appeight-headline pera-content">
                                <h3><?php echo $singleReview[0]; ?></h3>
                                <span><?php echo $singleReview[1]; ?></span>
                            </div>
                            <p> <?php 
                                                if(strlen($singleReview[3]) > 200 ) {
                                                    $str = substr($singleReview[3],0,180);
                                                    echo $str.". . ."."<a class='exe' type='button' data-toggle='modal' data-target=#myModal".$ct.">see more</a>";
                                                
                                                } else {
                                                    echo $str = $singleReview[3];
                                                }
                                                
                                            ?></p>
                            <div class="ei-testi-rate ul-li clearfix">
                                <ul>
                                    <li><i class="fas fa-star"></i></li>
                                    <li><i class="fas fa-star"></i></li>
                                    <li><i class="fas fa-star"></i></li>
                                    <li><i class="fas fa-star"></i></li>
                                    <li><i class="fas fa-star"></i></li>
                                </ul>
                            </div>
                        </div>
                    </div>
					 <?php endforeach; ?>
                </div>
            </div>
        </div>
        <div class="testimonial-floatingimg testimonial-float-img1 ul-li-block">
            <ul>
                <li><img src="<?php echo base_url('home/xit_load_files/images/tf1.jpg'); ?>" alt=""></li>
                <li><img src="<?php echo base_url('home/xit_load_files/images/tf3.jpg'); ?>" alt=""></li>
                <li><img src="<?php echo base_url('home/xit_load_files/images/tst1.jpg'); ?>" alt=""></li>
                <li><img src="<?php echo base_url('home/xit_load_files/images/tst2.jpg'); ?>" alt=""></li>
            </ul>
        </div>
        <div class="testimonial-floatingimg testimonial-float-img2 ul-li-block">
            <ul>
                <li><img src="<?php echo base_url('home/xit_load_files/images/tf1.jpg'); ?>" alt=""></li>
                <li><img src="<?php echo base_url('home/xit_load_files/images/tf3.jpg'); ?>" alt=""></li>
                <li><img src="<?php echo base_url('home/xit_load_files/images/tst1.jpg'); ?>" alt=""></li>
                <li><img src="<?php echo base_url('home/xit_load_files/images/tst2.jpg'); ?>" alt=""></li>
            </ul>
        </div>
    </section>
   <!-- End of Testimonial section
    ============================================= -->
    
      <?php if($this->is_ad_enabled && $this->is_ad_enabled4) : ?>  
   <div class="row justify-content-center">      
        <div class="p-3 add-320-250 hidden-md hidden-lg text-center" style="background: #F5F4F4;"><?php echo $this->ad_content4; ?></div> 
   
    </div>
     <?php endif; ?> 
    <!-- Start of Faq section
        ============================================= -->
        <section id="ei-faq" class="ei-faq-section position-relative">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="ei-faq-content">
                            <div class="ei-title-faq pera-content">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="eight-section-title appeight-headline pera-content text-left">
                                            <span class="eg-title-tag">
                                                <?php echo $this->lang->line("Frequently asked Question"); ?><i class="square-shape"><i></i><i></i> <i></i><i></i></i>
                                            </span>
                                            <h2><?php echo $this->lang->line("Learn about features"); ?>
                                                <span><?php echo $this->lang->line("from FAQ"); ?>!</span></h2>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <p><?php echo $this->lang->line("Have a question? Check out our frequently asked questions to find your answer."); ?></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /title -->
                                <div class="ei-faq-queans">
                                    <div class="accordion" id="accordionExample">
                                        <div class="ei-faq faq_bg">
                                            <div class="ei-faq-header" id="headingOne">
                                                <button class="" data-toggle="collapse" data-target="#collapseOne" aria-controls="collapseOne">
                                                   <?php echo $this->lang->line("I am a beginner at Online Marketing, can I learn this easy?"); ?>
                                                </button>
                                            </div>
                                            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                                <div class="ei-faq-body">
                                                   <?php echo $this->lang->line("Yes! We designed Our Website to be beginner friendly. We have tons of Documents and video tutorials to help you get started."); ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="ei-faq">
                                            <div class="ei-faq-header" id="headingtwo">
                                                <button class="collapsed" data-toggle="collapse" data-target="#collapsetwo" aria-controls="collapsetwo">
                                                     <?php echo $this->lang->line("What features offer to help me with online marketing?"); ?>
                                                </button>
                                            </div>
                                            <div id="collapsetwo" class="collapse" data-parent="#accordionExample">
                                                <div class="ei-faq-body">
                                                     <?php echo $this->lang->line("We have a lot of features but we can classify these into 5 types. Email Marketing, SMS Marketing, Messenger Marketing, Ecommerce and Social Media Automations. Get started for free to get hands on knowledge how our app can help you - we also encourage you to watch our tutorials inside."); ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="ei-faq">
                                            <div class="ei-faq-header" id="headingthree">
                                                <button class="collapsed" data-toggle="collapse" data-target="#collapsethree" aria-controls="collapsethree">
                                                   <?php echo $this->lang->line("How long can I use Your Service for free?"); ?>
                                                </button>
                                            </div>
                                            <div id="collapsethree" class="collapse" data-parent="#accordionExample">
                                                <div class="ei-faq-body">
                                                 <?php echo $this->lang->line("You have up to 24h to use Our App for free. This should be more than enough time to help you see if Our App is for you."); ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="ei-faq">
                                            <div class="ei-faq-header" id="headingfour">
                                                <button class="collapsed" data-toggle="collapse" data-target="#collapsefour" aria-controls="collapsefour">
                                                  <?php echo $this->lang->line("Can I unsubscribe anytime? How about refunds?"); ?>
                                                </button>
                                            </div>
                                            <div id="collapsefour" class="collapse" data-parent="#accordionExample">
                                                <div class="ei-faq-body">
                                                    <?php echo $this->lang->line("Yes! You can unsubscribe anytime. For refunds, of course there are refunds as long as you don't abuse our refund policy."); ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <span class="ei-faq-shape fq-shape-style1" data-parallax='{"x" : 50}'><img src="<?php echo base_url('home/xit_load_files/images/fq-shape1.png'); ?>" alt=""></span>
                <span class="ei-faq-shape fq-shape-style2"><img src="<?php echo base_url('home/xit_load_files/images/fq-shape2.png'); ?>" alt=""></span>
                <span class="ei-faq-shape fq-shape-style3"><img src="<?php echo base_url('home/xit_load_files/images/fq-shape3.png'); ?>" alt=""></span>
                <span class="ei-faq-shape fq-shape-style4" data-parallax='{"y" : 60}'><img src="<?php echo base_url('home/xit_load_files/images/fq-shape4.png'); ?>" alt=""></span>
                <span class="ei-faq-shape fq-shape-style5"><img src="<?php echo base_url('home/xit_load_files/images/fq-shape5.png'); ?>" alt=""></span>
                <span class="ei-faq-shape fq-shape-style6"><img src="<?php echo base_url('home/xit_load_files/images/fq-shape6.png'); ?>" alt=""></span>
                <span class="ei-faq-shape fq-shape-style8"><img src="<?php echo base_url('home/xit_load_files/images/fq-shape8.png'); ?>" alt=""></span>
                <span class="ei-faq-shape fq-shape-style7"><img src="<?php echo base_url('home/xit_load_files/images/fq-shape7.png'); ?>" alt="">
				    <img src="<?php echo base_url('home/xit_load_files/images/fq-shape7.png'); ?>" alt="">
                    <img src="<?php echo base_url('home/xit_load_files/images/fq-shape7.png'); ?>" alt=""></span>
                </section>
    <!-- End of Faq section
        ============================================= -->   
   
        
   <section id="ei-newslatter" class="ei-newslatter-section position-relative">
            <div class="ei-newslatter-box position-relative">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="contact mt-30">
                        <h4 class="contact-title"><?php echo $this->lang->line('Contact'); ?></h4>
                        <p class="text" style="line-height: 45px">
                          Our experts can help you craft your marketing strategy and create killer funnels to grow your business.Automate & Combine Facebook Messenger to Grow Your Business</p></br>
                       
                    </div> <!-- contact -->
                </div>
                <div class="col-lg-6">
                    <div class="contact-form form-style-one mt-15">
					 <div class="form-input mt-15">
						 <?php 
										if($this->session->userdata('mail_sent') == 1) {
										echo "<div class='alert alert-success text-center'>".$this->lang->line("we have received your email. we will contact you through email as soon as possible")."</div>";
										$this->session->unset_userdata('mail_sent');
										}
									?>
							</div>
                        <form action="<?php echo site_url("home/email_contact"); ?>" method="post">
						<div class="form-input mt-15">
                                <div class="input-items default">
                                        <input type="text" class="form-control" required id="subject" <?php echo set_value("subject"); ?> placeholder="<?php echo $this->lang->line("message subject");?>" name="subject">
                                            
                                    
                                </div>
                            </div> <!-- form input -->
                            <div class="form-input mt-15">
                                <div class="input-items default">
                                       <input type="email" class="form-control" required id="email" <?php echo set_value("email"); ?> placeholder="<?php echo $this->lang->line("email");?>" name="email">
                                   
                                </div>
                            </div> <!-- form input -->
                            <div class="form-input mt-15">
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
							
                            <div class="form-input mt-15">
                                <div class="input-items default">
                                       <textarea class="form-control" rows="3" required id="message" <?php echo set_value("message"); ?> placeholder="  <?php echo $this->lang->line("message");?>" name="message"></textarea>
                                            
                                   
                                </div>
                            </div> <!-- form input -->
                            <p class="form-message"></p>
                            <div class="form-input text-center standard-buttons mt-20 contact-button">
                                <button class="main-btn standard-two" type="submit"><?php echo $this->lang->line("SEND MESSANGE");?></button>
                            </div> <!-- form input -->
                        </form>
                    </div> <!-- contact form -->
                </div>
            </div> <!-- row -->
        </div> <!-- container -->
              <div class="ei-news-vector1 position-absolute"><img src="<?php echo base_url('home/xit_load_files/images/n-shape1.2.png'); ?>" alt=""></div>
                <div class="ei-news-vector3 position-absolute" data-parallax="{&quot;x&quot; : 50}" style="transform:translate3d(0.029px, 0px, 0px) rotateX(0deg) rotateY(0deg) rotateZ(0deg) scaleX(1) scaleY(1) scaleZ(1); -webkit-transform:translate3d(0.029px, 0px, 0px) rotateX(0deg) rotateY(0deg) rotateZ(0deg) scaleX(1) scaleY(1) scaleZ(1); "><img src="<?php echo base_url('home/xit_load_files/images/n-shape3.png'); ?>" alt=""></div>
           
          </div>
    </section>
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
                                <li><a href="#ei-newslatter"><?php echo $this->lang->line("Contact"); ?></a></li>
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
                <h4>This website uses cookies</h4>
                <p style="color:#000;">
                    <?php echo $this->lang->line("We use cookies to improve user experience. You can read more about our Cookie Policy in our Privacy policy and Gdpr compliant");?>
                </p>
                </br>
                
                <a type="button" href="<?php echo base_url();?>/home/gdpr" target="_blank" style="color:#000;" class="float-left btn btn-warning btn-sm acceptcookies" aria-label="Close">
                    <?php echo $this->lang->line("Learn More →"); ?>
                </a>
                <a type="button" href="#" style="color:#000;" class="ml-3 float-left btn btn-warning btn-sm acceptcookies" aria-label="Close">
                    <?php echo $this->lang->line("Agree and close"); ?>
                </a>
                

            </div>
        </div>
    <?php endif; ?>
  
    
    <!-- /COOKIES -->
      <!-- End of Footer  section
        ============================================= -->            

    <!-- Scripts -->
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
    
      <?php $this->load->view("include/fb_px"); ?> 
    <?php $this->load->view("include/google_code"); ?> 
    	 </body>
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
    .add-970-90{
    height: 90px;
    margin: 10px;
 }
  .add-970-90 img{width: 970px;}
    .add-300-600 img{width: 300px;}
    .add-320-100 img{width: 320px; }
    .add-300-250 img{width: 300px; }
    .s2-pricing_list {    height: 400px;
        overflow: auto;}
    .hidden-xs {display:block;}
    .hidden-md, .hidden-lg  {display:none;}
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
      .hidden-md, .hidden-lg  {display:block}
      .hidden-xs {display:none;}
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
   

</html>