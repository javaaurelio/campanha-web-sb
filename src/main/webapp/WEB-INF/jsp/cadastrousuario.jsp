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
			//alert(sessionStorage.getItem('jwtLocal'));
			var configuracoes =
				'<td>'
			  	+ 'Primeiro acesso: _primeiroAcesso_<br>'
			  	+ 'Ultimo acesso: _ultimoAcesso_<br>'
			  	+ '<div class="form-check form-switch">'
				    +'<span> Ativo:</span><input class="form-check-input publicar" type="checkbox" id="flexSwitchCheckChecked__id_" _publicado_>'
			    +'</div><br>'
			  	+ '</td>' 	;
			var linhaTabela = 
	       		'<tr> '
                +' <td>_id_</td>'
                +' <td>_nome_</td>'
                +' <td>_email_</td>'
                +' <td>_cidade_</td>'
                +' <td>_dataNascimento_</td>'           
                + configuracoes          
                +'  <td class="text-center" style="width: 10%">'
    		    +'		  <i class="bi bi-pencil editarUsuario" data-id="_id_"></i>'
    		    +'        <span>   </span>'					
    		    +'        <span>   </span>'					
    		    +'        <i class="bi bi-trash deletarUsuario" data-id="_id_"></i>	'					
    		    +'   </td>'
               '  </tr>';
               
               var urlCustomizada = "http://localhost:8081/campanha/usuario";
               if (paginaAtual != null && paginaDestino != null) {
            	   urlCustomizada = "http://localhost:8081/campanha/usuario?page="+ paginaDestino; 
               }                
            
            $("#listaUsuarios").html('');
	        $.ajax({
	            type: "GET",
// 	            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam,
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
	            		temp = temp.replaceAll("_nome_", item.nome);
	            		temp = temp.replaceAll("_email_", item.email);
	            		temp = temp.replaceAll("_cidade_", item.cidade);
	            		temp = temp.replaceAll("_estado_", item.estado);
	            		temp = temp.replaceAll("_dataNascimento_", item.dataNascimentoFormatado);
	            		temp = temp.replaceAll("_id_", item.id);
	            		temp = temp.replaceAll("_primeiroAcesso_", item.dataHoraPrimeiroAcesso);
	            		temp = temp.replaceAll("_ultimoAcesso_", item.dataHoraUltimoAcesso);
	            		
		    			$("#listaUsuarios").append(temp);
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
		 
		 $(document).on("click", ".editarUsuario", function(){
	         var id = $(this).data('id');
	         
	   	     $.ajax({
	            type: "GET",
	            url: "http://localhost:8081/campanha/usuario/"+id,
	            success: function(data)
	            {
	            	$('.nome').data('id', data.id);
	        		$('.nome').val(data.nome);
	        		$('.email').val(data.email);
	        		$('.endereco').val(data.endereco);
	        		$('.cidade').val(data.cidade);
	        		$('.uf').val(data.uf);
	        		$('.cep').val(data.cep);
	        		$('.dataNascimento').val(data.dataNascimentoDDMMYYYY.split("/").reverse().join("-"));
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
		 
		 $(document).on("click", ".deletarUsuario", function(){
			
	         var id = $(this).data('id');
	         Swal.fire({
	        	  title: "Tem certeza que deseja excluir ?",
	        	  showDenyButton: true,
	        	  showCancelButton: false,
	        	  confirmButtonText: "Sim",
	        	  denyButtonText: "Não"
	        	}).then((result) => {
	        	  if (result.isConfirmed) {

	        		  $.ajax({
	      	            type: "Delete",
//	       	            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam,
	      	            url: "http://localhost:8081/campanha/usuario/"+id,
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
		 
		 
		 $(".formularioUsuario" ).on("submit", function( event ) {
	        	
	        	if (!event.target.checkValidity()) {
	        		event.preventDefault();
	        	} else {
	        		dadosCadastroUsuario = {}
	        		dadosCadastroUsuario ["nome"] = $('.nome').val();
	        		dadosCadastroUsuario ["email"] = $('.email').val();
	        		dadosCadastroUsuario ["dataNascimento"] = $('.dataNascimento').val();
	        		dadosCadastroUsuario ["endereco"] = $('.endereco').val();
	        		dadosCadastroUsuario ["cidade"] = $('.cidade').val();
	        		dadosCadastroUsuario ["uf"] = $('.uf').val();
	        		dadosCadastroUsuario ["cep"] = $('.cep').val();
// 	        		dadosCadastroUsuario ["senha"] = $('.senha').val();
	       	        var id = $('.nome').data('id');
	       	        
	       	        var method = "POST";
	       	        //var urlCustomizada = "https://64acce2b9edb4181202fd445.mockapi.io/usuario/campanha";
	       	        var urlCustomizada = "http://localhost:8081/campanha/usuario";
	       	        
	       	        if (id > 0) {
	       	        	method = "PUT";
	       	        	urlCustomizada="http://localhost:8081/campanha/usuario/"+id;
// 	       	        	urlCustomizada="${urlApi}/campanha/evento/"+id;
	       	        }
	          	     event.preventDefault();
	       	        //alert (method +  JSON.stringify(item) + urlCustomizada);
	       	        $.ajax({
	                   type: method,
	                   url: urlCustomizada,
	                   contentType: "application/json; charset=utf-8",
	                   data: JSON.stringify(dadosCadastroUsuario),
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
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Cadastro</li>
          <li class="breadcrumb-item active">Usuario</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
		  
	  <div class="card">
            <div class="card-body">
              <h5 class="card-title">Cadastro de Usuarios</h5>

              <!-- Floating Labels Form -->
              <form class="row g-3 needs-validation formularioUsuario" novalidate>
                <div class="col-md-12">
                  <div class="form-floating">
                    <input type="text" class="form-control nome" id="floatingName" placeholder="Seu Nome" required>
                    <label for="floatingName">Nome</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-floating">
                    <input type="email" class="form-control email" id="floatingEmail" placeholder="Seu Email" required>
                    <label for="floatingEmail">Email</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-floating">
                    <input type="date" class="form-control dataNascimento" id="floatingDataNascimento" required name="dataInicio">
                    <label for="floatingDataNascimento">Data Nascimento</label>
                  </div>
                </div>
                
                <div class="col-12">
                  <div class="form-floating">
                    <textarea class="form-control endereco" placeholder="Address" id="floatingTextarea" style="height: 100px;" required></textarea>
                    <label for="floatingTextarea">Endereco</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="col-md-12">
                    <div class="form-floating">
                      <input type="text" class="form-control cidade" id="floatingCity" placeholder="Cidade" required>
                      <label for="floatingCity">Cidade</label>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-floating mb-3">
                    <select class="form-select uf" id="floatingSelect" aria-label="Estado" required>
                      <option selected>New York</option>
                      <option value="1">Oregon</option>
                      <option value="2">DC</option>
                    </select>
                    <label for="floatingSelect">State</label>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="form-floating">
                    <input type="text" class="form-control cep" id="floatingZip" placeholder="Cep" required>
                    <label for="floatingZip">Cep</label>
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
                    <th scope="col">#</th>
                    <th scope="col" >Nome <i class="bi bi-funnel filtroName"></i></th>
                    <th scope="col">Email</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Data nascimeno</th>
                    <th scope="col">Configuracoes</th>
                    <th scope="col">Acoes</th>
                  </tr>
                </thead>
                <tbody id="listaUsuarios">
                                   
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