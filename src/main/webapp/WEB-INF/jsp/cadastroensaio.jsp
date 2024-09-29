<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="head.jsp" %>  
</head>

  <script>
  
	$(document).ready(function(){
		
		
// 		##########################################
// 		############Carregamento Principal #######
// 		##########################################
		 carregarDadosUsuario(null, null);
		 function carregarDadosUsuario(paginaAtual, paginaDestino) {
			var linhaTabela = 
	       		'<tr> '
                +' <td>_id_</td>'
                +' <td>_ensaio_</td>'
                +' <td>_cor_</td>'
                +'  <td class="text-center" style="width: 10%">'
    		    +'		  <i class="bi bi-pencil editarEnsaio" data-id="_id_"></i>'
    		    +'        <span>   </span>'					
    		    +'        <span>   </span>'					
    		    +'        <i class="bi bi-trash deletarEnsaio" data-id="_id_"></i>	'					
    		    +'   </td>'
               '  </tr>';
               
               var urlCustomizada = "#(host_api)/campanha/ensaio";
               if (paginaAtual != null && paginaDestino != null) {
            	   urlCustomizada = "#(host_api)/campanha/ensaio?page="+ paginaDestino; 
               }                
            
            $("#listaEnsaio").html('');
            $('.ensaio').val("");
            $('.ensaio').data('id', "");
            $('.cor').val("");
	        $.ajax({
	            type: "GET",
	            url: urlCustomizada,
	            success: function(data)
	            {
	            	
	            	(data.first ? $(".primeiro").off("click") : $(".primeiro").on("click"));
	            	(data.first ? $(".anterior").off("click") : $(".anterior").on("click"));
	            	$(".primeiro").prop( "disabled", data.first );
	            	$(".anterior").prop( "disabled", data.first );
	            	
	            	$(".primeiro").data('paginadestino', 0);
	            	$(".proximo").data('paginadestino', data.number+1);
	            	$(".anterior").data('paginadestino', data.number-1);
	            	$(".ultimo").data('paginadestino', data.totalPages-1);
	            	
	            	(data.last ? $(".proximo").off("click") : $(".proximo").on("click"));
	            	(data.last ? $(".ultimo").off("click") : $(".ultimo").on("click"));

	            	$(".proximo").prop( "disabled", data.last );
	            	$(".ultimo").prop( "disabled", data.last );
	            	

	            	$(".paginaAtual").html(data.number+1);
	            	$(".paginasTotal").html(data.totalPages);
	            	
	            	$.each(data.content, function(i, item) {
	            		var temp = linhaTabela;
	            		temp = temp.replaceAll("_ensaio_", item.nome);
	            		temp = temp.replaceAll("_cor_", item.cor);
	            		temp = temp.replaceAll("_id_", item.id);
		    			$("#listaEnsaio").append(temp);
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
		 
		 $(document).on("click", ".editarEnsaio", function(){
	         var id = $(this).data('id');
	         
	   	     $.ajax({
	            type: "GET",
	            url: "#(host_api)/campanha/ensaio/"+id,
	            success: function(data)
	            {
	            	$('.cor').val(data.cor);
	            	$('.ensaio').val(data.nome);
	            	$('.ensaio').data('id', data.id);
	            },
	            error: function(data)
	            {
	            	
	            }
	        });
			 
		 });
		 
		 $(document).on("click", ".filtroName", function(event) {
			 
			 if($(this).children().length>0){
				 $(this).html('');
			 } else {
				 if ( $(this)) {
			         $(this).html('<input type="text">');
				 }	 
			 }
			 
			 
			 
		 });
		 
		 $(document).on("click", ".deletarEnsaio", function(){
			
	         var id = $(this).data('id');
	         Swal.fire({
	        	  title: "Tem certeza que deseja excluir ?",
	        	  showDenyButton: true,
	        	  showCancelButton: false,
	        	  confirmButtonText: "Sim",
	        	  denyButtonText: "Nao"
	        	}).then((result) => {
	        	  if (result.isConfirmed) {

	        		  $.ajax({
	      	            type: "Delete",
	      	            url: "#(host_api)/campanha/ensaio/"+id,
	      	            success: function(data)
	      	            {
		                      Swal.fire({
			    	    		  title: "Excluir",
			    	    		  text: "Excluido com sucesso!",
			    	    		  icon: "success",
			    	    		  timer: 700,
			    				  timerProgressBar: true,
			    	    		});
	      	            	carregarDadosUsuario();
	      	            },
	      	            error: function(data)
	      	            {
	      	            	Swal.fire("Falha ao excluir!", "", "error");
	      	            }
	      	        });
	        		  
	        		  
	        		  
	        	      
	        	  } else if (result.isDenied) {
	        		  Swal.fire("Operacao cancelada", "", "info");
	        	  }
	        	});
			 
		 });
		 
		 
		 $(document).on("click", ".page-item", function(){
			 var paginaDestino = $(this).data('paginadestino');
         	 var paginalAtual = $(".paginaAtual").html();
			 
			 if (paginaDestino < 0) {
				 paginaDestino = 1
			 }         
			 carregarDadosUsuario(paginalAtual, paginaDestino);
        });
		 
		 
		 $(".formularioEnsaio" ).on("submit", function( event ) {
	        	
	        	if (!event.target.checkValidity()) {
	        		event.preventDefault();
	        	} else {
	        		dadosCadastroEnsaio = {}
	        		dadosCadastroEnsaio["nome"] = $('.ensaio').val();
	        		dadosCadastroEnsaio["cor"] = $('.cor').val();
	       	        var id = $('.ensaio').data('id');
	       	        var method = "POST";
	       	        var urlCustomizada = "#(host_api)/campanha/ensaio";
	       	        if (id > 0) {
	       	        	method = "PUT";
	       	        	urlCustomizada="#(host_api)/campanha/ensaio/"+id;
	       	        }
	       	        
	          	    event.preventDefault();
	       	        $.ajax({
	                   type: method,
	                   url: urlCustomizada,
	                   contentType: "application/json; charset=utf-8",
	                   data: JSON.stringify(dadosCadastroEnsaio),
	                   success: function(data)
	                   {
	                      // $("#popupCampanhaMsgSucesso").html("Sucesso");
	                      Swal.fire({
		    	    		  title: "Realizado",
		    	    		  text: "Cadastro efetivada",
		    	    		  icon: "success",
		    	    		  timer: 1000,
		    				  timerProgressBar: true,
		    	    		});
	                      carregarDadosUsuario();
	                      
	                      $(".formularioUsuario" ).removeClass("was-validated");
	                      $(".formularioUsuario").find(".btn-secondary").trigger('click');
	                   },
	                   
	                   error: function(data)
	                   {
	                   	//console.log(JSON.stringify(data))
	                   	$("#popupCampanhaMsgErro").html(JSON.stringify(data));
	                   	$("#popupCampanhaErro").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
	                   
	                   }
	               });
	       	     
	        	}
	        	
	        });
		
        
	});
</script>

<body>
 
  <%@include file="barra.jsp" %>

  <!-- Sidebar -->
  <aside id="sidebar" class="sidebar">
        <%@include file="menu.jsp" %>
  </aside>
  <!-- End Sidebar-->

  <main id="main" class="main">
  
	  <div class="pagetitle">
      <h1>Cadastro</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
          <li class="breadcrumb-item">Cadastro</li>
          <li class="breadcrumb-item active">Ensaio</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
		  
	  <div class="card">
            <div class="card-body">
              <h5 class="card-title">Cadastro de Ensaio</h5>

              <!-- Floating Labels Form -->
              <form class="row g-3 needs-validation formularioEnsaio" novalidate>
                <div class="col-md-12">
                  <div class="form-floating">
                    <input type="text" class="form-control ensaio" id="floatingName" placeholder="Nome do Ensaio" required>
                    <label for="floatingName">Ensaio</label>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-floating">
                    <input type="text" class="form-control cor" id="floatingName" placeholder="Cor" required>
                    <label for="floatingName">Cor</label>
                  </div>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">Salvar</button>
                  <button type="reset" class="btn btn-secondary limparFormularioUsuario">Limpar</button>
                </div>
              </form><!-- End floating Labels Form -->

            </div>
          </div>
          
           <div class="card">
            <div class="card-body">
              <h5 class="card-title"></h5>
              <p></p>

              <table class="table table-bordered border-primary">
                <thead>
                  <tr>
                    <th scope="col" width="10">#</th>
                    <th scope="col" >Ensaio <i class="bi bi-funnel filtroName"></i></th>
                    <th scope="col">Cor</th>
                    <th scope="col">Acoes</th>
                  </tr>
                </thead>
                <tbody id="listaEnsaio">
                                   
                </tbody>
              </table>
               <nav aria-label="Page navigation example">
				  <ul class="pagination  justify-content-center">
				    <li class="page-item primeiro" data-destino="primeiro"><a class="page-link primeiro" href="#" >Primeiro</a></li>
				    <li class="page-item anterior" data-paginadestino="anterior"><a class="page-link anterior" href="#">Anterior</a></li>
				    <li class="page-item"><a class="page-link" href="#"><span class="paginaAtual"></span> / <span class="paginasTotal"></span> </a></li>
				    <li class="page-item proximo" data-paginadestino="proximo"><a class="page-link" href="#" >Proximo</a></li>
				    <li class="page-item ultimo" data-paginadestino="ultima"><a class="page-link" href="#">Ultimo</a></li>
				  </ul>
				</nav>
              <!-- End Table with stripped rows -->

            </div>
          </div>
  
  <%@include file="footer.jsp" %>
  
  <%@include file="modal.jsp" %>
  
  <%@include file="footerscript.jsp" %>
  
</body>

</html>