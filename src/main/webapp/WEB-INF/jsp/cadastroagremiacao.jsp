<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="head.jsp" %>  
</head>

  <script>
  
	$(document).ready(function(){
		
		
		var imagesPreview = function(input, placeToInsertImagePreview) {

	        if (input.files) {
	            var filesAmount = input.files.length;

	            for (i = 0; i < filesAmount; i++) {
	                
	            	var reader = new FileReader();
	            	
	                reader.onload = function(event) {
	                    $(   $.parseHTML('<img>') )
	                    .attr('style', "width:128px;height:128px;")
	                    .attr('id', "iconProfileBandeiraCadastro")
	                    .attr('class', "rounded-circle").attr('src', event.target.result).appendTo(placeToInsertImagePreview);
	                }
	                
	                reader.readAsDataURL(input.files[i]);
	            }
	        }
	    };
	    
	    
		$(".salvarPesquisa").click(function(){

			if ($("#textoPesquisa").val().length == 0) {
            	$("#textoPesquisa").addClass("is-invalid");
            	$("#addonTextoPesquisa").addClass("is-invalid");
            } else  {
            	$("#textoPesquisa").removeClass("is-invalid");
            	$("#addonTextoPesquisa").removeClass("is-invalid");
                
            	 var idApresentacao = $('.dadosApresentacao').data('codapresentacao');
            	 var index = $(".linhaPergunta tr").length;
            	 
                var dadosPesquisa = {};
   	    		dadosPesquisa.idApresentacao = idApresentacao;
   	    		dadosPesquisa.ordem = index+1;
   	    		dadosPesquisa.pergunta = $("#textoPesquisa").val();
    	    	
                $.ajax({
                    type: "POST",
                    url: "#(host_api)/campanha/pergunta",
                    data: JSON.stringify(dadosPesquisa),
                    contentType: "application/json; charset=utf-8",
                    success: function(data)
                    {
                    	atualizarTabelasPerguntas();
                    	$("#qtdPesquisa").html($(".linhaPergunta tr").length);		
                    },
                    
                    error: function(data)
                    {
                    	
                    	
                    	Swal.fire("Operacao falhou! "," Motivo: "+data.responseJSON.status, "error");
                    }
                });
    	    	$("#textoPesquisa").val('');
            }
   	
        });
		
		 $(document).on("click", ".pesquisaUP", function(){

	            var id = $(this).parents("tr").data("codpesquisa");
	                        
	            var method = "PUT";
	   	        var	urlCustomizada="#(host_api)/campanha/pergunta/ordem/"+id+"/up";

	   	        $.ajax({
	               type: method,
	               url: urlCustomizada,
	               success: function(data)
	               {
		                atualizarTabelasPerguntas();
	               },
	               
	               error: function(data)
	               {
	            	 //alert(JSON.stringify(data.responseJSON.status))   ;
	               	if (data.responseJSON.status == 400) {
	   	           	    $("#popupCampanhaMsgAlerta").html(data.responseJSON.message);
	   	                $("#popupCampanhaAlerta").fadeIn('fade').animate({opacity: 2.0}, 3500).effect("fade", { times: 1}, 10).fadeOut('fade');
	               	} else {
	               		$("#popupCampanhaMsgErro").html("Falha na operacao");
	   	                $("#popupCampanhaErro").fadeIn('fade').animate({opacity: 2.0}, 3500).effect("fade", { times: 1}, 10).fadeOut('fade');
	   	           	}
	               }
	           });
		    });
		    
		    $(document).on("click", ".pesquisaDOWN", function(){

	            var id = $(this).parents("tr").data("codpesquisa");
	                        
	            var method = "PUT";
	   	        var	urlCustomizada="#(host_api)/campanha/pergunta/ordem/"+id+"/down";

	   	        $.ajax({
	               type: method,
	               url: urlCustomizada,
	               success: function(data)
	               {
		                atualizarTabelasPerguntas();
	               },
	               
	               error: function(data)
	               {
	            	if (data.responseJSON.status == 400) {
		           	    $("#popupCampanhaMsgAlerta").html(data.responseJSON.message);
		                $("#popupCampanhaAlerta").fadeIn('fade').animate({opacity: 2.0}, 3500).effect("fade", { times: 1}, 10).fadeOut('fade');
	            	} else {
	            		$("#popupCampanhaMsgErro").html("Falha na operacao");
		                $("#popupCampanhaErro").fadeIn('fade').animate({opacity: 2.0}, 3500).effect("fade", { times: 1}, 10).fadeOut('fade');
		           	}
	            	
	               }
	           });
		    });
		    
		
		var actions = 
  		  ' <i data-codpesquisa="_idPesquisa_" class="bi bi-arrow-bar-up pesquisaUP"></i>'
  		 +' <i data-codpesquisa="_idPesquisa_" class="bi bi-arrow-bar-down pesquisaDOWN"></i>'
  	     +' <i data-codpesquisa="_idPesquisa_" data-pesquisa="_pesquisa_" class="bi bi-trash deletarPergunta"></i>'
  	     +'';
		
       var rowPesquisa =     	   
    	   '<tr data-codevento="_idEvento_" data-codpesquisa="_idPesquisa_" data-ordem="_ordem_" > ' +
	           '<td> _ordem_ </td>' +
	           '<td> _pesquisa_ </td>' +
			   '<td>' + actions + '</td>' +
          '</tr>';
		
		function atualizarTabelasPerguntas() {
			
			var idApresentacao = $('.dadosApresentacao').data('codapresentacao');
			var qtdPesquisas = 0;
			$.ajax({
	            type: "GET",
	            url: "#(host_api)/campanha/pergunta/"+idApresentacao,
	            success: function(data)
	            {
	            	$(".linhaPergunta").html('');
	    			//alert(JSON.stringify(data))
	            	$.each(data, function(i, item) {	            		
	            			
	            			var temp = rowPesquisa;
	            			
							temp = temp.replaceAll("_idPesquisa_", item.id);           	
							temp = temp.replaceAll("_ordem_", item.ordem);           	
							temp = temp.replaceAll("_pesquisa_", item.pesquisa);           	
							temp = temp.replaceAll("_idEvento_", item.evento.id);
		        			$(".linhaPergunta").append(temp);
		        			qtdPesquisas = qtdPesquisas+1;
		        		    $("#qtdPesquisa").html(qtdPesquisas);     
						    $(".eventos .qtdPerguntas_"+item.evento.id).html(qtdPesquisas);
		        		    
	            	});
	            },
	            
	            error: function(data)
	            {
	            	Swal.fire("Operacao falhou!", "", "error");
	            }
	        });
			
			
		}
     	
     	
     	// #########################################################
     	// ##################   DELETAR PESQUISA ###################
     	// #########################################################
        $(document).on("click", ".deletarPergunta", function(){
        	
	    	var idPesquisa = $(this).data('codpesquisa'); 
	    	var pesquisa = $(this).data('pesquisa'); 
	    	
	    	Swal.fire({
	        	  title: "Deseja excluir " + pesquisa + " ? ",
	        	  showDenyButton: true,
	        	  showCancelButton: false,
	        	  confirmButtonText: "Sim",
	        	  denyButtonText: "N&atilde;o"
	        	}).then((result) => {
	        	  if (result.isConfirmed) {
					  
					    $("#qtdPesquisa").html($(".linhaPergunta tr").length);
			            
			            var method = "DELETE";
			   	        var	urlCustomizada="#(host_api)/campanha/pergunta/"+idPesquisa;

			   	        $.ajax({
			               type: method,
			               url: urlCustomizada,
			               success: function(data)
			               {

			            	   atualizarTabelasPerguntas();
			               },
			               
			               error: function(data)
			               {
								Swal.fire("Operacao falhou!", "", "error");
			               }
			           });
	      	        
	        	  } else if (result.isDenied) {
	        		  //Swal.fire("Operacao cancelada", "", "info");
	        	  }
	        });
	    	
        	
        });
	    
	    
		 $(document).on("click", ".btCancelarApresentacao", function(evento){
			 
			 $('.btPesquisarApresentacao').prop('disabled', false);
			 if ($('.btCancelarApresentacao').html()=='Cancelar') {
				 $('.btCancelarApresentacao').html('Fechar');
				 $('.btSalvarApresentacao').html('Salvar');
			 } else if ($('.btCancelarApresentacao').html()=='Fechar') {
				 $('#modalCadastrarApresentacao').modal('hide');				 
			 }
		 });
		 
		 $(document).on("click", ".btPesquisarApresentacao", function(evento){
			 
			 carregarDadosApresentacao('.linhaApresentacao', $('.dadosApresentacao').data('codagremiacao'));
			 
		 });
		 
		 $(document).on("click", ".novaApresentacao", function(evento){
	    	$('#modalCadastrarApresentacao').modal('show');
	    	
	    	$('#carouselControleApresentacao').carousel(0);
	    	
	    	carregarComboEnsaio('.ensaioFormApresentacao');
	    	
	    	carregarDadosApresentacao('.linhaApresentacao', $(this).data('id'));

	    	
	    	$('.dadosApresentacao').data('codagremiacao', $(this).data('id'));
	    	$('.nomeAgremiacao').html($(this).data('nome'));

        	$('.btSalvarApresentacao').html("Salvar");
        	$('.btCancelarApresentacao').html("Fechar");
	    });
		 
		 $(document).on("click", ".resumoApresentacao", function(evento){
	    	$('#modalResumoApresentacao').modal('show');
	    	
	    	
		    	var itemList = 
		    	'<a href="#" class="list-group-item list-group-item-action" aria-current="true">'
	            +'<div class="d-flex w-100 justify-content-between">'
	            +'  <h5 class="mb-1">_ensaio_</h5>'
	            +'  <small>Data: _dataApresentacao_</small>'
	            +'</div>'
	            +'<p class="mb-1">Estado: _estado_</p>'
	            +'<small>_qtdPerguntas_ Perguntas</small>'
	            +' </a>';
	    	
	            var id = $(this).data('id');
	            var method = "GET";
	   	        var	urlCustomizada="#(host_api)/campanha/agremiacao/resumo/apresentacao/"+id;
	   	        $(".list-group-resumoApresentacao").html('');
	   	        $.ajax({
	               type: method,
	               url: urlCustomizada,
	               success: function(data)
	               {
						$.each(data, function(i, item) { 
							var temp = itemList;
							temp = temp.replaceAll("_estado_", item.estado);
							temp = temp.replaceAll("_ensaio_", item.ensaio);
							temp = temp.replaceAll("_dataApresentacao_", item.dataApresentacao);
							temp = temp.replaceAll("_qtdPerguntas_", item.qtdPerguntas);
		        			$(".list-group-resumoApresentacao").append(temp);
		            	});	            	
	            	  
	               },
	               
	               error: function(data)
	               {
						Swal.fire("Operacao falhou!", "", "error");
	               }
	           });
	            
	            
	    	
	    	
        	$('.btFecharModalResumoApresentacao').html("Fechar");
	    });
		 
		 
		 $("#formApresentacao" ).on("submit", function( event ) {
	        	
	        	if (!event.target.checkValidity()) {
	        		event.preventDefault();
	        	} else {
	       	        item = {}
	       	        item ["estado"] = $('.estadoFormApresentacao').val();
	       	        item ["dataApresentacao"] = $('.dataApresentacaoFormApresentacao').val();
	       	        item ["codAgremiacao"] = $('.dadosApresentacao').data('codagremiacao');
	       	        item ["codEnsaio"] = $('.ensaioFormApresentacao').val();
	       	        
	       	        var id = $('.dadosApresentacao').data('codapresentacao');
	       	        item ["id"] = id;
	       	        var method = "POST";
	       	        var urlCustomizada = "#(host_api)/campanha/apresentacao";
	       	        
	       	        if (id > 0) {
	       	        	method = "PUT";
	       	        	urlCustomizada="#(host_api)/campanha/apresentacao/"+id;
	       	        }
	          	     event.preventDefault();
	       	        $.ajax({
	                   type: method,
	                   url: urlCustomizada,
	                   contentType: "application/json; charset=utf-8",
	                   data: JSON.stringify(item),
	                   success: function(data)
	                   {
		                   	Swal.fire({
			    	    		  title: "Sucesso",
			    	    		  text: "",
			    	    		  icon: "success",
			    	    		  timer: 1000,
			    				  timerProgressBar: true,
			    	    	});	
			    	    	
		                    $('.ensaioFormApresentacao').val('');
		         			$('.estadoFormApresentacao').val('');
		                   	carregarDadosApresentacao('.linhaApresentacao', $('.dadosApresentacao').data('codagremiacao'));
		                   	
		                   	$(".estadoFormApresentacao").val('');
			            	$('.dataApresentacaoFormApresentacao').val('');
			            	$('.ensaioFormApresentacao').val('');
			            	
			            	$('.dadosApresentacao').data('codagremiacao', data.codAgremiacao);
			            	$('.dadosApresentacao').data('codapresentacao', data.id);
			            	
			   				 $('.btCancelarApresentacao').html('Fechar');
			   				 $('.btSalvarApresentacao').html('Salvar');
			            	
			            	
	                   },
	                   
	                   error: function(data)
	                   {
	                   	   console.log(data)
		            	   Swal.fire({
			    	    		  title: "ERRO",
			    	    		  text: data.message,
			    	    		  icon: "error"
			    	    	});
	                   
	                   }
	               });
	       	        
	       	     
	        	}
	        	
	        });
		 
		 $(document).on("click", ".novaPergunta", function(){
			 
			  $('#carouselControleApresentacao').carousel('next');
			  var ensaio = $(this).data('ensaio');
			  var data = $(this).data('data');
			  var idApresentacao = $(this).data('id');
			  
			  $('.dadosApresentacao').data('codapresentacao', idApresentacao);
			  $('.nomeAgremiacaoComApresentacao').html($('.nomeAgremiacao').html() + " > " + ensaio + " em " + data);
			  
			  atualizarTabelasPerguntas() ;

		 });
		 
		 
		 $(document).on("click", ".editarApresentacao", function(){
	         var id = $(this).data('id');
	         
	   	     $.ajax({
	            type: "GET",
	            url: "#(host_api)/campanha/apresentacao/"+id,
	            success: function(data)
	            {
	            	$(".estadoFormApresentacao").val(data.estado);
	            	$('.dataApresentacaoFormApresentacao').val(data.dataApresentacao);
	            	$('.ensaioFormApresentacao').val(data.codEnsaio);
	            	
	            	$('.dadosApresentacao').data('codagremiacao', data.codAgremiacao);
	            	$('.dadosApresentacao').data('codapresentacao', data.id);
	            	
	            	$('.btSalvarApresentacao').html("Atualizar");
	            	$('.btCancelarApresentacao').html("Cancelar");
	            	$('.btPesquisarApresentacao').prop('disabled', true);
	            	
	            },
	            error: function(data)
	            {
	            	
	            }
	        });			 
		 });
		 
		 $(document).on("click", ".deletarApresentacao", function(){
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
		      	            url: "#(host_api)/campanha/apresentacao/"+id,
		      	            success: function(data)
		      	            {
			                      Swal.fire({
				    	    		  title: "Excluir",
				    	    		  text: "Excluido com sucesso!",
				    	    		  icon: "success",
				    	    		  timer: 700,
				    				  timerProgressBar: true,
				    	    		});
			                    
			                    // Limpar dados
			                    $('.ensaioFormApresentacao').val('');
			         			$('.estadoFormApresentacao').val('');
			         			 
			                   	carregarDadosApresentacao('.linhaApresentacao', $('.dadosApresentacao').data('codagremiacao'));
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
		 
		 $(document).on("click", ".deletarAgremiacao", function(){
			
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
	      	            url: "#(host_api)/campanha/agremiacao/"+id,
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
		 
		 function carregarDadosApresentacao(elementoHtml, idAgremiacao) {
			 var acoes = '  <td class="text-center" style="width: 10%">'
			 		    +'		  <i style="cursor: pointer " class="fs-5 bi bi bi-question-lg novaPergunta" data-id="_id_" data-data="_data_" data-ensaio="_ensaio_"></i>'
			 		    +'		  <i style="cursor: pointer " class="fs-5 bi bi-pencil editarApresentacao" data-id="_id_" ></i>'
			 		    +'        <span>   </span>'					
			 		    +'        <span>   </span>'					
			 		    +'        <i style="cursor: pointer " class="fs-5 bi bi-trash deletarApresentacao" data-id="_id_"></i>	'					
			 		    +'   </td>';
			 
		     
			 var rowPesquisa =     	   
	    	   '<tr> ' +
		           '<td> _id_ </td>' +
		           '<td> _estado_ </td>' +
		           '<td> _ensaio_ </td>' +
		           '<td> _data_ </td>' +
		           acoes +
	          '</tr>';
			 
			 $(elementoHtml).empty();
			 
			 var codEnsaioParam = $('.ensaioFormApresentacao').val();
			 var estado = $('.estadoFormApresentacao').val();
			 
			 var params = ""
			 if (codEnsaioParam != "") {
				 params = params+"&codEnsaio="+codEnsaioParam;
			 } 
			 if (estado != "") {
				 params = params+"&estado="+estado;
			 } 
			 
			 
	         $.ajax({
	            type: "GET",
	            url: "#(host_api)/campanha/apresentacao/listaPaginada/agremiacao/"+idAgremiacao + "?1=1" + params,
	            success: function(data)
	            {
        			$(".qtdLinhaApresentacao").html(data.totalElements);
					$.each(data.content, function(i, item) {	 
						
						var temp = rowPesquisa;
						temp = temp.replaceAll("_id_", item.id);	
						temp = temp.replaceAll("_estado_", item.estado);
						temp = temp.replaceAll("_codEnsaio_", item.codEnsaio);
						temp = temp.replaceAll("_ensaio_", item.ensaio);
						temp = temp.replaceAll("_data_", item.dataApresentacao);
	        			$(".linhaApresentacao").append(temp);
	            	});	            	
	            },
	            
	            error: function(jqXHR, textStatus, errorThrown)
	            {
	            	
	            		alert(textStatus)
	            		alert(errorThrown)
	            		alert(jqXHR)
	            	 Swal.fire({
	    	    		  title: "Falha ao recuperar dados ensaio",
	    	    		  text: "",
	    	    		  icon: "error",
	    	    		  timer: 1000,
	    				  timerProgressBar: true
	    	    	});
	            
	            }
	        });
	     }
		 
		 function carregarComboEnsaio(elementoHtml) {
		     
    	     $(elementoHtml).empty();
    	     $(elementoHtml).append($('<option>', { 
					        value: '',
					        text : '--Selecione--'
					    }));
	        
			$.ajax({
	            type: "GET",
	            url: "#(host_api)/campanha/ensaio/lista",
	            dataType: 'json' ,
	            success: function(data)
	            {
					$.each(data, function(i, item) {	            		
		       			$(elementoHtml).append($('<option>', { 
					        value: item.id,
					        text : item.nome
					    }));
	            	});	            	
	            },
	            
	            error: function(jqXHR, textStatus, errorThrown)
	            {
	            	 Swal.fire({
	    	    		  title: "Falha ao recuperar dados ensaio",
	    	    		  text: "",
	    	    		  icon: "error",
	    	    		  timer: 1000,
	    				  timerProgressBar: true
	    	    	});
	            
	            }
	        });
    	     
    	     
	     }
	    
	    
	    $('#bandeira-photo-add').on('change', function() {
	    	$('.bandeira').html('')
	        imagesPreview(this, 'div.bandeira');
	    });
	    
	    $('.uploadImagemBandeira').click(function(){ $('#bandeira-photo-add').trigger('click'); });
	    $('.removeImagemBandeira').click(function(){ $('.bandeira').html(''); });
		
// 		##########################################
// 		############Carregamento Principal #######
// 		##########################################
		 carregarDadosUsuario(null, null);
		 function carregarDadosUsuario(paginaAtual, paginaDestino) {
			$('.bandeira').html('');
			var linhaTabela = 
	       		'<tr> '
                +' <td>_id_</td>'
                +' <td>_agremiacao_</td>'
                +' <td><img id="iconProfileBandeira" class="rounded-circle" src="_bandeira_" style="width:128px;height:128px;" /></td>'
                +' <td> <p class="fs-6 lh-sm">_descricaoAgremiacao_ </p> </td>'
                +'  <td style="width: 10%">'
    		    +'		  <i style="cursor: pointer " class="bi bi-calendar2-check w-25 fs-5 resumoApresentacao" data-id="_id_" title="Mostra Resumo apresentações"></i>'
    		    +'		  <i style="cursor: pointer " class="bi bi-list-check w-25 fs-5 novaApresentacao " data-nome="_agremiacao_" data-id="_id_" title="Vincular Apresentações"> </i>'
    		    +'        '					
    		    +'		  <i style="cursor: pointer " class="bi bi-pencil w-25 fs-5 editarAgremiacao" data-nome="_agremiacao_" data-id="_id_" title="Editar Agremiacao"></i>'
    		    +'        <i style="cursor: pointer " class="bi bi-trash w-25 fs-5 deletarAgremiacao" data-nome="_agremiacao_" data-id="_id_" title="Excluir Agremiacao"></i>	'					
    		    +'   </td>'
               '  </tr>';

               var urlCustomizada = "#(host_api)/campanha/agremiacao";
               if (paginaAtual != null && paginaDestino != null) {
            	   urlCustomizada = "#(host_api)/campanha/agremiacao?page="+ paginaDestino; 
               }                
            
            $("#listaAgremiacao").html('');
            $('.agremiacao').val("");
            $('.agremiacao').data('id', "");
            $('#iconProfileBandeira').attr('src', ''); 
            
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
	            		temp = temp.replaceAll("_agremiacao_", item.agremiacao);
	            		temp = temp.replaceAll("_bandeira_", item.bandeiraBase64Imagem);
	            		temp = temp.replaceAll("_descricaoAgremiacao_", item.agremiacaoDescricao);
	            		temp = temp.replaceAll("_dadosTabelaAgremiacao_", item.dadosTabelaAgremiacao);
	            		temp = temp.replaceAll("_id_", item.id);
		    			$("#listaAgremiacao").append(temp);
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
		 
		 $(document).on("click", ".editarAgremiacao", function(){
	         var id = $(this).data('id');
	         
	   	     $.ajax({
	            type: "GET",
	            url: "#(host_api)/campanha/agremiacao/"+id,
	            success: function(data)
	            {
	            	$('.bandeira').html('');
	            	
	            	$(  $.parseHTML('<img>') )
                    .attr('style', "width:128px;height:128px;")
                    .attr('id', "iconProfileBandeiraCadastro")
                    .attr('class', "rounded-circle").attr('src', data.bandeiraBase64Imagem).appendTo('div.bandeira')
	            	
// 	            	<img id="iconProfileBandeira" class="rounded-circle" src="_bandeira_" style="width:128px;height:128px;" />
	            	$('.agremiacao').val(data.agremiacao);
	            	$('.agremiacaoDescricao').val(data.agremiacaoDescricao);
	            	
	            	$('.agremiacao').data('id', data.id);
	            	$('.agremiacaoBandeira').val( data.bandeiraBase64Imagem);
	            	
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
		 
		 $(document).on("click", ".deletarAgremiacao", function(){
			
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
	      	            url: "#(host_api)/campanha/agremiacao/"+id,
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
		 
		 
		 $(document).on("click", ".limparFormulario", function(){
	         $('.agremiacao').val("");
	         $('.agremiacao').data('id', "");
        });
		 
		 $(".formularioAgremiacao" ).on("submit", function( event ) {

			    $('#bandeira-photo-add-text').val($('#iconProfileBandeiraCadastro').attr('src'));
			 
	        	if (!event.target.checkValidity()) {
	        		event.preventDefault();
	        	} else {
	        		var iconProfileBandeira = $('#iconProfileBandeiraCadastro').attr('src');
	        		dadosCadastroAgremiacao = {}
	        		dadosCadastroAgremiacao["agremiacao"] = $('.agremiacao').val();
	        		dadosCadastroAgremiacao["agremiacaoDescricao"] = $('.agremiacaoDescricao').val();
	        		dadosCadastroAgremiacao["bandeiraBase64Imagem"] = iconProfileBandeira;
	        		
	       	        var id = $('.agremiacao').data('id');
	       	        var method = "POST";
	       	        var urlCustomizada = "#(host_api)/campanha/agremiacao";
	       	        if (id > 0) {
	       	        	method = "PUT";
	       	        	urlCustomizada="#(host_api)/campanha/agremiacao/"+id;
	       	        }
	       	        
	          	    event.preventDefault();
	       	        $.ajax({
	                   type: method,
	                   url: urlCustomizada,
	                   contentType: "application/json; charset=utf-8",
	                   data: JSON.stringify(dadosCadastroAgremiacao),
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
          <li class="breadcrumb-item active">Agremiacao</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
		  
	  <div class="card">
            <div class="card-body">
              <h5 class="card-title">Cadastro da Agremiacao</h5>

              <!-- Floating Labels Form -->
              <form class="row g-3 needs-validation formularioAgremiacao" novalidate>
                <div class="col-md-12">
                  <div class="form-floating">
                    <input type="text" class="form-control agremiacao" id="floatingName" placeholder="Nome da Agremiacao" maxlength="100" required>
                    <label for="floatingName">Agremiacao</label>
                  </div>
                </div>
                
                <div class="col-md-12">
                  <div class="form-floating">
                    <input type="text" class="form-control agremiacaoDescricao" id="floatingName" placeholder="Descricao" maxlength="250" required >
                    <label for="floatingName">Descrição</label>
                  </div>
                </div>
                
                <div class="col-md-12">
                     <div class="form-floating">
                          
<!--                          IMAGEM -->
                         <div class="bandeira"></div> 
<!--                          IMAGEM -->
                          
                         <div class="pt-2 form-check">
		                   <a href="#" class="btn btn-primary btn-sm uploadImagemBandeira" title="Upload"><i class="bi bi-upload"></i></a>
		                   <a href="#" class="btn btn-danger btn-sm removeImagemBandeira" title="Remover"><i class="bi bi-trash"></i></a>
		                   <a href="#" class="btn btn-success btn-sm salvarImagemBandeira" title="Salvar"><i class="bi bi-floppy"></i></a>
                		   <input type="text" id="bandeira-photo-add-text" class="form-control agremiacaoBandeira" style="visibility: hidden;" required>
			       		   <input type="file" id="bandeira-photo-add" class="agremiacaoBandeira" style="visibility: hidden;">
		                   <div class="invalid-feedback">Informar uma bandeira</div>
		                 </div>
  					 </div>
                  </div>
                  
                
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">Salvar</button>
                  <button type="reset" class="btn btn-secondary limparFormulario">Limpar</button>
                </div>
              </form><!-- End floating Labels Form -->

            </div>
          </div>
          
           <div class="card">
            <div class="card-body">
              <h5 class="card-title"></h5>
              <p></p>

              <table class="table table-sm table-light" border="1">
                <thead>
                  <tr>
                    <th scope="col" width="10">#</th>
                    <th scope="col" >Agremiação</th>
                    <th scope="col">Bandeira</th>
                    <th scope="col">Descrição</th>
                    <th scope="col">Ações</th>
                  </tr>
                </thead>
                <tbody id="listaAgremiacao">
                                   
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