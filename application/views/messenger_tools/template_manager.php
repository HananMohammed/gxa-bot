<!-- new datatable section -->
<section class="section section_custom">
  <div class="section-header">
    <h1><i class="fa fa-th-large"></i> <?php echo $this->lang->line('Post-back Manager'); ?> </h1>
    
    <div class="section-header-button">
      <?php if($visual_flow_builder_exist == 'yes') : ?>
        <a class="btn btn-primary" href="<?php echo base_url('messenger_bot/create_new_template'); ?>">
          <i class="fas fa-plus-circle"></i> <?php echo $this->lang->line("Create with classic editor"); ?>
        </a>&nbsp;
        <?php if($builder_access == 'yes') : ?>
          <a class="btn btn-primary" name="add" id="add"  href="#">
             <i class="fas fa-plus-circle"></i> <?php echo $this->lang->line("Create with visual flow builder"); ?>
          </a> 
        <?php endif; ?>
      <?php else : ?>
        <a class="btn btn-primary" href="<?php echo base_url('messenger_bot/create_new_template'); ?>">
          <i class="fas fa-plus-circle"></i> <?php echo $this->lang->line("Create new template"); ?>
        </a> 
      <?php endif; ?>
    </div>

    <div class="section-header-breadcrumb">
      <div class="breadcrumb-item"><a href="<?php echo base_url('messenger_bot'); ?>"><?php echo $this->lang->line("Messenger Bot"); ?></a></div>
      <div class="breadcrumb-item"><?php echo $this->lang->line("Post-back Manager"); ?></div>
    </div>
  </div>

  <?php $this->load->view('admin/theme/message'); ?>

  <div class="section-body">
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-body data-card">

            <div class="input-group mb-3" id="searchbox">
                <div class="input-group-prepend">
                    <select class="select2 form-control" id="page_id">
                      <option value=""><?php echo $this->lang->line("Page"); ?></option>
                        <?php foreach ($page_info as $key => $value): ?>
                          <option value="<?php echo $value['id']; ?>"><?php echo $value['page_name']; ?></option>
                        <?php endforeach ?>
                  </select>
                </div>
                <input type="text" class="form-control" id="postback_id" autofocus placeholder="<?php echo $this->lang->line('PostBack'); ?>" aria-label="" aria-describedby="basic-addon2" style="max-width: 30%">
                <div class="input-group-append">
                      <button class="btn btn-primary" id="search_submit" type="button"><i class="fas fa-search"></i> <span class="d-none d-sm-inline"><?php echo $this->lang->line('Search'); ?></span></button>
                </div>
            </div>
            
            <div class="table-responsive2">
              <table class="table table-bordered" id="mytable">
                <thead>
                  <tr>
                    <th>#</th>      
                    <th style="vertical-align:middle;width:20px">
                        <input class="regular-checkbox" id="datatableSelectAllRows" type="checkbox"/><label for="datatableSelectAllRows"></label>        
                    </th>
                    <th><?php echo $this->lang->line("id")?></th>
                    <th><?php echo $this->lang->line("Page Name")?></th>
                    <th><?php echo $this->lang->line("Postback Template Name")?></th>
                    <th><?php echo $this->lang->line("Postback ID")?></th>
                    <?php if($visual_flow_builder_exist == 'yes') : ?>
                      <th><?php echo $this->lang->line("Type")?></th>
                    <?php endif; ?>
                    <th><?php echo $this->lang->line("Actions")?></th>
                  </tr>
                </thead>
              </table>
            </div>            
          </div>

        </div>
      </div>
    </div>
    
  </div>
</section>


