<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
	<meta charset="utf-8">
	<title><?php echo $this->config->item('product_name')." | ".$page_title;?></title>
	<meta name="description" content="">
	<meta name="author" content="<?php echo $this->config->item('institute_address1');?>">

	<!-- Mobile Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Favicon -->
	<link rel="shortcut icon" href="<?php echo base_url();?>assets/img/favicon.png">

    <!--====== STYLESHEETS ======-->
    <link href="<?php echo base_url('home/xit_load_files/css/normalize.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/animate.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/modal-video.min.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/stellarnav.min.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/owl.carousel.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/slick.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/front_bootstrap.min.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/font-awesome.min.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/material-icons.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/responsive.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('home/xit_load_files/css/xit_style.css'); ?>" rel="stylesheet">

    <?php if($this->uri->segment('1')=='blog' && $this->uri->segment('2')=='post_details') 
    {
        $ogtitle = $this->config->item("product_short_name")." | ".$post[0]['title'];
        $ogdesc = mb_substr(strip_tags($post[0]["body"]), 0,200);
        $ogtitle = str_replace(array("'",'"',"\\"), array('`','`','/'), $ogtitle );
        $ogdesc = str_replace(array("'",'"',"\\"), array('`','`','/'), $ogdesc );
        ?>
        <meta name="keywords" content="<?php echo $post[0]["tags"]; ?>">
        <meta name="author" content="<?php echo $this->config->item("product_short_name");?>">
        <meta name="copyright" content="<?php echo $this->config->item("product_short_name");?>" />
        <meta name="application-name" content="<?php echo $this->config->item("product_short_name");?>" />  
        <meta property="og:type" content="website" />
        <meta property="og:url" content="<?php echo current_url(); ?>"/>
        <meta name="twitter:card" content="summary" />
        <meta property="og:title" content='<?php echo $ogtitle; ?>' />
        <meta name="twitter:title" content='<?php echo $ogtitle; ?>' />
        <meta property="og:description" content="<?php echo $ogdesc; ?>" />
        <meta name="twitter:description" content="<?php echo $ogdesc; ?>" />
        <meta name="description" content="<?php echo $ogdesc; ?>">
        <?php if($post[0]['thumbnail'] !=''): ?>
        <meta property="og:image" content="<?php echo base_url('upload/blog/'.$post[0]['thumbnail']); ?>" />
        <meta name="twitter:image" content="<?php echo base_url('upload/blog/'.$post[0]['thumbnail']); ?>" />
        <?php endif; ?>
    <?php 
    } ?>

    <script src="<?php echo base_url('home/xit_load_files/js/modernizr-2.8.3.min.js'); ?>"></script>
    <!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

<body class="home-two" data-spy="scroll" data-target=".mainmenu-area" data-offset="90">

    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <!--- PRELOADER -->
    <div class="preeloader">
        <div class="preloader-spinner"></div>
    </div>

    <!--SCROLL TO TOP-->
    <a href="#home" class="scrolltotop"><i class="fa fa-long-arrow-up"></i></a>

    <!--START TOP AREA-->
    <header>
        <div class="header-top-area">
            <!--MAINMENU AREA-->
            <div class="mainmenu-area" id="mainmenu-area">
                <!-- <div class="mainmenu-area-bg"></div> -->
                <nav class="navbar">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a href="<?php echo base_url();?>" class="navbar-brand"><img style="max-height:45px !important" src="<?php echo base_url();?>assets/img/logo.png" alt="<?php echo $this->config->item('product_name');?>"></a>
                        </div>
                        <div id="main-nav" class="stellarnav">
                            <div class="search-and-signup-button white pull-right hidden-sm hidden-xs">
                                <a href="<?php echo site_url('home/login'); ?>" class="sign-up"><?php echo $this->lang->line('Login'); ?></a>
                            </div>
                            <ul id="nav" class="nav">
                                <li class="active">
                                    <a href="<?php echo base_url('#home');?>"><?php echo $this->lang->line('home'); ?></a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url('#features');?>"><?php echo $this->lang->line('Features');?></a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url('#download');?>"><?php echo $this->lang->line('Pricing'); ?></a>
                                </li>
                                <li <?php if($this->config->item('display_video_block') == '0') echo "class='hidden'"; ?>>
                                    <a href="<?php echo base_url('#tutorial');?>"><?php echo $this->lang->line('Tutorial');?></a>
                                </li>
                                <?php if ($this->session->userdata('license_type') == 'double')  {?>
                                <li>
                                    <a href="<?php echo base_url('blog');?>"><?php echo $this->lang->line('Blog'); ?></a>
                                </li>
                                <?php } ?>
                                <li>
                                    <a href="<?php echo base_url('#contact');?>"><?php echo $this->lang->line('Contact'); ?></a>
                                </li>
                                <li class="hidden-md hidden-lg">
                                    <a href="<?php echo site_url('home/login'); ?>"><?php echo $this->lang->line('Login'); ?></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <!--END MAINMENU AREA END-->
        </div>
        
    </header>
    <!--END TOP AREA-->




    <!--ABOUT AREA-->
    <section class="about-area section-padding" id="app">
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

  

  
    <!--FOOER AREA-->
    <footer class="footer-area white relative">
        <div class="area-bg"></div>
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                        <div class="footer-copyright text-center wow fadeIn">
                            <p>
                            	<?php echo $this->config->item("product_short_name"); ?> &copy; <a target="_blank" href="<?php echo site_url(); ?>"><?php echo $this->config->item("institute_address1"); ?></a></p>
                        	<p class="text-center" style="font-size: 10px;">
								<a href="<?php echo base_url('home/privacy_policy'); ?>" target="_blank"><?php echo $this->lang->line("Privacy Policy"); ?></a> | <a href="<?php echo base_url('home/terms_use'); ?>" target="_blank"><?php echo $this->lang->line("Terms of Service"); ?></a> | <a href="<?php echo base_url('home/gdpr'); ?>" target="_blank"><?php echo $this->lang->line("GDPR Compliant"); ?></a>
							</p>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </footer>



    <!--====== SCRIPTS JS ======-->
    <script src="<?php echo base_url('home/xit_load_files/js/jquery-1.12.4.min.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/bootstrap.min.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/jquery.easing.1.3.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/jquery-migrate-1.2.1.min.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/jquery.appear.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/owl.carousel.min.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/slick.min.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/stellar.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/wow.min.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/jquery-modal-video.min.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/stellarnav.min.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/contact-form.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/jquery.ajaxchimp.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/jquery.sticky.js'); ?>"></script>
    <script src="<?php echo base_url('home/xit_load_files/js/main.js'); ?>"></script>

    <?php $this->load->view("include/fb_px"); ?> 
    <?php $this->load->view("include/google_code"); ?>
    <?php include("application/modules/blog/views/blog_js.php"); ?>
    
</body>
</html>

<style type="text/css" media="screen">
    .red{color:red;}
</style>


<style>
    .exe { font-weight: bold; } 
    .exe:hover  { cursor: pointer; text-decoration: underline;  }    
    h4{margin: 30px 0 20px;}
</style>

