<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="head.jsp" %>  
</head>
  
  <script>
	$(document).ready(function() {
	    $("#smallModalVotacao").modal({
	        show: false,
	        backdrop: 'static'
	    });
		
		var coordenadas = {};
		
		try {
			navigator.geolocation.getCurrentPosition(
					function(data){
						    coordenadas.timestamp=data.timestamp;
						    coordenadas.latitude=data.coords.latitude;
						    coordenadas.longitude=data.coords.longitude;
						}, function error(err) {
							  alert("Erro Geo:" + err.code + " - "+ err.message);
						}
				)	
			
		} catch(err) {
		   alert("Erro geolocation:"+JSON.stringify(err));
		   alert("Erro geolocation-MSG:"+err.message);
		 }		
		
		function reloaddd() {
		     $(".star1").click(function(){
		   	  var codpesquisa = $(this).parents('div').parents('tr').data('codpesquisa');
		   	  $(this).parents('div').parents('tr').attr('voto', '1');
		   	  $(this).parents('div').parents('tr').data('voto', '1');
			  $(".star1"+codpesquisa).addClass("checked");
			  $(".star2"+codpesquisa).removeClass("checked");
			  $(".star3"+codpesquisa).removeClass("checked");
			  $(".star4"+codpesquisa).removeClass("checked");
			  $(".star5"+codpesquisa).removeClass("checked");
			  });
		     		      
			$(".star2").click(function(){
			  var codpesquisa = $(this).parents('div').parents('tr').data('codpesquisa');
			  $(this).parents('div').parents('tr').data('voto', '2');
			  $(".star1"+codpesquisa).addClass("checked");
			  $(".star2"+codpesquisa).addClass("checked");
			  $(".star3"+codpesquisa).removeClass("checked");
			  $(".star4"+codpesquisa).removeClass("checked");
			  $(".star5"+codpesquisa).removeClass("checked");
			});
			$(".star3").click(function(){
				var codpesquisa = $(this).parents('div').parents('tr').data('codpesquisa');
				$(this).parents('div').parents('tr').data('voto', '3');
			  $(".star1"+codpesquisa).addClass("checked");
			  $(".star2"+codpesquisa).addClass("checked");
			  $(".star3"+codpesquisa).addClass("checked");
			  $(".star4"+codpesquisa).removeClass("checked");
			  $(".star5"+codpesquisa).removeClass("checked");
			});
			$(".star4").click(function(){
				var codpesquisa = $(this).parents('div').parents('tr').data('codpesquisa');
				$(this).parents('div').parents('tr').data('voto', '4');
			  $(".star1"+codpesquisa).addClass("checked");
			  $(".star2"+codpesquisa).addClass("checked");
			  $(".star3"+codpesquisa).addClass("checked");
			  $(".star4"+codpesquisa).addClass("checked");
			  $(".star5"+codpesquisa).removeClass("checked");
			});
			  $(".star5").click(function(){
			  var codpesquisa = $(this).parents('div').parents('tr').data('codpesquisa');
			  $(this).parents('div').parents('tr').data('voto', '5');
			  $(".star1"+codpesquisa).addClass("checked");
			  $(".star2"+codpesquisa).addClass("checked");
			  $(".star3"+codpesquisa).addClass("checked");
			  $(".star4"+codpesquisa).addClass("checked");
			  $(".star5"+codpesquisa).addClass("checked");
			});
		}
		
		var rating =     
      	    ' <div id="center" class="rating">'
  			+'  <span class="fa fa-star star5 star5_codpesquisa_" id="5" ></span>'
  			+'  <span class="fa fa-star star4 star4_codpesquisa_" id="4"></span>'
  			+'  <span class="fa fa-star star3 star3_codpesquisa_" id="3"></span>'
  			+'  <span class="fa fa-star star2 star2_codpesquisa_" id="2"></span>'
  			+'  <span class="fa fa-star star1 star1_codpesquisa_" id="1"></span>'
  		  	+'</div>';
          
          
       var rowPesquisaPainelVotacao =           
        '  <tr data-codpesquisa="_codpesquisa_" >' +
	    '    <td style="width: 50%" data-codpesquisa="_codpesquisa_" data-voto="" class="table table-bordered border-primary tabelaPerguntas">_pesquisa_' +
	    '    </td>' +
	    '    <td style="width: 50%">' +	rating +				        
	    '    </td>' +
	    ' </tr> ';
		
		 var hashParam = (new URL(location.href)).searchParams.get('hash');
		
		 carregarDadosVotacao();
		 function carregarDadosVotacao() {
	        
	    	$(".linhaPesquisaPainelVisualizacao").html('');
	    	if (JSON.stringify(hashParam)=="null") {
	    		$("#popupCampanhaMsgErro").html("Parametro invalido !");
            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 3000).effect("scale", { times: 1 }, 900).fadeOut('slow');
	    		
	    	} else {
	    		
				$.ajax({
		            type: "GET",
		            url: "${urlApi}/campanha/voto/painelvotacao/evento/"+hashParam,
		            headers: {
		                "ngrok-skip-browser-warning":"69420",
		                "Aurelio":"Teste"
		            },
		            success: function(data)
		            {
		            	$(".linhaPesquisa").html('');
		    			//alert(JSON.stringify(data))
		    			
		            	$.each(data, function(i, item) {
		            		
				    			$('.imagemUrl').attr('src', item.evento.imagemUrl);
				    			$(".tituloPainelVotacao").text(item.evento.nome);
			        			$(".descricaoPainelVotacao").text(item.evento.descricao);
				    			
		            			var temp = rowPesquisaPainelVotacao;
								temp = temp.replaceAll("_codpesquisa_", item.id);	
								temp = temp.replaceAll("_pesquisa_", item.pesquisa);
								
								$(".idMetadadosVoto").html(item.idMetadadosVoto);
								
			        			$(".linhaPesquisaPainelVisualizacao").append(temp);
		            	});
		    			
		    			if (data.length>0) {
			            	$('#smallModalVotacao').modal('show');
		    			} else {
		    				$("#popupCampanhaMsgErro").html("Evento nao encontrado! ");
		    				$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
		    			}
		    			
		    			reloaddd();
		    			
		            },
		            error: function(data)
		          	  {
		            	if (data.responseJSON.status == 400) {
			           	    
		            		Swal.fire({
		            			  title: "Votacao indisponivel",
		            			  text: "Obrigado pela sua atencao!",
		            			  icon: "warning"
		            			});
		            	} else {
		            		Swal.fire({
		            			  icon: "error",
		            			  title: "Falha na operacao...",
		            			  text: "Ja estamos trabalhando para corrigir!"
		            			});
			           	}		            	
			           }
			        });
			 }
		 }
		 
		 $("#formVoto" ).on("submit", function( event ) {
			 
			 try {
			    
			 	var itemSemVoto = false;
		    	votos = [];
		    	pessoa = {};
		    	dadosVotoParam = {};
		    	
		    	 $(".linhaPesquisaPainelVisualizacao").find('tr').each(function( index, element ) {
		   		     voto = {}
		    		 voto.codpesquisa = $(this).data('codpesquisa');
		    		 voto.voto = 0;
		    		 voto.voto = $(this).data('voto');
		    		 
		    		 if (voto.voto == undefined) {
		    			 itemSemVoto = true;
		    			 $(this).css("border-color", "red");
		    		 } else {
		    			 $(this).css("border-color", "");
		    		 }
		    		 
		    		 pessoa.nomePessoa = $(".nomePessoa").val();
		    		 pessoa.cidade = $(".cidade").val();
		    		 pessoa.idade = $(".idade").val();
		    		 pessoa.uf = $(".uf").val();
		    		 pessoa.sexo = $(".sexo:checked").val();
		    		 votos.push(voto);
		    	});
		    	 
		    	 dadosVotoParam.listaVoto = votos;
		    	 dadosVotoParam.pessoa = pessoa;
	    		 dadosVotoParam.coordenadas = coordenadas;
	    		 dadosVotoParam.idMetadadoVoto = $(".idMetadadosVoto").html();
	    		 dadosVotoParam.dataTela = moment().format();

	    		 //alert("Request1 "+JSON.stringify(dadosVotoParam));
	    		 
	    		 if (itemSemVoto) {
		    		event.preventDefault();
		    	} else {
		    		event.preventDefault();
			    	$.ajax({
		                type: "POST",
		                url: "${urlApi}/campanha/voto",
		                data: JSON.stringify(dadosVotoParam),
		                contentType: "application/json; charset=utf-8",
		                headers: {
			                "ngrok-skip-browser-warning":"69420",
			                "Aurelio":"Teste"
			            },
		                statusCode: {
		                    404: function() {
		                      alert( "page not found" );
		                    }
		                  },
		                beforeSend: function( xhr ) {
		                	$("#popupCarregando").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
		                },
		                success: function(data)
		                {
		                	//alert("OK "+JSON.stringify(data));
		                	$("#qtdPesquisa").html($(".linhaPesquisa tr").length);		
		                	$("#popupCampanhaSucesso").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
		                	$('#smallModalVotacao').modal('hide');
		                	
		                	
		                	let timerInterval;
		                	Swal.fire({
		                	  title: "Obrigado pelo seu voto!",
		                	  html: "Ate a proxima votacao...",
		                	  timer: 3000,
		                	  timerProgressBar: true,
		                	  didOpen: () => {
		                	    Swal.showLoading();
		                	    const timer = Swal.getPopup().querySelector("b");
		                	    timerInterval = setInterval(() => {
		                	      timer.textContent = `${Swal.getTimerLeft()}`;
		                	    }, 100);
		                	  },
		                	  willClose: () => {
		                	    clearInterval(timerInterval);
		                	  }
		                	}).then((result) => {
		                	  /* Read more about handling dismissals below */
		                	  if (result.dismiss === Swal.DismissReason.timer) {
		                	      console.log("I was closed by the timer");
		                	    }
		                	});
		                	
		                	
		                	
		                },
		                
		                error: function(jqXHR, exception)
		                {
		                	
		                	alert("Erro1"+JSON.stringify(exception))
		                	alert("Erro2"+JSON.stringify(jqXHR))
		                	$("#popupCampanhaMsgErro").html("Erro ao registrar voto! " + JSON.stringify(jqXHR));
		                    $("#popupCampanhaErro").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
		                }
		            });
		    	}
	    		 
				 }
				 catch(err) {
				   alert("ErroTry:"+JSON.stringify(err));
				   alert("ErroTry-MSG:"+err.message);
				 }
	    		 
	    		 
	    	});
    });
