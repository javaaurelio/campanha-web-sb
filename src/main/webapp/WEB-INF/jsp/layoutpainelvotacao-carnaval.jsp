<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="head.jsp" %>  
</head>
  
  <script>
	$(document).ready(function() {
// 	    $("#smallModalVotacao").modal({
// 	        show: false,
// 	        backdrop: 'static'
// 	    });
		
		var coordenadas = {};
		var localizacaoApi = {};
		
// 		try {
// 			navigator.geolocation.getCurrentPosition(
// 					function(data){
// 						    coordenadas.timestamp=data.timestamp;
// 						    coordenadas.latitude=data.coords.latitude;
// 						    coordenadas.longitude=data.coords.longitude;
						    
// 						}, function error(err) {
// 							  alert("Erro Geo:" + err.code + " - "+ err.message);
// 						}
// 				)	
			
// 		} catch(err) {
// 		   alert("Erro geolocation:"+JSON.stringify(err));
// 		   alert("Erro geolocation-MSG:"+err.message);
// 		 }		
				
// 		try {
// 		$.get("https://ipinfo.io", function(response) {
// 			localizacaoApi.cidade = response.city;
// 			localizacaoApi.pais = response.country;
// 		}, "");
		
// 		} catch(err) {
// 			   alert("Erro geolocation:"+JSON.stringify(err));
// 			   alert("Erro geolocation-MSG:"+err.message);
// 		}
		
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
	    
	    
       var rowTemplateEnsaio =           
    	'   <li class="list-group-item"> ' +
	    '   <a class="" href="#carouselExampleControls" data-slide="next"> ' +
// 	    '     <button style= "background-color: #d9fcf2" type="button" class="list-group-item list-group-item-action rounded-pill" data-codensaio="_codEnsaio_" data-evento="_nomeEnsaio_"> _nomeEnsaio_ <i class="bi bi-arrow-right-circle"></i></button>' +
	    '     <button style= "background-color: _cor_" type="button" class="list-group-item list-group-item-action rounded-pill" data-codensaio="_codEnsaio_" data-evento="_nomeEnsaio_"> _nomeEnsaio_ <i class="bi bi-arrow-right-circle"></i></button>' +
	    '   </a>' +
	    ' </li> ';
		
		 carregarDadosVotacao();
		 
		 function carregarDadosVotacao() {
	        
	    	$(".linhaPesquisaPainelVisualizacao").html('');
				$.ajax({
		            type: "GET",
		            url: "#(host_api)/campanha/voto/painelvotacao/tela/1",
		            contentType: "application/json; charset=utf-8",
	                dataType: 'json',
		            success: function(data)
		            {
		            	$(".linhaPesquisa").html('');
		            	
		            	$.each(data.estados, function(i, item) {	            		
		            	    $('.estadosComEvento').append($('<option>',
								     {
								        value: item,
								        text : item
							    }));
		            	});	
		            	
		            	var rowTemplateEnsaioTemp = rowTemplateEnsaio;
		            	
		            	$.each(data.listaCadastroEnsaios, function(i, item) {	            		
		            		rowTemplateEnsaioTemp = rowTemplateEnsaio.replaceAll('_nomeEnsaio_', item.nome );
		            		rowTemplateEnsaioTemp = rowTemplateEnsaioTemp.replaceAll('_codEnsaio_', item.id );
		            		rowTemplateEnsaioTemp = rowTemplateEnsaioTemp.replaceAll('_cor_', item.cor );
			            	$(".listaEnsaios").append(rowTemplateEnsaioTemp);
		            	});
		            	
		            	$('.agremiacaoOpcoes').empty();
		            	$.each(data.listaAgremiacao, function(i, item) {	            		
		            		
		            		$('.agremiacaoOpcoes').append($('<option>',
								     {
								        value: item.id,
								        text : item.agremiacao
							    }));
		            		
			            	
		            		
		            	});
		            	
		            	$('.listaDataApresentacao').empty();
		            	$.each(data.listaDataApresentacao, function(i, item) {	            		
		            		
		            		$('.listaDataApresentacao').append($('<option>',
								{
								        value: item,
								        text : item
							    }));
		            		
		            	});
		            	
		    			if (data.estados.length>0) {
			            	//$('#smallModalVotacao').modal('show');
		    			} else {
// 		    				$("#popupCampanhaMsgErro").html("Evento nao encontrado! ");
// 		    				$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
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
		                url: "#(host_api)/campanha/voto",
		                data: JSON.stringify(dadosVotoParam),
		                contentType: "application/json; charset=utf-8",
		                dataType: 'json' ,
		                success: function(data)
		                {
		                	//alert("OK "+JSON.stringify(data));
		                	
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
		                	      timer.textContent = '0';
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
		                	Swal.fire({
			            		  title:data.responseJSON.message,
			            		  text: "Falha na operacao",
			            		  icon: "error"
			            	});
		                	
		                	//alert("Erro1"+JSON.stringify(exception))
		                	//alert("Erro2"+JSON.stringify(jqXHR))
		                }
		            });
		    	}
	    		 
				 }
				 catch(err) {
				  // alert("ErroTry:"+JSON.stringify(err));
				   //alert("ErroTry-MSG:"+err.message);
				 }
	    	});
		 
		 
		 // vai para Selecionar Agremiacao
		 $(".listaEnsaios" ).on("click", 'button' ,function( event ) {
			
			$(".btVoltarCarousel").show();
			$(".btVoltarCarousel").data('tela','selecionaragremiacao');
			$(".btVoltarCarousel").prop('title', 'Principal');
			 
			var texto = $(this).data('evento');
			$(".ensaioEvento").html(texto);
			
			
			var estado = $('.estadosComEvento').find(":selected").text();
			$('.estadosComEvento').hide();
			$(".estadoEvento").html(estado);
			
			var codensaio = $(this).data('codensaio');
			$(".ensaioEvento").data('codensaio', codensaio);
			
			$.ajax({
	            type: "GET",
	            url: "#(host_api)/campanha/voto/painelvotacao/tela/2/"+estado + "/" + codensaio,
	            contentType: "application/json; charset=utf-8",
                dataType: 'json',
	            success: function(data)
	            {
// 	            	$(".linhaPesquisa").html('');
	            	
// 	            	$.each(data.estados, function(i, item) {	            		
// 	            	    $('.estadosComEvento').append($('<option>',
// 							     {
// 							        value: item,
// 							        text : item
// 						    }));
// 	            	});	
	            	
// 	            	var rowTemplateEnsaioTemp = rowTemplateEnsaio;
	            	
// 	            	$.each(data.listaCadastroEnsaios, function(i, item) {	            		
// 	            		rowTemplateEnsaioTemp = rowTemplateEnsaio.replaceAll('_nomeEnsaio_', item.nome );
// 		            	$(".listaEnsaios").append(rowTemplateEnsaioTemp);
	            		
// 	            	});

	            	$('.agremiacaoOpcoes').empty();
	            	$('.listaDataApresentacao').empty();
	            	
	            	$('.agremiacaoOpcoes').prop("disabled", false);
	            	$('.listaDataApresentacao').prop("disabled", false);
	            	
	            	if (data.listaAgremiacao.length < 1 & data.listaDataApresentacao.length < 1) {
	            		
		            	$('.agremiacaoOpcoes').prop("disabled", true);
		            	$('.listaDataApresentacao').prop("disabled", true);

	            	} else {
		            	$.each(data.listaAgremiacao, function(i, item) {	            		
		            		
		            		$('.agremiacaoOpcoes').append($('<option>',
								     {
								        value: item.id,
								        text : item.agremiacao
							    }));
		            	});
		            	
		            	$.each(data.listaDataApresentacao, function(i, item) {	            		
		            		
		            		$('.listaDataApresentacao').append($('<option>',
								{
								        value: item,
								        text : item
							    }));
		            	});
	            		
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
			
			
			
		 });

		 
		//vair para visualizaragremiacao
		 $(".btConfirmarSelecao" ).on("click",function( event ) {
			 
			var textoData = $(".dataDesfile").val();
			$(".dataEnsaioEvento").html(textoData);
			
			var agremiacao = $('.agremiacaoOpcoes').find(":selected").text();
			$('.nomeAgremiacao').html(agremiacao);
			$('.descricaoAgremiacao').html(agremiacao + "   " + agremiacao);
			
			
			$(".btVoltarCarousel").show();
			$(".btVoltarCarousel").data('tela','visualizaragremiacao');
			$(".btVoltarCarousel").prop('title', 'Selecionar Agremiacao');
			
			var id = $('.agremiacaoOpcoes').val();
			
			if (agremiacao == "") {
								
			} else {
				
				$.ajax({
	                type: "GET",
	                url: "#(host_api)/campanha/voto/painelvotacao/agremiacao/"+id,
	                contentType: "application/json; charset=utf-8",
	                dataType: 'json' ,
	                success: function(data)
	                {
	                	$('.nomeAgremiacao').html(data.agremiacao);
	                	$('.descricaoAgremiacao').html(data.agremiacaoDescricao);
	                	$('.bandeiraAgremiacao').attr("src", data.bandeiraBase64Imagem);

	                	$('#carouselExampleControls').carousel('next');
	                },
	                error: function(jqXHR, exception)
	                {
	                	Swal.fire({
		            		  title:data.responseJSON.message,
		            		  text: "Falha na operacao",
		            		  icon: "error"
		            	});
	                }
	            });
				
			}

			
		 });
		 
		 //vai para Votar
		 $(".btIrParaVoto" ).on("click",function( event ) {
			 
			$(".btVoltarCarousel").show();
			$(".btVoltarCarousel").data('tela','voto');
			$(".btVoltarCarousel").prop('title', 'Visualizar Agremiacao');
			
			carregarPerguntasVotacao();
		 
		 });
		 
		 
		 function carregarPerguntasVotacao() {
			 
			 $(".linhaPesquisaPainelVisualizacao").html('');
// 		    		/campanha/voto/painelvotacao/tela/3/AL/2/5/2024-09-10
		    		
		    		
// 		    		var estado = "AL";
// 		    		var tipoEnsaio = "2";
// 		    		var idAgremiacao = "5";
// 		    		var dataApresentacao = "2024-09-10";

					var estado = $('.estadosComEvento').find(":selected").text();
					var tipoEnsaio = $('.ensaioEvento').data('codensaio');
					var idAgremiacao = $('.agremiacaoOpcoes').find(":selected").val(); 
					var dataApresentacao = $('.listaDataApresentacao').find(":selected").val(); 

					$.ajax({
			            type: "GET",
			            url: "#(host_api)/campanha/voto/painelvotacao/tela/3/"+ estado +"/" + tipoEnsaio+"/"+ idAgremiacao + "/" + dataApresentacao,
			            success: function(data)
			            {
			            	$(".linhaPesquisa").html('');
			            	$.each(data.listaPerguntas, function(i, item) {
			            			var temp = rowPesquisaPainelVotacao;
									temp = temp.replaceAll("_codpesquisa_", item.id);	
									temp = temp.replaceAll("_pesquisa_", item.pergunta);
									
									$(".idMetadadosVoto").html(item.idMetadadosVoto);
				        			$(".linhaPesquisaPainelVisualizacao").append(temp);
			            	});
			            	
			            	$('.bandeiraAgremiacao').attr('src', data.bandeiraBase64Imagem);
			    			$(".tituloPainelVotacao").text(data.agremiacao);
		        			$(".descricaoPainelVotacao").text(data.agremiacaoDescricao);
			    			reloaddd();
			            },
			            error: function(data)
			          	  {
			            	
			            	Swal.fire({
		            			  title: "Votacao indisponivel",
		            			  text: "Obrigado pela sua atencao!",
		            			  icon: "warning"
		            			});
			            	
// 			            	if (data.responseJSON.status == 400) {
				           	    
// 			            		Swal.fire({
// 			            			  title: "Votacao indisponivel",
// 			            			  text: "Obrigado pela sua atencao!",
// 			            			  icon: "warning"
// 			            			});
// 			            	} else {
// 			            		Swal.fire({
// 			            			  icon: "error",
// 			            			  title: "Falha na operacao...",
// 			            			  text: "Ja estamos trabalhando para corrigir!"
// 			            			});
// 				           	}		            	
				           }
				        });
		 }
		 
		 
		 $(".btVoltarCarousel").hide();
		 $(".btVoltarCarousel").on("click",function( event ) {
			 
// 			 principal
// 			 selecionaragremiacao
// 			 visualizaragremiacao
// 			 voto
			 
			 var telaAtual = $(this).data('tela');
			 if (telaAtual == 'selecionaragremiacao') {
				 $(".btVoltarCarousel").hide();
			     $(".btVoltarCarousel").data('tela','principal');
		         $(".ensaioEvento").html("");
				 $('.estadosComEvento').show();
				 $('.estadoEvento').html(""); 
			 } else
			 
			 if (telaAtual == 'visualizaragremiacao') {
			     $(".btVoltarCarousel").data('tela','selecionaragremiacao');
			     $(".btVoltarCarousel").prop('title', 'Principal');
			     $(".dataEnsaioEvento").html('');
			 } else
			 
			 if (telaAtual == 'voto') {
			     $(".btVoltarCarousel").data('tela','visualizaragremiacao');
			     $(".btVoltarCarousel").prop('title', 'Selecionar Agremiacao');
			 }
			 
		 });
		 
		 
		 $("#formVotoCarnaval" ).on("submit", function( event ) {
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
		    		 
// 		    		 pessoa.nomePessoa = $(".nomePessoa").val();
// 		    		 pessoa.cidade = $(".cidade").val();
// 		    		 pessoa.idade = $(".idade").val();
// 		    		 pessoa.uf = $(".uf").val();
// 		    		 pessoa.sexo = $(".sexo:checked").val();
		    		 votos.push(voto);
		    	});
		    	 
		    	 dadosVotoParam.listaVoto = votos;
// 		    	 dadosVotoParam.pessoa = pessoa;
	    		 dadosVotoParam.coordenadas = coordenadas;
	    		 dadosVotoParam.idMetadadoVoto = $(".idMetadadosVoto").html();
	    		 dadosVotoParam.dataTela = moment().format();
	    		 
	    		 if (itemSemVoto) {
		    		event.preventDefault();
		    	} else {
		    		event.preventDefault();
			    	$.ajax({
		                type: "POST",
		                url: "#(host_api)/campanha/voto/painelvotacao/carnaval",
		                data: JSON.stringify(dadosVotoParam),
		                contentType: "application/json; charset=utf-8",
		                dataType: 'json' ,
		                success: function(data)
		                {
		                	$('#carouselExampleControls').carousel('next');
		                	
		                	$(".btVoltarCarousel").hide();
		                	
		        			$(".ensaioEvento").html("");
		        			$(".estadoEvento").html("");
		                	
		                	
// 		                	let timerInterval;
// 		                	Swal.fire({
// 		                	  title: "Obrigado pelo seu voto!",
// 		                	  html: "Ate a proxima votacao...",
// 		                	  timer: 3000,
// 		                	  timerProgressBar: true,
// 		                	  didOpen: () => {
// 		                	    Swal.showLoading();
// 		                	    const timer = Swal.getPopup().querySelector("b");
// 		                	    timerInterval = setInterval(() => {
// 		                	      timer.textContent = '0';
// 		                	    }, 100);
// 		                	  },
// 		                	  willClose: () => {
// 		                	    clearInterval(timerInterval);
// 		                	  }
// 		                	}).then((result) => {
// 		                	  /* Read more about handling dismissals below */
//  		                	    if (result.dismiss === Swal.DismissReason.timer) {
// 		                	      console.log("I was closed by the timer");
// 	                	    	  $('#carouselExampleControls').carousel('next');		                	    	
// 		                	    }
// 		                	});
		                },
		                
		                error: function(jqXHR, exception)
		                {
		                	Swal.fire({
			            		  title:data.responseJSON.message,
			            		  text: "Falha na operacao",
			            		  icon: "error"
			            	});
		                	
		                	//alert("Erro1"+JSON.stringify(exception))
		                	//alert("Erro2"+JSON.stringify(jqXHR))
		                }
		            });
		    	}
	    		 
				 }
				 catch(err) {
				  // alert("ErroTry:"+JSON.stringify(err));
				   //alert("ErroTry-MSG:"+err.message);
				 }
	    	});
		 
		 
// 		 $(document).on("click", "#salvarVotarCarnaval", function(){
// 			 alert("OK")
// 		    	votos = []
// 		    	 $(".linhaPesquisaPainelVisualizacao").find('tr').each(function( index, element ) {
// 		   		     voto = {}
// 		    		 voto.codpesquisa = $(this).data('codpesquisa');
// 		    		 voto.voto = $(this).data('voto');
// 		    		 votos.push(voto);
// 		    	});
// 			     //alert(JSON.stringify(votos));
			     
// 		    	$.ajax({
// 	                type: "POST",
// 	                url: "#(host_api)/campanha/voto/carnaval",
// 	                data: JSON.stringify(votos),
// 	                contentType: "application/json; charset=utf-8",
// 	                success: function(data)
// 	                {
// // 	                	atualizarTabelasPesquisa();
// alert("OK")
// 	                	$("#qtdPesquisa").html($(".linhaPesquisa tr").length);		
// 	                	$("#popupCampanhaSucesso").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
// 	                },
	                
// 	                error: function(data)
// 	                {
// 	                	$("#popupCampanhaMsgErro").html(JSON.stringify(data));
// 	                    $("#popupCampanhaErro").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
// 	                }
// 	            });
// 	    	});
		 
    });
