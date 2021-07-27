<link href="https://cdn.lineicons.com/2.0/LineIcons.css" rel="stylesheet">


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
<div class="wrapper pd-5 pt-5 ei-faq-section position-relative" style="background: transparent;">
    <div class="content" >
      <div class="text text-center"><?php echo $this->lang->line("Recovery"); ?></div>
       <div id="recovery_form">
	   <form method="POST">
        <div class="field">
           <span class="lni lni-envelope text-center"></span>
		  <input id="email" type="email" placeholder="your email" required  id="email" name="email" tabindex="1" autofocus>
		</div>
        <div class="forgot-pass"><?php echo $this->lang->line("Please enter your email"); ?></div>
        <button type="submit" id="submit" tabindex="4"><?php echo $this->lang->line("Reset"); ?></button>
		<div class="signup"><?php echo $this->lang->line("Back to Login"); ?>
          <a href="<?php echo base_url('home/login'); ?>"><?php echo $this->lang->line("Signin Now"); ?></a>
        </div>
		</div>
      </form>
</div> 
<div class="opa">
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
<style>

body{
  background: #dde1e7 !important;
}
.opa{
    opacity: 0.1;
}
.content{
	z-index: 99999;
   margin: auto !important;
  width: 330px;
  background: #dde1e7 !important;
  border-radius: 10px !important;
  padding: 40px 30px !important;
  box-shadow: -3px -3px 7px #ffffff73,
              2px 2px 5px rgba(94, 104, 121, 0.288) !important;
}
.wrapper{
margin-bottom: 90px;
 position: relative;
}
.content .text{
  font-size: 33px;
  font-weight: 600;
  margin-bottom: 35px;
  color: #000;
}
.content .field{
  height: 50px;
  width: 100%;
  display: flex;
  position: relative;
}

.field input{
  height: 100%;
  width: 100%;
  padding-left: 45px;
  font-size: 18px;
  outline: none;
  border: none;
  color: #595959;
  background: #dde1e7;        
  border-radius: 25px;
  box-shadow: inset 2px 2px 5px #babecc,
              inset -5px -5px 10px #ffffff73;
}

.field input:focus ~ label{
  box-shadow: inset 2px 2px 5px #babecc,
              inset -1px -1px 2px #ffffff73;
}

.field:nth-child(2){
  margin-top: 20px;
}
button:hover{
    margin: 15px 0;
    width: 100%;
    height: 50px;
    color: #000;
    font-size: 18px;
    font-weight: 600;
    background: #dde1e7;
    border: none;
    outline: none;
    cursor: pointer;
    border-radius: 25px;
    box-shadow: 2px 2px 5px #babecc, -5px -5px 10px #ffffff73;
}
.field span{ 
position: absolute;
  width: 50px;
  line-height: 50px;
  color: #595959;
}

.field label{
  position: absolute;
  top: 50%;
  left: 45px;
  pointer-events: none;
  color: #666666;
  transform: translateY(-50%);
}


.field input:focus ~ label{  
 opacity: 0;
}

.forgot-pass{
  text-align: left;
  margin: 10px 0 10px 5px;
}

.forgot-pass a{
  font-size: 16px;
  color: #3498db;
  text-decoration: none;
}

.forgot-pass:hover a{
  text-decoration: underline;
}  
button{
  margin: 15px 0;
  width: 100%;
  height: 50px;
  color: #000;
  font-size: 18px;
  font-weight: 600;
  background: #dde1e7;
  border: none;
  outline: none;
  cursor: pointer;
  border-radius: 25px;
  box-shadow: 2px 2px 5px #babecc,
              -5px -5px 10px #ffffff73;
}

 button:focus{
  color: #3498db;
  box-shadow: inset 2px 2px 5px #babecc,
              inset -5px -5px 10px #ffffff73;
}

.signup{
  font-size: 16px;
  color: #595959;
  margin: 10px 0;
}

.signup a{
  color: #000;
  text-decoration: none;
}

.signup a:hover{
  text-decoration: underline;
}                                                                                                                                     
      
	  </style>