</script>

<body>


	

      <div class="modal fade" id="smallModalVotacao" tabindex="-1">
         <div class="modal-dialog ">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title">Votacao - <i class="bi bi-grid idMetadadosVoto"></i> </h5>
             </div>
             <div class="modal-body">
               
               <!-- Card with an image on top -->
		      <div class="card">
		        <img class="imagemUrl" src="" class="card-img-top" alt="...">
		        <div class="card-body">
		          <h5 class="card-title tituloPainelVotacao"></h5>
		          <p class="card-text descricaoPainelVotacao"></p>
		        </div>
		        
		      </div><!-- End Card with an image on top -->
		      
		      <form id="formVoto" data-metadadosvoto="" class="row g-3 needs-validation" novalidate >
                    
                        <input type="hidden" class="idMetadadosVoto" />
						<div class="col-md-9">
		                  <label for="validationCustom01" class="form-label">Nome </label>
		                 <div class="input-group col-md-4">
                   		 <span class="input-group-text codigoCampanha"></span>
		                  <input type="text" class="form-control nomePessoa" id="validationCustom01" size="50" maxlength="150"  value="" required>
		                </div>
		                </div>                    
					
		 				<div class="col-md-3">
		                  <label for="validationCustom01" class="form-label">Idade</label>
		                 <div class="input-group col-md-4">
		                  <input type="number" class="form-control idade" id="validationCustom01" value="" required maxlength="2">
		                </div>
		                </div>
		                
		                <fieldset class="row col-mb-2">
		                  <legend class="col-form-label col-sm-2 pt-0">Sexo</legend>
		                  <div class="col-mb-10">
		                    
		                    <div class="form-check">
		                      <input class="form-check-input sexo" type="radio" name="sexo" id="gridMasculino" value="M" checked="checked">
		                      <label class="form-check-label" for="gridRadios1">
		                        Masculino
		                      </label>
		                      
		                    </div>
		                    <div class="form-check">
		                      <input class="form-check-input sexo" type="radio" name="sexo" id="gridFeminino" value="F">
		                      <label class="form-check-label" for="gridRadios2">
		                        Feminino
		                      </label>
		                    </div>
		                    
		                  </div>
		                </fieldset>
					
						<div class="col-md-8">
		                  <label for="validationCustom01" class="form-label">Cidade </label>
		                  <div class="input-group col-md-4">
	                  				  <span class="input-group-text codigoCampanha"></span>
		                  <input type="text" class="form-control cidade" id="validationCustom01"  size="50" maxlength="150"  value="" required>
		                </div>	                
	                	</div>
	                
					<div class="col-md-4">
	                  	<label for="validationCustom01" class="form-label">UF</label>
	                 	 <div class="input-group col-md-4">
                  		
                  		<select class="form-select uf" id="validationCustom04" required >
						    <option value="" selected></option>
						    <option value="AC">Acre</option>
						    <option value="AL">Alagoas</option>
						    <option value="AP">Amapá</option>
						    <option value="AM">Amazonas</option>
						    <option value="BA">Bahia</option>
						    <option value="CE">Ceará</option>
						    <option value="DF">Distrito Federal</option>
						    <option value="ES">Espírito Santo</option>
						    <option value="GO">Goiás</option>
						    <option value="MA">Maranhão</option>
						    <option value="MT">Mato Grosso</option>
						    <option value="MS">Mato Grosso do Sul</option>
						    <option value="MG">Minas Gerais</option>
						    <option value="PA">Pará</option>
						    <option value="PB">Paraíba</option>
						    <option value="PR">Paraná</option>
						    <option value="PE">Pernambuco</option>
						    <option value="PI">Piauí</option>
						    <option value="RJ">Rio de Janeiro</option>
						    <option value="RN">Rio Grande do Norte</option>
						    <option value="RS">Rio Grande do Sul</option>
						    <option value="RO">Rondônia</option>
						    <option value="RR">Roraima</option>
						    <option value="SC">Santa Catarina</option>
						    <option value="SP">São Paulo</option>
						    <option value="SE">Sergipe</option>
						    <option value="TO">Tocantins</option>
						    <option value="EX">Estrangeiro</option>
						</select>
                  		
                  		
	                    </div>
	                </div>                    
             		
	                <br>
	                <br>
               		<div class="col-md-12">
					  <table class="table border-primary tabelaPerguntas" >
		                <tbody class="linhaPesquisaPainelVisualizacao">	
		                					                                   
		                </tbody>
		              </table>				
               	    </div>
               	    
	             <div class="modal-footer">
	                 <button type="submit" class="btn btn-primary" id="salvarVotar">VOTAR</button>
	             </div>
              </form>
             
             
           </div>
         </div>
       </div><!-- End Small Modal-->
       
       <!-- ======= Modal ======= -->
  <%@include file="modal.jsp" %>
  <!-- ======= Modal ======= -->

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
    <!-- Vendor JS Files -->
   <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  
  <script src="https://momentjs.com/downloads/moment.min.js"></script>
<!--  <script src="https://momentjs.com/downloads/moment-timezone-with-data.min.js"></script> -->
  
    <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
   
</body>

</html>