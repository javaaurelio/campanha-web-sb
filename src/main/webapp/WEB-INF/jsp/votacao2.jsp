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
						    coordenadas.timestamp=data.coords.longitude;
							
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
  			+'  <span class="fa fa-star star5 star5_codpesquisa_" id="5"></span>'
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
		
		 var idEventoParam = (new URL(location.href)).searchParams.get('idEvento');
		
		 carregarDadosVotacao();
		 function carregarDadosVotacao() {
	        
	    	$(".linhaPesquisaPainelVisualizacao").html('');
	    	
	    	
	    	if (JSON.stringify(idEventoParam)=="null") {
	    		$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
	    		
	    	} else {
	    		
				$.ajax({
		            type: "GET",
		            url: "http://localhost:8081/campanha/voto/painelvotacao/evento/"+idEventoParam,
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
		            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
		            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
			            }
			        });
			 }
		 }
		 
		 $(document).on("click", "#salvarVotar", function(){
			  
		    	votos = []
		    	 $(".linhaPesquisaPainelVisualizacao").find('tr').each(function( index, element ) {
		   		    voto = {}
		    		 voto.codpesquisa = $(this).data('codpesquisa');
		    		 voto.voto = $(this).data('voto');
		    		 voto.coordenadas = coordenadas;
		    		 votos.push(voto);
		    	});
			     
		    	$.ajax({
	                type: "POST",
	                url: "http://localhost:8081/campanha/voto",
	                data: JSON.stringify(votos),
	                contentType: "application/json; charset=utf-8",
	                success: function(data)
	                {
	                	atualizarTabelasPesquisa();
	                	$("#qtdPesquisa").html($(".linhaPesquisa tr").length);		
	                	$("#popupCampanhaSucesso").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
	                },
	                
	                error: function(data)
	                {
	                	$("#popupCampanhaMsgErro").html(JSON.stringify(data));
	                    $("#popupCampanhaErro").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
	                }
	            });
			     
			     
			     
	    	});
		
    });
</script>

<body>


	<div id="popupCampanhaErro" class="modal fade " data-bs-backdrop="static" role="dialog" 
		style="text-align: center; z-index: 100; ">
		  <div class="modal-dialog" >
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

      <div class="modal fade" id="smallModalVotacao" tabindex="-1">
         <div class="modal-dialog ">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title">Votacao</h5>
             </div>
             <div class="modal-body">
               
               <!-- Card with an image on top -->
		      <div class="card">
<!-- 		        <img src="assets/img/card.jpg" class="card-img-top" alt="..."> -->
		        <img class="imagemUrl" src="" class="card-img-top" alt="...">
		        <div class="card-body">
		          <h5 class="card-title tituloPainelVotacao"></h5>
		          <p class="card-text descricaoPainelVotacao"></p>
		        </div>
		        
		      </div><!-- End Card with an image on top -->
		      
		      <!-- Custom Styled Validation -->
		      
		      <div id="carouselExampleFade" class="carousel carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    
                    
						<div class="col-md-10">
		                  <label for="validationCustom01" class="form-label">Nome </label>
		                 <div class="input-group col-md-4">
                   				  <span class="input-group-text codigoCampanha"></span>
		                  <input type="text" class="form-control" id="validationCustom01" name="campanha" size="50" maxlength="150"  value="" required>
		                </div>
		                </div>                    
					
					
					<div class="col-md-10">
	                  <label for="validationCustom01" class="form-label">Cidade </label>
	                 <div class="input-group col-md-4">
                  				  <span class="input-group-text codigoCampanha"></span>
	                  <input type="text" class="form-control" id="validationCustom01" name="campanha" size="50" maxlength="150"  value="" required>
	                </div>
	                </div>                    
                    
	                
	                 
	                <br>
	                <br>
	                <br>
	                <br>
	                <br>
                    
                  </div>
                  <div class="carousel-item">
                    <div class="col-md-12">
					  <table class="table border-primary tabelaPerguntas" >
		                <tbody class="linhaPesquisaPainelVisualizacao">	
		                					                                   
		                </tbody>
		              </table>				
               	    </div>
                  </div>
                 
                </div>

                <button class="carousel-control-prev" type="button " data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon " style="background-color: #cccccc;" aria-hidden="true"></span>
                  <span class="visually-hidden">Anterior</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                  <span class="carousel-control-next-icon" style="background-color: #cccccc;" aria-hidden="true"></span>
                  <span class="visually-hidden">Proximo</span>
                </button>

              </div><!-- End Slides with fade transition -->
		      
               
             </div>
             <div class="modal-footer">
               <button type="button" class="btn btn-secondary" id="salvarVotar" data-bs-dismiss="modal">VOTAR</button>
             </div>
           </div>
         </div>
       </div><!-- End Small Modal-->

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   
</body>

</html>