<script>       
    var base_url="<?php echo site_url(); ?>";
    
    var visual_flow_builder_exist = "<?php echo $visual_flow_builder_exist; ?>";
    if(visual_flow_builder_exist == 'yes')
      var shortable_column = [0,1,2,7];
    else
      var shortable_column = [0,1,2,6];

    $(document).ready(function() {

      var perscroll;
      var table = $("#mytable").DataTable({
          serverSide: true,
          processing:true,
          bFilter: false,
          order: [[ 2, "desc" ]],
          pageLength: 10,
          ajax: {
              url: base_url+'messenger_bot/template_manager_data',
              type: 'POST',
              data: function ( d )
              {
                  d.page_id = $('#page_id').val();
                  d.postback_id = $('#postback_id').val();
              }
          },          
          language: 
          {
            url: "<?php echo base_url('assets/modules/datatables/language/'.$this->language.'.json'); ?>"
          },
          dom: '<"top"f>rt<"bottom"lip><"clear">',
          columnDefs: [
            {
                targets: [1,2],
                visible: false
            },
            {
                targets: '',
                className: 'text-center'
            },
            {
                targets: shortable_column,
                sortable: false
            }
          ],
          fnInitComplete:function(){  // when initialization is completed then apply scroll plugin
              if(areWeUsingScroll)
              {
                if (perscroll) perscroll.destroy();
                perscroll = new PerfectScrollbar('#mytable_wrapper .dataTables_scrollBody');
              }
          },
          scrollX: 'auto',
          fnDrawCallback: function( oSettings ) { //on paginition page 2,3.. often scroll shown, so reset it and assign it again 
              if(areWeUsingScroll)
              {
                if (perscroll) perscroll.destroy();
                perscroll = new PerfectScrollbar('#mytable_wrapper .dataTables_scrollBody');
              }
          }
      });


      $(document).on('click', '#search_submit', function(event) {
        event.preventDefault(); 
        table.draw();
      });

      $(document).on('click', '.get_json_code', function(event) {
        event.preventDefault(); 
        var waiting_content = '<div class="text-center waiting"><i class="fas fa-spinner fa-spin blue text-center" style="font-size: 40px;"></i></div>';
        var table_id = $(this).attr('table_id');
        $('#get_json_code_modal_body').html(waiting_content);
        $('#get_json_code').modal();
        
        $.ajax({
          context: this,
          type:'POST' ,
          url:"<?php echo base_url('messenger_bot/get_json_code'); ?>",
          // dataType: 'json',
          data:{table_id:table_id},
          success:function(response){ 
            $('#get_json_code_modal_body').html(response);
          }
        });
      });

      $(document).on('change', '#page_id', function(event) {
        event.preventDefault(); 
        table.draw();
      });

      $(document).on('click','.delete_template',function(e){
        e.preventDefault();

        swal({
          title: '<?php echo $this->lang->line("Delete!"); ?>',
          text: '<?php echo $this->lang->line("Do you want to detete this template?"); ?>',
          icon: 'warning',
          buttons: true,
          dangerMode: true,
        })
        .then((willDelete) => {
          if (willDelete) 
          {
            var base_url = '<?php echo site_url();?>';
            $(this).addClass('btn-progress');
            var table_id = $(this).attr('table_id');

            $.ajax({
              context: this,
              type:'POST' ,
              url:"<?php echo site_url();?>messenger_bot/ajax_delete_template_info",
              // dataType: 'json',
              data:{table_id:table_id},
              success:function(response){ 
                $(this).removeClass('btn-progress');
                if(response=='success')
                {
                  iziToast.success({title: '',message: '<?php echo $this->lang->line("Template has been deleted successfully."); ?>',position: 'bottomRight'});
                  table.draw();
                }
                else if(response=='no_match')
                {
                  iziToast.error({title: '',message: '<?php echo $this->lang->line("No Template is found for this user with this ID."); ?>',position: 'bottomRight'});
                }
                else
                {
                  $("#delete_template_modal_body").html(response);
                  $("#delete_template_modal").modal();
                }
              }
            });
          } 
        });


      });

      $('#add').click(function(e){
          e.preventDefault();
          $('#dynamic_field_modal').modal('show');
      });

      $('#submit').click(function(e) {
          e.preventDefault();
         var page_table_id = $('#page_table_id').val();
         if(page_table_id == '')
         {
              swal('<?php echo $this->lang->line("Warning"); ?>', '<?php echo $this->lang->line("You have to select a page"); ?>', 'warning');
              return false;
         }
         else
         {
              var link = base_url + "visual_flow_builder/load_builder/" + page_table_id + "/0";
              window.location.replace(link);
         }

      });

      $(document).on('click', '.edit_reply_info', function(event) {
        event.preventDefault();
        var table_id = $(this).attr('table_id');
        var link = base_url + "visual_flow_builder/edit_builder_data/" + table_id + "/2";
        window.location.replace(link);
      });



    });
  
 
</script>

<div class="modal fade" id="get_json_code" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center"><i class="fas fa-code"></i> <?php echo $this->lang->line("JSON Code"); ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body" id="get_json_code_modal_body">                
              
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="delete_template_modal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center"><i class="fa fa-trash"></i> <?php echo $this->lang->line("Template Delete Confirmation"); ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body" id="delete_template_modal_body">                

            </div>
        </div>
    </div>
</div>

<div id="dynamic_field_modal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" id="page_name">
                <div class="modal-body" style="padding-bottom:0">
                    <div class="row">
                          <div class="col-12"> 
                                <div class="form-group">
                                  <label><?php echo $this->lang->line("Please select a page"); ?></label>
                                  <?php 
                                  $page_list[''] = $this->lang->line("Choose a Page");
                                  echo form_dropdown('page_table_id',$page_list,'','id="page_table_id" class="form-control select2" style="width:100%;"'); 
                                  ?>
                              </div>       
                          </div>
                    </div>
                </div>
                <div class="modal-footer" style="margin-top: 10px;">
                    <button class="btn btn-lg btn-secondary" data-dismiss="modal"><i class="fas fa-times"></i> <?php echo $this->lang->line("Cancel"); ?></button>
                    <button id="submit" class="btn btn-primary btn-lg"><i class="fas fa-check"></i> <?php echo $this->lang->line('Ok'); ?></button>
                    
                </div>
            </form>
        </div>
    </div>

</div> 