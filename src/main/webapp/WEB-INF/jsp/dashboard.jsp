<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="head.jsp" %>  
</head>

 <style>
  
  .voto-1 {
	color: #444444;
  }
  .voto-2 {
	color: #a90606;
  }
  .voto-3 {
	color: #f1c232;
  }
  .voto-4 {
	color: #4154f1;
  }
  .voto-5 {
	color: #00b662;
  }
  
  </style>
  
  <script src="local/js/campanha.js"></script>

<script>
	$(document).ready(function(){

		 
		 $(document).on("_click", ".widgetEvento", function(evento){
			 alert(JSON.stringify($(this)));
			 alert(JSON.stringify(evento));
	     });
		 
		 $(document).on("click", ".widgetNovoEvento", function(){
		    $('#modalCadastrarEvento').modal('show');
		    $("#formCampanha").find(".btn-primary").html('Salvar');
	    	$("#formCampanha")[0].reset();
	    	$(".codigoCampanha").html('0');	 
		 });
		 
		 
		 $("#filtroPorEvento").on("keyup", function() {
			    var value = $(this).val().toLowerCase();
			    $(".eventos .dadosEvento").filter(
			    		function() {
			              $(this).toggle(
			            		  $(this).data('nomeevento').toLowerCase().indexOf(value) > -1
			            	      || 	  
			            		  $(this).data('ensaio').toLowerCase().indexOf(value) > -1
			            		  ||
			            		  $(this).data('dataapresentacao').toLowerCase().indexOf(value) > -1
			              
			              )
			    });
			  });
		 
// 		 $("#filtroPorDescricao").on("keyup", function() {
// 			    var value = $(this).val().toLowerCase();
// 			    $(".eventos .dadosEvento").filter(
// 			    		function() {
// 			              $(this).toggle(
// 			            		  $(this).data('descricao').toLowerCase().indexOf(value) > -1)
// 			    });
// 			  });
	});
</script>	


	
<body>

  <%@include file="barra.jsp" %>

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

     <%@include file="menu.jsp" %>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1 class='tituloDashboard'>Dashboard <label class='nomeEvento'></label></h1> <br>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">
        
        <div class="col-lg">
         <div class="row">
         
         <div class="card">
            <div class="card-body">
              <h5 class="card-title">Filtro</h5>
              	
              	<input id="filtroPorEvento" type="text" placeholder="Filtro geral...">
<!--               	<input id="filtroPorDescricao" type="text" placeholder="Descricao evento..."> -->
            </div>
          </div>
         
         </div>
         
         <div class="row d-flex justify-content-center eventos"> 
         	<div class="spinner-border" role="status">
			  <span class="sr-only">Carregando...</span>
			</div>
         </div>
        </div>
      </div>
    </section>

  </main><!-- End #main -->

    <%@include file="footer.jsp" %>
  
  <%@include file="modal.jsp" %>
  
  <%@include file="footerscript.jsp" %>

</body>

</html>