</script>

<body>

      <div class="_modal _fade" id="smallModalVotacao" tabindex="-1">
         <div class="modal-dialog ">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title"><i class="idMetadadosVoto"></i> </h5>
<!--                <h5 class="modal-title">Painel Votacao<i class="idMetadadosVoto"></i> </h5> -->
             </div>
             <div class="modal-body">
               
               <!-- Card with an image on top -->
		      <div class="card">
		      <div class="card-body">
	          	     <a class="" href="#carouselExampleControls" role="button" data-slide="prev">
	                   <button type="button" class="list-group-item list-group-item-action rounded-pill btVoltarCarousel" data-tela="principal">
	                         <i class="bi bi-arrow-left-circle-fill"></i>	                   
	                   </button>
	                 </a>		      
		      </div>
		      
		      <div class="card-body">
		     	<div class="row justify-content-center">
				  <div class="col-md-6 offset-md-3">
		              <img class="imagemUrl_" 
		              	style="width:100px;height:100px;" src="local/img/vote-samba.png" class="card-img-top" alt="..." >
				  </div>
				</div>
				
				
				  <div class="row justify-content-md-center">
				    <div class="col col-sm">
				    </div>
				    <div class="col col-lg-5 selecionarRegiao" >
	                    <select class="form-select rounded-pill estadosComEvento" aria-label="Floating label select example">
	                    </select>
				    </div>
				    <div class="col col-s">
				    </div>
				  </div>
				  
				  <div class="row justify-content-md-center">
				    <div class="row align-items-end">
				    <div class="col">
				      
				    </div>
				    <div class="col">
						<p class="estadoEvento" data-estado=""></p>
						<p class="ensaioEvento" data-codensaio="" ></p>
						<p class="dataEnsaioEvento" data-dataapresentacao=""></p>
						<p class="agremiacaoEvento" data-codagremeacao=""></p>
				    </div>
				    <div class="col">
				      
				    </div>
				  </div>
				  </div>
		        
		      </div><!-- End Card with an image on top -->
		      </div><!-- End Card with an image on top -->
		      
		     <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="false" >
		      
								 <div class="carousel-inner">
											
								<!-- 		    Desfile -->
												<div class="carousel-item active desfileDiv">            
											        <%@include file="layoutpainelvotacao-item-carousel-desfile.jsp" %>
										        </div>
										            
								<!-- 		    Agremiacao -->
								       	        <div class="carousel-item agremiacaoDiv">
													 <%@include file="layoutpainelvotacao-item-carousel-agremiacao.jsp" %>
											   </div>
											   
								<!-- 		    bandeira -->
												<div class="carousel-item">
												  <%@include file="layoutpainelvotacao-item-carousel-bandeira.jsp" %>
									 			</div>
													
								<!-- 		    Voto -->
												<div class="carousel-item">
												  <%@include file="layoutpainelvotacao-item-carousel-voto.jsp" %>
								           		</div>
								           		
								<!-- 		    Fechar  -->
												<div class="carousel-item">
												  <%@include file="layoutpainelvotacao-item-carousel-obrigado.jsp" %>
								           		</div>
						         </div>
       </div>
       </div>
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