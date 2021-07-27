<div class="container mt-5">
  <div class="row">
    <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-6 offset-xl-3">
      <div class="login-brand">
        <a href="<?php echo base_url();?>"><img src="<?php echo base_url(); ?>assets/img/logo.png" alt="<?php echo $this->config->item('product_name');?>" width="200"></a>
      </div>

      <div class="card card-primary">
        <div class="card-header"><h4><i class="fab fa-keycdn"></i> <?php echo $this->lang->line("Password Recovery"); ?></h4></div>

        <div class="card-body" id="recovery_form">
          <p class="text-muted"><?php echo $this->lang->line("We will send you a email containing steps to reset password"); ?></p>
          <form method="POST">
            <div class="form-group">
              <label for="email"><?php echo $this->lang->line("email"); ?> *</label>
              <input id="email" type="email" class="form-control" id="email" name="email" tabindex="1" autofocus>
              <div class="invalid-feedback"><?php echo $this->lang->line("Please enter your email"); ?></div>
            </div>

            <div class="form-group">
              <button type="submit" id="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
               <i class="far fa-paper-plane"></i> <?php echo $this->lang->line("Send Reset Link"); ?>
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>



<script type="text/javascript">
$('document').ready(function(){
  $("#submit").click(function(e){
    e.preventDefault();


    var email=$("#email").val();
    if(email=='')
    {
        $("#email").addClass('is-invalid');
        return false;
    }
    else
    {
        $("#email").removeClass('is-invalid');
    }
    $(this).addClass('btn-progress');
    $.ajax({
      context: this,
      type:'POST',
      url: "<?php echo site_url();?>home/code_genaration",
      data:{email:email},
      success:function(response){
        $(this).removeClass('btn-progress');
        if(response=='0')
        {
          swal('<?php echo $this->lang->line("Error") ?>', '<?php echo $this->lang->line("Invalid email or it is not associated with any user") ?>', 'error');
        }
        else
        {
          var string='<div class="alert alert-primary alert-has-icon"><div class="alert-icon"><i class="far fa-paper-plane"></i></div><div class="alert-body"><div class="alert-title"><?php echo $this->lang->line("Sent") ?></div><?php echo $this->lang->line("A email containing password reset steps has been sent to your email."); ?></div></div>';
          $("#recovery_form").slideUp();
          $("#recovery_form").html(string);
          $("#recovery_form").slideDown();
        }
    }
    });
    
  });
});
</script>