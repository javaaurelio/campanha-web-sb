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
  

<script>
	$(document).ready(function(){

// 		##########################################
// 		############Carregamento Principal ####### style="background: #eeeeee"
// 		##########################################
		 carregarDadosDashboard();
		 function carregarDadosDashboard() {
			$(".filtroPainelTotal").text('Total Geral');
	       	$(".aumentoVotosEvento").html('');
	       	
	        var novoEventoDiv = 
	        	'<div class="col-xxl-4 col-md-6 widgetNovoEvento" data-id="_idEvento_">'+
				'<div class="card info-card" style="background: linear-gradient(#ffffff, #eeeeee, #e8e8e8)">'+
				'	          <div class="card-body">'+
				'               <h5 class="card-title"><span></span> </h5>'+
				'	            <div class="d-flex justify-content-center">'+
				'                 <div class="justify-content-center ">'+
				'                 <h2><p class="text-black-50"><i class="bi bi-plus-circle fa-2x" aria-hidden="true"></i></p></h2>'+
				'                 </div>'+
				'              	  <div>'+
				'                  '+
				'                  <span class="text-success small pt-1 fw-bold"> </span> <span class="text-muted small pt-2 ps-1"></span>'+
				'                 </div>'+
				'              </div>'+
				'            </div>'+
				'	</div>'+
				'   </div>';
					
	        var eventoDiv = 
					'<div class="col-xxl-4 col-md-6 widgetEvento" data-id="_idEvento_">'+
					'<div class="card info-card naopublicado-card revenue-card" style="_estiloStatus_" >'+
					'	          <div class="card-body">'+
					'               <h5 class="card-title">_eventoNome_<span>| _vidaUtil_%</span> </h5>'+
					'	                <div class="d-flex align-items-center">'+
					'                 <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">'+
					'                  <i class="bi bi-people"></i> '+
					'               </div>'+
					'              <div class="ps-3">'+
					'               <h6 class="qtdVotosEvento">_qtdVotosEvento_</h6>'+
					'              <span class="text-success small pt-1 fw-bold">_mediaVotacao_ / 5 </span> <span class="text-muted small pt-2 ps-1">aceitacao</span>'+
					'           </div>'+
					'        </div>'+
					'     </div>'+
					'	</div>'+
					'   </div>';

					
					$.ajax({
	            type: "GET",
	            url: "${urlApi}/campanha/dashboardevento/geral",
	            success: function(data)
	            {
// 	            	alert(JSON.stringify(data))


					$(".eventos").append( novoEventoDiv );


	            	
	            	$.each(data.listaDadosEvento, function(i, item) {	            		

	            		var temp = eventoDiv;
	            		temp = temp.replaceAll("_idEvento_", item.idEvento);
	            		temp = temp.replaceAll("_eventoNome_", item.nomeEvento);
	            		temp = temp.replaceAll("_dataInicio_", item.dataInicio);
	            		temp = temp.replaceAll("_dataFim_", item.dataFim);
	            		temp = temp.replaceAll("_vidaUtil_", item.vidaUtil);
	            		temp = temp.replaceAll("publicado", item.publicado);
	            		temp = temp.replaceAll("_mediaVotacao_", item.mediaVotos);
	            		temp = temp.replaceAll("_qtdVotosEvento_", item.qtdVotos);
	            		//temp = temp.replaceAll("_estiloStatus_", "background: linear-gradient(#d2ffdf, #e8fff1)");
	            		//temp = temp.replaceAll("_estiloStatus_", "background: linear-gradient(#ffffff, #fdfdfd, #ebffe1)");
	            		temp = temp.replaceAll("_estiloStatus_", "background: linear-gradient(#ffffff, #b8d8d8)");
	            		// temp = temp.replaceAll("_estiloStatus_", "background: linear-gradient(#ffffff, #eeeeee, #e8e8e8)"); nao publicado
	            		
		       			$(".eventos").append( temp );
	            	});	            	
	            },
	            
	            error: function(data)
	            {
	            	console.log(JSON.stringify(data))
	            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
	            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
	            
	            }
	        });
		 }
		 
		 
		 $(document).on("click", ".widgetEvento", function(){
	    	var idEvento = $(this).data('id');
	    	window.location.href = 'http://localhost:8080/dashboardevento?idEvento='+idEvento;
	     });
		 
		 $(document).on("click", ".widgetNovoEvento", function(){
			alert('Abrir')		 
		 });
		 
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
      <h1 class='tituloDashboard'>Dashboard   <label class='nomeEvento'></label></h1> <br>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row eventos">
           
          </div>

            <!-- Revenue Card -->
            
            <!-- End Revenue Card -->

            <!-- Customers Card -->
            
            <!-- End Customers Card -->

        <!-- Right side columns -->
        <div class="col-lg-4">


        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->

    <%@include file="footer.jsp" %>
  
  <%@include file="modal.jsp" %>
  
  <%@include file="footerscript.jsp" %>

</body>

</html>