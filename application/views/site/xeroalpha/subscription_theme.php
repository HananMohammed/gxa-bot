<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title><?php echo $this->config->item('product_name')." | ".$page_title;?></title>
  <link rel="shortcut icon" href="<?php echo base_url();?>assets/img/favicon.png">
  <link href="https://cdn.lineicons.com/2.0/LineIcons.css" rel="stylesheet">
  <link href="<?php echo base_url('home/xit_load_files/css/bootstrap.min.css'); ?>" rel="stylesheet">
  <link href="<?php echo base_url('home/xit_load_files/css/bootstrap-social.css'); ?>" rel="stylesheet">
  <link href="<?php echo base_url('home/xit_load_files/css/all.min.css'); ?>" rel="stylesheet">
  <link href="<?php echo base_url('home/xit_load_files/css/v4-shims.min.css'); ?>" rel="stylesheet">
  <link href="<?php echo base_url('home/xit_load_files/css/style.css'); ?>" rel="stylesheet">
  <link href="<?php echo base_url('home/xit_load_files/css/components.css'); ?>" rel="stylesheet">
  <link href="<?php echo base_url('home/xit_load_files/css/custom.css'); ?>" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>

<body>
  <div id="app">
    <section class="section">
      <?php echo $this->load->view($body); ?>
    </section>
  </div>
  <script src="<?php echo base_url('home/xit_load_files/js/jquery.min.js'); ?>"></script>
  <script src="<?php echo base_url('home/xit_load_files/js/sweetalert.min.js'); ?>"></script>
</body>

<?php $this->load->view("include/fb_px"); ?> 
<?php $this->load->view("include/google_code"); ?>
</html>