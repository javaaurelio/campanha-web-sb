$(document).ready(function(){
		
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
		
		$('.rating span').click(function(){
		  //  alert($(this).attr('id'));
		})
 
		var actions = 
    		  ' <i data-codpesquisa="_idPesquisa_" class="bi bi-arrow-bar-up pesquisaUP"></i>'
    		 +' <i data-codpesquisa="_idPesquisa_" class="bi bi-arrow-bar-down pesquisaDOWN"></i>'
    	     +' <i data-codpesquisa="_idPesquisa_" data-pesquisa="_pesquisa_" class="bi bi-trash deleteItem"></i>'
    	     +'';
        
       var row =     	   
		    '<tr data-id="_id_">'
		    +'   <th scope="row" style="width: 5%">_id_</th>'
		   + '   <td data-imagemurl="_imagemUrl_" data-layout="_layoutPainelVotacao_" data-descricao="_descricao_">_campanha_</td>'
		   
		    +'   <td data-datainicio="_dtInicio_" data-datafim="_dtFim_" style="width:15%">_dtInicio_ \u00E0 _dtFim_'
		    
		   	+ '<div class="progress">'
		   	+ '<div class="progress-bar _statusPorcentagemdias_" role="progressbar" style="width: _porcentagemDias_%">_porcentagemDias_%</div>'
		   	+ '</div>'
		   	+ '</td>'
		   	
		  	+ '<td>'
		  	+ 'Compartilhar link:  <i class="bi bi-copy" data-urlpublicacao="_urlpublicacao_" title="_urlpublicacao_" ></i> <i class="bi bi-facebook"></i> <i class="bi bi-whatsapp"></i>  <br>'
		  	+ 'Publicado :  <i class="bi bi-sign-stop-fill iconpublicacaostop__id_" style="color: red;  visibility: _visivelstop_"></i> <div class="spinner-border text-success spinner-border-sm iconpublicacao__id_" role="status" style="visibility: _visivel_"></div> <br>'
		  	+ 'Votos: _qtdVotos_ <br>'
		  	+ 'Perg Basicas: SIM <br>'
		  	+ 'Qtd Finaliza: SIM <br>'
		  	+ 'Qtd Perguntas: _qtdPerguntas_ <br>'
		  	+ 'Layout Painel Votacao: _layoutPainelVotacao_ <br>'
		  	+ '</td>' 	
		    +'   <td class="text-center" style="width: 5%" >'
				    +'<div class="form-check form-switch">'
					    +'<input class="form-check-input publicar" type="checkbox" id="flexSwitchCheckChecked__id_" _publicado_>'
				    +'</div>'
		    +'</td>'
		    +'   <td class="text-center" style="width: 5%"><i class="bi bi-search-heart eventoIcon" id=\'mostrarModalPesquisaCampanha\' "></i> 	</td>'
		    
		    +'  <td class="text-center" style="width: 10%">                    	  '
		    +'		  <i class="bi bi-pencil editarItemCampanha"></i>'
		    +'        <i class="bi bi-trash deleteItemCampanha"></i>	'					
		    +'        <br>	'					
		    +'        <i class="bi bi-tv mostrarPainelVotacao" title="Visualizar painel de votacao"></i>'
		    +'        <i class="bi bi-speedometer mostrarDashboard"></i>'
		    +'   </td>'
		    +' </tr>';
		    
		    
       var rowPesquisa =     	   
    	   '<tr data-codevento="_idEvento_" data-codpesquisa="_idPesquisa_" data-ordem="_ordem_" > ' +
	           '<td> _ordem_ </td>' +
	           '<td> _pesquisa_ </td>' +
			   '<td>' + actions + '</td>' +
          '</tr>';
          
          
          var rating =     
      	    ' <div id="center" class="rating">'
  			+'  <span class="fa fa-star star5 star5_codpesquisa_" id="5"></span>'
  			+'  <span class="fa fa-star star4 star4_codpesquisa_" id="4"></span>'
  			+'  <span class="fa fa-star star3 star3_codpesquisa_" id="3"></span>'
  			+'  <span class="fa fa-star star2 star2_codpesquisa_" id="2"></span>'
  			+'  <span class="fa fa-star star1 star1_codpesquisa_" id="1"></span>'
  		  	+'</div>';

          var ratingPequenos =     
      	    ' <div id="center" class="ratingPequeno">'
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
	    
	    
// 		##########################################
// 		############Carregamento Principal ####### style="background: #eeeeee"
// 		##########################################
		 carregarDadosDashboardEvento();
		 
		 function carregarDadosDashboardEvento() {
			$(".filtroPainelTotal").text('Total Geral');
	       	$(".aumentoVotosEvento").html('');
	       	
	        var novoEventoDiv = 
	        	'<div class="col-sm-3 widgetNovoEvento">'+
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
				
		var eventoDivAcoes = 		
			'<div class="filter">                                                           '+
			'			<a class="icon" href="#" data-bs-toggle="dropdown"><i               '+
			'				class="bi bi-three-dots"></i></a>                               '+
			'			<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">    '+
			
			'				<li><a class="dropdown-item bi bi-list-task mostrarModalPesquisaCampanha" href="#"> Perguntas </a></li>'+
			
				'<hr class="dropdown-divider">'+
			
			'				<li><a class="dropdown-item bi bi-pencil editarItemCampanha" '+
			'					href="#"> Alterar</a> </li>'+
			'				<li><a class="dropdown-item bi bi-trash deleteItemCampanha"               '+
			'					href="#"> Deletar</a></li>                                      '+
			'				<li><a class="dropdown-item bi bi-tv href="#"> Preview</a></li> '+
			
			
			'   <hr class="dropdown-divider">'+
			'				<li><a class="dropdown-item bi-play-fill mostrarModalPublicar" href="#"> Publicar</a></li>'+
			'   <hr class="dropdown-divider">'+
			'				<li><a class="dropdown-item bi bi-speedometer mostrarEstatisticas" href="#"> Estatisticas de Votos</a></li>'+
			'			</ul>                                                               '+
			'    </div>                                                                ';	
				
					
	     var eventoDiv = 
					'<div class="col-sm-3 widgetEvento dadosEvento" data-id="_idEvento_" data-nomeevento="_eventoNome_" '+
					' data-urlpublicacao="_urlPublicacao_" '+
					' data-imagemurl="_imagemUrl_" '+
					' data-publicado="_publicado_" '+
					' data-descricao="_descricaoEvento_" '+
					'   >'+
					'<div class="card info-card naopublicado-card revenue-card" style="_estiloStatus_" > '+
					eventoDivAcoes +
					'	          <div class="card-body" title="_eventoNome_tt">'+
					'               <h5 class="card-title">_eventoNome_<span> |  <span class="text-black-50" style="font-size: 10px;"></span></h5>'+
					'	                <div class="d-flex align-items-center">'+
					'                 <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">'+
					'                  <i class="bi bi-people"></i> '+
					'               </div>'+
					'              <div class="ps-3">'+
					'               <h6 class="qtdVotosEvento">   _mediaVotacao_ / 5  </h6> ' +
					'              <span class="text-success small fw-bold">_qtdVotosEvento_  </span> <span class="text-muted small">votos</span>'+
					'             <br> <span class="text-success small fw-bold qtdPerguntas__idEvento_">_qtdPerguntas_  </span> <span class="text-muted small">Perguntas</span>    '+
					'             <div class="progress" style="height: 12px;"><div class="progress-bar _statusPorcentagemdias_" role="progressbar" style="width: _vidaUtil_%" aria-valuenow="_vidaUtil_" aria-valuemin="0" aria-valuemax="100">_vidaUtil_%</div>   </div>'+
					'           </div>'+
					'        </div>'+
					'     </div>'+
					'	</div>'+
					'   </div>';
					
			$.ajax({
	            type: "GET",
	            url: "#(host_api)/campanha/dashboardevento/geral",
	            dataType: 'json' ,
	            success: function(data)
	            {
					$(".eventos").html( "" );
					$(".eventos").append( novoEventoDiv );

					$.each(data.listaDadosEvento, function(i, item) {	            		

	            		var temp = eventoDiv;
	            		temp = temp.replaceAll("_idEvento_", item.idEvento);
	            		temp = temp.replaceAll("_eventoNome_tt", item.nomeEvento);
	            		temp = temp.replaceAll("_eventoNome_", item.nomeEvento.substring(0, 20));
	            		temp = temp.replaceAll("_descricaoEvento_", item.descricao);
	            		temp = temp.replaceAll("_dataInicio_", item.dataInicio);
	            		temp = temp.replaceAll("_dataFim_", item.dataFim);
	            		temp = temp.replaceAll("_vidaUtil_", item.vidaUtil);
	            		temp = temp.replaceAll("_publicado_", item.publicado);
	            		temp = temp.replaceAll("_urlPublicacao_", item.urlPublicacao);
	            		temp = temp.replaceAll("_imagemUrl_", item.urlImagem);
	            		temp = temp.replaceAll("_mediaVotacao_", item.mediaVotos);
	            		temp = temp.replaceAll("_qtdPerguntas_", item.qtdPerguntas);
	            		temp = temp.replaceAll("_qtdVotosEvento_", item.qtdVotos);
	            		//temp = temp.replaceAll("_estiloStatus_", "background: linear-gradient(#d2ffdf, #e8fff1)");
	            		//temp = temp.replaceAll("_estiloStatus_", "background: linear-gradient(#ffffff, #fdfdfd, #ebffe1)");

	            		if  (item.publicado) {
							
		            		temp = temp.replaceAll("_estiloStatus_", "background: linear-gradient(#ffffff, #b8d8d8)");
							
						} else {
							
		            		temp = temp.replaceAll("_estiloStatus_", "background: linear-gradient(#ffffff, #d8bfb8)");
							
						}
	            		
	            		// temp = temp.replaceAll("_estiloStatus_", "background: linear-gradient(#ffffff, #eeeeee, #e8e8e8)"); nao publicado
	            		
	            		
	            		if (item.vidaUtil >= 80 && item.vidaUtil < 90) {
							temp = temp.replaceAll("_statusPorcentagemdias_", "bg-warning");
						} else if (item.vidaUtil >= 90) {
							temp = temp.replaceAll("_statusPorcentagemdias_", "bg-danger");
						}
	            		
	            		
		       			$(".eventos").append( temp );
	            	});	            	
	            },
	            
	            error: function(jqXHR, textStatus, errorThrown)
	            {
	            	 Swal.fire({
	    	    		  title: "Falha ao recuperar dados Evento",
	    	    		  text: "",
	    	    		  icon: "error",
	    	    		  timer: 1000,
	    				  timerProgressBar: true
	    	    	});
	            
	            }
	        });
		 }
	    
	    $(document).on("click", ".pesquisaUP", function(){

            var id = $(this).parents("tr").data("codpesquisa");
                        
            var method = "PUT";
   	        var	urlCustomizada="#(host_api)/campanha/pesquisa/ordem/"+id+"/up";

   	        $.ajax({
               type: method,
               url: urlCustomizada,
               success: function(data)
               {
	                $("#popupCampanhaSucesso").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
	               	atualizarTabelasPesquisa();
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
   	        var	urlCustomizada="#(host_api)/campanha/pesquisa/ordem/"+id+"/down";

   	        $.ajax({
               type: method,
               url: urlCustomizada,
               success: function(data)
               {
	                $("#popupCampanhaSucesso").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
	               	atualizarTabelasPesquisa();
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
	    
	    $(document).on("click", ".deleteItemCampanha", function() {
			var cd = $(this).parents('.dadosEvento');
				    	
	    	var idEvento = cd.data("id");
	    	var nomeEvento = cd.data("nomeevento");
	    	
	    	Swal.fire({
	        	  title: "Deseja excluir " + nomeEvento + " ? ",
	        	  showDenyButton: true,
	        	  showCancelButton: false,
	        	  confirmButtonText: "Sim",
	        	  denyButtonText: "N&atilde;o"
	        	}).then((result) => {
	        	  if (result.isConfirmed) {
					  						
			   	        var method = "DELETE";
			   	        var	urlCustomizada="#(host_api)/campanha/evento/"+idEvento;
			   	        $.ajax({
			               type: method,
			               url: urlCustomizada,
			               success: function(data)
			               {
								Swal.fire({
				    	    		  title: "Excluido",
				    	    		  text: "",
				    	    		  icon: "success",
				    	    		  timer: 500,
				    				  timerProgressBar: true,
				    	    	});

			               		carregarDadosDashboardEvento();
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
	    
		function atualizarTabelasPesquisa() {
			
			var idEvento = $('#nomeCampanhaPergunta').data("codevento");
			var qtdPesquisas = 0;
			$.ajax({
	            type: "GET",
	            url: "#(host_api)/campanha/pesquisa/"+idEvento,
	            success: function(data)
	            {
	            	$(".linhaPesquisa").html('');
	    			//alert(JSON.stringify(data))
	            	$.each(data, function(i, item) {	            		
	            			
	            			var temp = rowPesquisa;
	            			
							temp = temp.replaceAll("_idPesquisa_", item.id);           	
							temp = temp.replaceAll("_ordem_", item.ordem);           	
							temp = temp.replaceAll("_pesquisa_", item.pesquisa);           	
							temp = temp.replaceAll("_idEvento_", item.evento.id);
		        			$(".linhaPesquisa").append(temp);
		        			qtdPesquisas = qtdPesquisas+1;
		        		    $("#qtdPesquisa").html(qtdPesquisas);     
						    $(".eventos .qtdPerguntas_"+item.evento.id).html(qtdPesquisas);
		        		    
	            	});
	            },
	            
	            error: function(data)
	            {
	            
	            }
	        });
			
			
		}
		
	    $(document).on("click", ".mostrarDashboard", function(){
	    	
	    	var idEvento = $(this).parents('tr').find('th').eq(0).html()
		  	$(location).attr('href','dashboardevento?idEvento=' + idEvento);
		  
	    });
	    
// 	    ################################################
// 	    ################ Painel      Votacao############
// 	    ################################################
	    $(document).on("click", ".mostrarPainelVotacao", function(){
		  
	    	var idEvento = $(this).parents('tr').find('th').eq(0).html();
//	    	var src = $(this).parents('tr').find('img').eq(0).attr('src');
	    	var src = $(this).parents('tr').find('td[data-imagemurl]').data('imagemurl');
	    	
	    	$('.imagemUrl').attr('src', src);
	    	$(".linhaPesquisaPainelVisualizacao").html('');
			$.ajax({
	            type: "GET",
	            url: "#(host_api)/campanha/pesquisa/"+idEvento,
	            success: function(data)
	            {
	            	$(".linhaPesquisa").html('');
	    			//alert(JSON.stringify(data))
	            	$.each(data, function(i, item) {	            		
            			var temp = rowPesquisaPainelVotacao;
						temp = temp.replaceAll("_codpesquisa_", item.id);	
						temp = temp.replaceAll("_pesquisa_", item.pesquisa);
						
	        			$(".linhaPesquisaPainelVisualizacao").append(temp);
	        			$(".tituloPainelVotacao").text(item.evento.nome);
	        			$(".descricaoPainelVotacao").text(item.evento.descricao);
	        			reloaddd();
	            	});
	            },
	            error: function(data)
	            {
	            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
	            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
	            
	            }
	        });
	    	$('#smallModalVotacao').modal('show');
	    });
	    
	    $(document).on("click", "#salvarVotar", function(){
		  
	    	votos = []
	    	 $(".linhaPesquisaPainelVisualizacao").find('tr').each(function( index, element ) {
	   		    voto = {}
	    		 voto.codpesquisa = $(this).data('codpesquisa');
	    		 //voto.pesquisa = $(this).find('td:eq( 0 )').html();
	    		 voto.voto = $(this).data('voto');
	    		 votos.push(voto);
	    	});
		     //alert(JSON.stringify(votos));
		     
	    	$.ajax({
                type: "POST",
                url: "#(host_api)/campanha/voto",
                data: JSON.stringify(votos),
                contentType: "application/json; charset=utf-8",
                success: function(data)
                {
                	//$(".linhaPesquisa").append(row);
                	atualizarTabelasPesquisa();
                	$("#qtdPesquisa").html($(".linhaPesquisa tr").length);		
            		//$(".linhaPesquisa tr").eq(index + 1).find(".add, .edit").toggle();
                	$("#popupCampanhaSucesso").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
                },
                
                error: function(data)
                {
                	$("#popupCampanhaMsgErro").html(JSON.stringify(data));
                    $("#popupCampanhaErro").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
                }
            });
    	});
	    
	    $(document).on("publicarCampanhaSim", function(event, idObject, elementoAlterado){
	    	$('#modalDialogo').modal('hide');
	    	var status = $(".publicar").is(":checked");
	    	
// 	    	Swal.fire({
// 		        title: 'Do you want to get data from Github?',
// 		        text: "Voce quer publicar ?",
// 		        type: 'warning',
// 		        showCancelButton: true,
// 		        allowOutsideClick: false,
// 		        confirmButtonColor: '#3085d6',
// 		        cancelButtonColor: '#d33',
// 		        confirmButtonText: 'Sim',
// 		        showLoaderOnConfirm: true,
// 		        allowOutsideClick: () => !Swal.isLoading(),
// 		        preConfirm: function(){
// 		            return publicarCampanha(idObject, status, true); //Your ajax function here
// 		        }
// 		    });

	    	publicarCampanha(idObject, status, true);
	    });
	    
	    $(document).on("suspenderCampanhaSim", function(event, idObject, elementoAlterado){
	    	$('#modalDialogo').modal('hide');
	    	var status = $(".publicar").is(":checked");
	    	
	    	publicarCampanha(idObject, status, false);
	    });
	    
        $(document).on("click", ".publicar", function(){
        	        	
        	var idEvento = $(this).parents('tr').find('th').eq(0).html();
	    	var status = $(this).is(":checked");
	    	
	    	document.getElementById("flexSwitchCheckChecked_"+idEvento).checked = !status;

	    	$('#modalDialogo').modal('show');
	    	
    		   	
	    	$('.modalDialogoTitulo').val('Publicar campanha');
	    	$('.modalDialogoPerguntaCabecalho').html($(this).parents('tr').find('td').eq(0).html());
	    	
	    	$('.modalDialogoPerguntaCabecalho').data("idObject", idEvento);
	    	$('.modalDialogoPerguntaCabecalho').html("<strong>"+$(this).parents('tr').find('td').eq(0).html()+"</strong>");
	    	
	    	if ( status) {
	    		$('.modalDialogoPerguntaCabecalho').data("eventoCustomizado", "publicarCampanhaSim");	    		
	    		$('.modalDialogoPergunta').html('Deseja publicar a campanha ?');	
	    	} else {
	    		$('.modalDialogoPerguntaCabecalho').data("eventoCustomizado", "suspenderCampanhaSim");
	    		$('.modalDialogoPergunta').html('Deseja SUSPENSA a publicacao da campanha ?');
	    	}
        });
     	
	    //
	    //
	    // ################################################
	    // ###############   EDITAR EVENTO  ###############  
	    // ################################################
	    $(document).on("click", ".editarItemCampanha", function(evento) {
           	$("#formCampanha").find(".btn-primary").html('Atualizar');
           	
           	var cd = $(this).parents('.dadosEvento');
			
			$.ajax({
		            type: "GET",
		            url: "#(host_api)/campanha/evento/"+cd.data("id"),
		            success: function(data)
		            {
		            	$(".codigoCampanha").html( data.id );
           	
			           	$("#formCampanha :input[name='campanha']").val( data.campanha );
			           	           	
			           	var datainicio = data.dataInicio;
			           	$("#formCampanha :input[name='dataInicio']").val( datainicio.split("/").reverse().join("-") );
			           	
			           	var datafim = data.dataFim;
			           	$("#formCampanha :input[name='dataFim']").val( datafim.split("/").reverse().join("-") );
			           	
			           	$("#formCampanha :input[name='imagemUrl']").val( data.imagemUrl );
			           	
			           	$('.layoutPainelVotacao').val(data.layoutPainelVotacao);
			           	
			           	$('.descricao').val(data.descricao);
			           	
			           	$('.btNovaCampanha').trigger('click', 'edicao');
			           	
			           	$('#modalCadastrarEvento').modal('show');
		            	
		            	
		            },
		            error: function(data)
		            {
		            	alert("Erro ao recuperar evento " + idEvento)
		            }
		        });
           	
        });
        
     	// ######################################################
     	// ######################################################
     	// ##################Salvar Pesquisa ####################
     	// ######################################################
     	// ######################################################
     	
        $(".salvarPesquisa").click(function(){
        	
    		var index = $(".linhaPesquisa tr").length;

    		var row = '<tr data-id=' + index + '> ' +
                '<td data-tipocampo="ordem">' + index+1 + '</td>' +
                '<td data-tipocampo="pesquisa" > '  +   $("#textoPesquisa").val()   + ' ? </td>' +
    			'<td>' + actions + '</td>' +
            '</tr>';
            
            if ($("#textoPesquisa").val().length == 0) {
            	$("#textoPesquisa").addClass("is-invalid");
            	$("#addonTextoPesquisa").addClass("is-invalid");
            } else  {
            	$("#textoPesquisa").removeClass("is-invalid");
            	$("#addonTextoPesquisa").removeClass("is-invalid");
                
                var dadosPesquisa = {};
   	    		dadosPesquisa.idEvento = $('#nomeCampanhaPergunta').data('codevento');
   	    		dadosPesquisa.ordem = index+1;
   	    		dadosPesquisa.pesquisa = $("#textoPesquisa").val();
    	    	
                $.ajax({
                    type: "POST",
                    url: "#(host_api)/campanha/pesquisa",
                    data: JSON.stringify(dadosPesquisa),
                    contentType: "application/json; charset=utf-8",
                    success: function(data)
                    {
                    	atualizarTabelasPesquisa();
                    	$("#qtdPesquisa").html($(".linhaPesquisa tr").length);		
                    },
                    
                    error: function(data)
                    {
                    	
                    }
                });
    	    	$("#textoPesquisa").val('');
            }
   	
        });
     	
     	
     	// #########################################################
     	// ##################   DELETAR PESQUISA ###################
     	// #########################################################
        $(document).on("click", ".deleteItem", function(){
        	
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
					  
					    $("#qtdPesquisa").html($(".linhaPesquisa tr").length);
			            
			            var method = "DELETE";
			   	        var	urlCustomizada="#(host_api)/campanha/pesquisa/"+idPesquisa;

			   	        $.ajax({
			               type: method,
			               url: urlCustomizada,
			               success: function(data)
			               {

//								Swal.fire({
//				    	    		  title: "Excluido",
//				    	    		  text: "",
//				    	    		  icon: "success",
//				    	    		  timer: 1000,
//				    				  timerProgressBar: true,
//				    	    	});

				               atualizarTabelasPesquisa();
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
     	

     	//      	############################# Modal Dialogo Acao
        $(document).on("click", ".executarSim", function(){
	    	$('#modalDialogo').modal('hide');
	    	
	    	var id = $('.modalDialogoPerguntaCabecalho').data("idObject");
	    	var evento = $('.modalDialogoPerguntaCabecalho').data("eventoCustomizado");
	    	$(document).trigger(evento,  id);
	    });
	   //          ############################ Modal Dialogo Acao


     	
        $(document).on("deleteItemPesquisa", function(event, idObject){
            
            $("#qtdPesquisa").html($(".linhaPesquisa tr").length);
            var id = $(this).parents("tr").data("codpesquisa");
            
            var method = "DELETE";
   	        var	urlCustomizada="#(host_api)/campanha/pesquisa/"+idObject;

   	        $.ajax({
               type: method,
               url: urlCustomizada,
               success: function(data)
               {
	                $("#popupCampanhaSucesso").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
	               	atualizarTabelasPesquisa();
               },
               
               error: function(data)
               {
           	    $("#popupCampanhaMsgErro").html(JSON.stringify(data));
                $("#popupCampanhaErro").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
               }
           });
            
            
            
        });
        
                
        $("#formCampanha" ).on("submit", function( event ) {
        	
        	if (!event.target.checkValidity()) {
        		event.preventDefault();
        	} else {
       	        item = {}
       	        item ["campanha"] = $('#formCampanha').find('input[name="campanha"]').val();
       	        item ["dataInicio"] = $('#formCampanha').find('input[name="dataInicio"]').val();
       	        item ["dataFim"] = $('#formCampanha').find('input[name="dataFim"]').val();
       	        item ["imagemUrl"] = $('#formCampanha').find('input[name="imagemUrl"]').val();
       	        item ["descricao"] = $('.descricao').val();
       	        item ["layoutPainelVotacao"] = $('.layoutPainelVotacao').val();
       	        
       	        var id = $('.codigoCampanha').html();
       	        var method = "POST";
       	        var urlCustomizada = "#(host_api)/campanha/evento";
       	        
       	        if (id > 0) {
       	        	method = "PUT";
       	        	urlCustomizada="#(host_api)/campanha/evento/"+id;
       	        }
          	     event.preventDefault();
       	        //alert (method +  JSON.stringify(item) + urlCustomizada);
       	        $.ajax({
                   type: method,
                   url: urlCustomizada,
                   contentType: "application/json; charset=utf-8",
                   data: JSON.stringify(item),
                   success: function(data)
                   {
                   	$("#formCampanha").find(".btn-secondary").trigger('click');
	                   	Swal.fire({
		    	    		  title: "Sucesso",
		    	    		  text: "",
		    	    		  icon: "success",
		    	    		  timer: 1000,
		    				  timerProgressBar: true,
		    	    	});	
		    	    	
		    	    	carregarDadosDashboardEvento();	    	    	

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

	    
	    $(document).on("click", ".mostrarModalPesquisaCampanha", function(){

 			var cd = $(this).parents('.dadosEvento');
			var nomeEvento = cd.data("nomeevento");
			var idEvento = cd.data("id");
			var imagemurl = cd.data("imagemurl");
			var descricao = cd.data("descricao");
			
			$('#nomeCampanhaPergunta').attr("data-codevento", idEvento);
			$('#nomeCampanhaPergunta').data("codevento", idEvento);
			
			$(".nomeEvento").html(idEvento + " | "+nomeEvento);
			$(".descricaoEvento").html(descricao.substring(0, 200));
			$('.imagemUrl').attr("src", imagemurl);
			
			
			$(".linhaPesquisa").html('');
			$('#PesquisaModal').modal('show');
			atualizarTabelasPesquisa();
		});
        
        
         $(document).on("click", ".mostrarEstatisticas", function() {
	    	
	    	var dadosEvento = $(this).parents('.dadosEvento');
	    	
	    	var idEvento = dadosEvento.data('id');
		  	$(location).attr('href','dashboardevento?idEvento=' + idEvento);
		  
	    });
	    
	    
	    $(document).on("click", ".mostrarModalPublicar", function() {
			
			var cd = $(this).parents('.dadosEvento');
			var nomeEvento = cd.data("nomeevento");
			var idEvento = cd.data("id");
			var urlPublicacao = cd.data("urlpublicacao");
			var publicado = cd.data("publicado");
	    	$('.modalUtilGeralTitulo').html('Configurar publicacao');
	    	
	    	if (urlPublicacao.toLowerCase().indexOf("null") < 0){
		    	$('.dadosPublicacao').html(" " + urlPublicacao );
			} else {
		    	$('.dadosPublicacao').html(" ");
			}
	    	
	    	$('.dadosPublicacao').data('idevento', idEvento);
	    	$('.dadosPublicacao').data('urlpublicacao', urlPublicacao);
	    	$('.dadosPublicacao').attr('title', urlPublicacao);
    		
	    	$('.modalUtilGeralCabecalho').html("<strong>"+nomeEvento+"</strong>");
            $('.statusPublicar').prop( "checked", publicado );
 		    $('.statusPublicar').data('status', publicado);
			
	    	$('#modalPublicarEvento').modal('show');	    	
	    });
	    
	    
	    $(document).on("click", ".bi-copy", function() {
			
	    	var urlPublicacao = $(this).data("urlpublicacao");
			if (urlPublicacao.toLowerCase().indexOf("null") < 0){
		    	mostrarToastSucesso("Copiado !");
		    	navigator.clipboard.writeText(urlPublicacao);
		    	document.execCommand('copy');
			} else {
				$('.dadosPublicacao').html(" ");
			}
	    	
	    });
	    
	    $(document).on("click", ".statusPublicar", function() {
	    	var statusReal = $(this).data('status');
	    	
	    	var cd = $('.dadosPublicacao');
			var idEvento = cd.data("idevento");
			
				$.ajax({
		            type: "GET",
		            url: "#(host_api)/campanha/evento/publicar/status/"+ idEvento,	            
		            success: function(data)
		            {
					
						if ( data == true ) {
					
								Swal.fire({
					        	  title: "Deseja SUSPENDER a publicacao do evento ? ",
					        	  showDenyButton: true,
					        	  allowOutsideClick: false,
					        	  showCancelButton: false,
					        	  confirmButtonText: "Sim",
					        	  denyButtonText: "N&atilde;o"
					        	}).then((result) => {
					        	  if (result.isConfirmed) {
									  
									 publicarCampanha(idEvento, statusReal, false);
					        	  } else if (result.isDenied) {
					        		 $('.statusPublicar').prop( "checked", true);
									 $(this).data('status', 'true');
					              }
					            });
					    	} else if (data == false) {
					    		 Swal.fire({
					        	  title: "Deseja Publicar o evento ? ",
					        	  showDenyButton: true,
					        	  allowOutsideClick: false,
					        	  showCancelButton: false,
					        	  confirmButtonText: "Sim",
					        	  denyButtonText: "N&atilde;o"
					        	}).then((result) => {
					        	  if (result.isConfirmed) {
									  
									$('.statusPublicar').prop( "checked", true);
									 $(this).data('status', 'true');
									 
									 publicarCampanha(idEvento, statusReal, true);
					      	        
					        	  } else if (result.isDenied) {
					        		 $('.statusPublicar').prop( "checked", false );
									 $(this).data('status', 'false');
					              }
					            });
					    	} else {
								Swal.fire({
			            		  title: "Falha na operacao!",
			            		  text: data.responseJSON.message,
			            		  icon: "error"
			            		});
							}
			        }
		    });
	    
	    });
	    
	    
	     function publicarCampanha(idEvento, statusAtual, statusDesejado) {
	    	$.ajax({
	            type: "PUT",
	            url: "#(host_api)/campanha/evento/publicar/"+ idEvento + "/" + statusDesejado,
	            contentType: "application/json; charset=utf-8",
	            success: function(data)
	            {
	            	swal.close();            	

	            	 $('.statusPublicar').prop( "checked", data.publicado );
					 $(this).data('status', data.publicado);
					 
	            	if (data.publicado) {
		            	
		    	    	Swal.fire({
		    	    		  title: "Realizado",
		    	    		  text: "Publicacao efetivada",
		    	    		  icon: "success",
		    	    		  timer: 2000,
		    				  timerProgressBar: true,
		    	    		}); 
		            	
	            	} else {
		    	    	
		    	    	Swal.fire({
		    	    		  title: "Realizado",
		    	    		  text: "Publicacao SUSPENSA com sucesso!",
		    	    		  icon: "success",
		    	    		  timer: 2000,
		    				  timerProgressBar: true,
		    	    		}); 
	            	}
	            	
	            	carregarDadosDashboardEvento();	
	            },
	            error: function(data)
	            {
					
					$('.statusPublicar').prop( "checked", statusAtual);
					$(this).data('status', statusAtual);
					
	            	Swal.fire({
	            		  title:data.responseJSON.message,
	            		  text: "Falha na operacao",
	            		  icon: "error"
	            	});
	            }
	        });
	    	
	    }
});