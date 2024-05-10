<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

   <title>Dashboard - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  
  
  <!-- rating -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"/>

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   
    <style>
  
  .modal-backdrop {
	width: 200vw;
	height: 200vw;
  }
  
    body { 
    zoom: 65%; 
	} 
	
	.#center {
	  text-align: center;
	}
	.fa-star {
	  font-size: 20px;
	  cursor: pointer;
	}
	.checked {
	  color: green;
	}
	
	.rating span:hover, .rating span:hover ~ span {
	    color: green;
	    font-size: 25px;
	}
	
	.rating {
	    float: left;
	}
	.rating span {
	    font-size: 25px;
	    cursor: pointer;
	    float: right;
	}
  
</style>
   
</head>
  
  <script>
	$(document).ready(function() {
		
		var coordenadas = {};
		navigator.geolocation.getCurrentPosition(
					function(data){
						    coordenadas.timestamp=data.timestamp;
						    coordenadas.latitude=data.coords.latitude;
						    coordenadas.longitude=data.coords.longitude;
							
						}
					)
		
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
								
								$(".idMetadadosVoto").val(item.idMetadadosVoto);
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
			           	    $("#popupCampanhaMsgAlerta").html(data.responseJSON.message);
			            	$("#popupCampanhaAlerta").fadeIn('slow').animate({opacity: 1.0}, 3000).effect("scale", { times: 1 }, 900).fadeOut('slow');
			                
		            	} else {
		            		$("#popupCampanhaMsgErro").html("Falha na operacao");
			                $("#popupCampanhaErro").fadeIn('fade').animate({opacity: 2.0}, 3500).effect("fade", { times: 1}, 10).fadeOut('fade');
			           	}		            	
			           }
			        });
			 }
		 }
		 
		 $("#formVoto" ).on("submit", function( event ) {
			    
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
	    		 dadosVotoParam.idMetadadoVoto = $(".idMetadadosVoto").val();
	    		 dadosVotoParam.dataTela = moment().format();

	    		
	    		 
	    		 if (itemSemVoto) {
		    		event.preventDefault();
		    	} else {
		    		
			    	$.ajax({
		                type: "POST",
		                url: "${urlApi}/campanha/voto",
		                data: JSON.stringify(dadosVotoParam),
		                contentType: "application/json; charset=utf-8",
		                success: function(data)
		                {
		                	//alert("OK "+JSON.stringify(data));
		                	$("#qtdPesquisa").html($(".linhaPesquisa tr").length);		
		                	$("#popupCampanhaSucesso").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
		                },
		                
		                error: function(data)
		                {
		                	//alert(JSON.stringify(data))
		                	$("#popupCampanhaMsgErro").html("Erro ao registrar voto! " + JSON.stringify(data));
		                    $("#popupCampanhaErro").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
		                }
		            });
		    	}
	    	});
    });
</script>

<body>


	<div id="popupCampanhaSucesso" class="modal modalBackground" data-bs-backdrop="static" role="dialog">
	  <div class="modal-dialog modal-dialog-centered" >
	    <!-- Modal content-->
	    <div class="modal-content" style="border-style: hidden; background-color: transparent;">
	      <div class="modal-body">
	      	  <div class="alert alert-success" role="alert">
                <i class="bi bi-check-circle me-1"></i>
                <span id="popupCampanhaMsgSucesso">Sucesso</span>
              </div>
	      </div>      
	    </div>
	  </div>
	</div>
	
	<div id="popupCampanhaErro" class="modal fade " data-bs-backdrop="static" role="dialog" 
		style="text-align: center; z-index: 100; ">
	  <div class="modal-dialog modal-dialog-centered" >
	    <!-- Modal content-->
	    <div class="modal-content" style="border-style: hidden; background-color: transparent;">
	      <div class="modal-body">
	      	  <div class="alert alert-danger alert-dismissible fade show" role="alert">
	               <i class="bi bi-exclamation-octagon me-1"></i>
	               <span id="popupCampanhaMsgErro">Erro</span>
	             </div>
	      </div>      
	    </div>
	  </div>
	</div>
	
	<div id="popupCampanhaAlerta" class="modal modalBackground" data-bs-backdrop="static" role="dialog">
	  <div class="modal-dialog modal-dialog-centered" >
	    <!-- Modal content-->
	    <div class="modal-content" style="border-style: hidden; background-color: transparent;">
	      <div class="modal-body">
	      	  <div class="alert alert-warning" role="alert">
                <i class="bi bi-check-circle me-1"></i>
                <span id="popupCampanhaMsgAlerta">Sucesso</span>
              </div>
	      </div>      
	    </div>
	  </div>
	</div>

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