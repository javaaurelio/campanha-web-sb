<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="head.jsp" %>  
</head>
  
  <script>
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
    		 '<i class="bi bi-arrow-bar-up pesquisaUP"></i>'
    		 +'<i class="bi bi-arrow-bar-down pesquisaDOWN"></i>'
    	     +' <i class="bi bi-trash deleteItem"></i>'
    	     +'';
        
       var row =     	   
		    '<tr data-id="_id_">'
		    +'   <th scope="row" style="width: 5%">_id_</th>'
		   + '   <td data-imagemurl="_imagemUrl_">_campanha_ </td>'
		   
		    +'   <td data-datainicio="_dtInicio_" data-datafim="_dtFim_" style="width:15%">_dtInicio_ \u00E0 _dtFim_'
		    
		   	+ '<div class="progress">'
		   	+ '<div class="progress-bar _statusPorcentagemdias_" role="progressbar" style="width: _porcentagemDias_%">_porcentagemDias_%</div>'
		   	+ '</div>'
		   	+ '</td>'
		   	
		   	
		    +'   <td class="text-center" style="width: 5%" >'
				    +'<div class="form-check form-switch">'
				    +'<input class="form-check-input publicar" type="checkbox" id="flexSwitchCheckChecked__id_" _publicado_>'
				    +'<div class="spinner-border  text-success spinner-border-sm iconpublicacao__id_" role="status" style="visibility: _visivel_">'
				    +'<span class="visually-hidden">Loading...</span>'
				    +'</div>'
				    +'<i class="bi bi-speedometer mostrarDashboard"></i>'
				    +'<i class="bi bi-tv mostrarPainelVotacao" title="Visualizar painel de votacao"></i>'
				    +'</div>'
		    +'</td>'
		    +'   <td class="text-center" style="width: 5%"><i class="bi bi-search-heart eventoIcon" id=\'mostrarModalPesquisaCampanha\' "></i> 	</td>'
		    +'   <td class="text-center" style="width: 5%">                    	  '
		    +'		  <i class="bi bi-pencil editarItemCampanha"></i>'
		    +'        <i class="bi bi-trash deleteItemCampanha"></i>	'					
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
          
          
       var rowPesquisaPainelVotacao =           
        '  <tr data-codpesquisa="_codpesquisa_" >' +
	    '    <td style="width: 50%" data-codpesquisa="_codpesquisa_" data-voto="" class="table table-bordered border-primary tabelaPerguntas">_pesquisa_' +
	    '    </td>' +
	    '    <td style="width: 50%">' +	rating +				        
	    '    </td>' +
	    ' </tr> ';

	    $(document).on("click", ".pesquisaUP", function(){

            var id = $(this).parents("tr").data("codpesquisa");
                        
            var method = "PUT";
   	        var	urlCustomizada="${urlApi}/campanha/pesquisa/ordem/"+id+"/up";

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
   	        var	urlCustomizada="${urlApi}/campanha/pesquisa/ordem/"+id+"/down";

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
	    	
	    	 var idEvento = $(this).parents("tr").find('th').eq(0).html();
	         var campanha = $(this).parents("tr").find('td').eq(0).html();
	    	$('#modalDialogo').modal('show');	    	
	    	
	    	$('.modalDialogoPerguntaCabecalho').data("idObject", idEvento);
    		$('.modalDialogoPerguntaCabecalho').data("eventoCustomizado", "deleteItemCampanhaSim");
    		
	    	$('.modalDialogoTitulo').html('Deletar campanha');
	    	$('.modalDialogoPerguntaCabecalho').html("<strong>"+campanha+"</strong>");
    		$('.modalDialogoPergunta').html('Deseja excluir a campanha ?');	
	    });
	    
	    
	    $(document).on("deleteItemCampanhaSim", function(event, idObject) {
            
//             var id = $(this).parents("tr").find('th').eq(0).html();
            var id = idObject;
            var campanha = $(this).parents("tr").find('td').eq(0).html();
			
   	        var method = "DELETE";
   	        var	urlCustomizada="${urlApi}/campanha/evento/"+id;
   	        //alert (method +  JSON.stringify(id) + urlCustomizada);
   	        $.ajax({
               type: method,
               url: urlCustomizada,
               success: function(data)
               {
        	       	$("#popupCampanhaMsgSucesso").html("Excluido com sucesso!");
            		$("#popupCampanhaSucesso").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
               		atualizarTabela();
               },
               
               error: function(data)
               {
	               	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
    	           	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
               }
           });
   	        
   	     
            
        });
		    
	    $('.btNovaCampanha').on('click', function (event, param) {
    		if (param=='edicao') {
    			$("#formCampanha").find(".btn-primary").html('Atualizar');
    		} else {
		    	$("#formCampanha").find(".btn-primary").html('Salvar');
		    	$("#formCampanha")[0].reset();
		    	$(".codigoCampanha").html('0');
    		}
	    });
	    
// 	    $('#ExtralargeModal').on('show.bs.modal', function (event) {
// 	    });


		// #################################################################
		// #################################################################
		// ##################   Mostrar modal da PESQUISA ###################
		// #################################################################
		// #################################################################
		$(document).on("click", "#mostrarModalPesquisaCampanha", function(){

			var idEvento = $(this).parents('tr').find('th').eq(0).html();
			
			$('#nomeCampanhaPergunta').html(
					idEvento + " - " + $(this).parents('tr').find('td').eq(0).html());
			
			$('#nomeCampanhaPergunta').attr("data-codevento", idEvento);
			$('#nomeCampanhaPergunta').data("codevento", idEvento);
			$(".linhaPesquisa").html('');
			$('#PesquisaModal').modal('show');
			atualizarTabelasPesquisa();
		});
		
		function atualizarTabelasPesquisa() {
			
			var idEvento = $('#nomeCampanhaPergunta').data("codevento");
			var qtdPesquisas = 0;
			$.ajax({
	            type: "GET",
	            url: "${urlApi}/campanha/pesquisa/"+idEvento,
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
	            	});
	            },
	            
	            error: function(data)
	            {
// 	            	console.log(JSON.stringify(data))
// 	            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
// 	            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
	            
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
	            url: "${urlApi}/campanha/pesquisa/"+idEvento,
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
//	    	$('#painelVotacao').modal('show');
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
                url: "${urlApi}/campanha/voto",
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
     	
        
	    
	    function publicarCampanha(idEvento, statusAtual, statusDesejado) {
	    	
	    	$.ajax({
	            type: "PUT",
	            url: "${urlApi}/campanha/evento/publicar/"+ idEvento + "/" + statusDesejado,
                data: "",
	            success: function(data)
	            {
	            	document.getElementById("flexSwitchCheckChecked_"+idEvento).checked = statusDesejado;
	            	if (statusDesejado) {
	            	
	            		$("#popupCampanhaMsgSucesso").html("Publicado com sucesso ! ");
		            	$("#popupCampanhaSucesso").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
		            	
		            	
		            	// Mostrar Modal Informacao
		            	$('#modalInformacao').modal('show');
		    	    	$('.modalInformacaoTitulo').val('Publicacao de campanha');
		    	    	$('.modalInformacaoMensagem1').html("Link painel votacao publica:");
		    	    	$('.modalInformacaoMensagem2').html(data);
		    	    	
		    	    	$('.iconpublicacao_'+idEvento).css('visibility', 'visible');
		            	// Mostrar Modal Informacao
		            	
	            	} else {
	            		$('.iconpublicacao_'+idEvento).css('visibility', 'hidden');
	            		$("#popupCampanhaMsgAlerta").html("Publicacao SUSPENSA com sucesso ! ");
		            	$("#popupCampanhaAlerta").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
	            	}
	            },
	            error: function(data)
	            {
	            	document.getElementById("flexSwitchCheckChecked_"+idEvento).checked = statusAtual;
	            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
	            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
	            
	            }
	        });
	    	
	    }
	    
	    
	    //
	    //
	    // ################################################
	    // ###############   EDITAR EVENTO  ###############  
	    // ################################################
	    $(document).on("click", ".editarItemCampanha", function(){
	    	
           //	$("#formCampanha :input[name='codigoCampanha']").val( $(this).parents("tr").find('th').eq(0).html() );
           	$("#formCampanha").find(".btn-primary").html('Atualizar');
           	$(".codigoCampanha").html( 	$(this).parents("tr").find('th').eq(0).html() );
           	
           	$("#formCampanha :input[name='campanha']").val( $(this).parents("tr").find('td').eq(0).html());
           	
           	
           	var datainicio = $(this).parents("tr").find('td').eq(1).data('datainicio');
           	$("#formCampanha :input[name='dataInicio']").val( datainicio.split("/").reverse().join("-") );
           	
           	var datafim = $(this).parents("tr").find('td').eq(1).data('datafim');
           	$("#formCampanha :input[name='dataFim']").val( datafim.split("/").reverse().join("-") );
           	
           	var src = $(this).parents('tr').find('td[data-imagemurl]').data('imagemurl');           	
           	$("#formCampanha :input[name='imagemUrl']").val( src );
           	
           	$('.btNovaCampanha').trigger('click', 'edicao');
        });
	    
	    //setTimeout(atualizarTabela, 3000);
	    
	    atualizarTabela();
	    function atualizarTabela() {
	    	$("#dadosEventosLinhas").html('');
	        $.ajax({
	            type: "GET",
	            url: "${urlApi}/campanha/evento",
	            success: function(data)
	            {
	            	$.each(data.content, function(i, item) {
						var temp = row;
						temp = temp.replaceAll("_id_", item.id);           	
						temp = temp.replaceAll("_campanha_", item.campanha);           	
						temp = temp.replaceAll("_dtInicio_", item.dataInicio);           	
						temp = temp.replaceAll("_dtFim_", item.dataFim);
						temp = temp.replaceAll("_imagemUrl_", item.imagemUrl);
						temp = temp.replaceAll("_porcentagemDias_", item.porcentagemDias);
						
						if (item.porcentagemDias >= 80 && item.porcentagemDias < 90) {
							temp = temp.replaceAll("_statusPorcentagemdias_", "bg-warning");
						} else if (item.porcentagemDias >= 90) {
							temp = temp.replaceAll("_statusPorcentagemdias_", "bg-danger");
						}
						
						
						if (item.publicado === true) {
							temp = temp.replaceAll("_publicado_", "checked");
							temp = temp.replaceAll("_visivel_", "visible");  
							
						} else {
							temp = temp.replaceAll("_publicado_", "");
							temp = temp.replaceAll("_visivel_", "hidden");
						}
						
	        			$("#dadosEventosLinhas").append(temp);
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
        
        
    	     
        
     	// ######################################################
     	// ######################################################
     	// ##################Salvar Pesquisa ####################
     	// ######################################################
     	// ######################################################
     	
        $(".salvarPesquisa").click(function(){
        	
    		//var index = $(".linhaPesquisa").find('tr').index();
    		//var index = $(".linhaPesquisa tbody tr:last-child").index();
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
    	    //	alert(JSON.stringify(dadosPesquisa))
    	    	
                $.ajax({
                    type: "POST",
                    url: "${urlApi}/campanha/pesquisa",
                    data: JSON.stringify(dadosPesquisa),
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
    	    	$("#textoPesquisa").val('');
            }
   	
        });
     	
     	
     	// #########################################################
     	// ##################   DELETAR PESQUISA ###################
     	// #########################################################
        $(document).on("click", ".deleteItem", function(){
        	
        	var id = $(this).parents("tr").data("codpesquisa");
	    	$('#modalDialogo').modal('show');
	    	
    		$('.modalDialogoPergunta').html('Deseja excluir a pesquisa ?');	
	    	
	    	$('.modalDialogoTitulo').html('Excluir pesquisa');
	    	$('.modalDialogoPerguntaCabecalho').data("idObject", id);
	    	$('.modalDialogoPerguntaCabecalho').data("eventoCustomizado", "deleteItemPesquisa");
	    	$('.modalDialogoPerguntaCabecalho').html("<strong>"+$(this).parents('tr').find('td').eq(1).html()+"</strong>");
        	
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
        	//$(this).parents("tr").remove();
            
            $("#qtdPesquisa").html($(".linhaPesquisa tr").length);
            var id = $(this).parents("tr").data("codpesquisa");
            
            var method = "DELETE";
   	        var	urlCustomizada="${urlApi}/campanha/pesquisa/"+idObject;

   	        //alert (method +  JSON.stringify(id) + urlCustomizada);
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
       	        var id = $('.codigoCampanha').html();

       	        var method = "POST";
       	        //var urlCustomizada = "https://64acce2b9edb4181202fd445.mockapi.io/usuario/campanha";
       	        var urlCustomizada = "${urlApi}/campanha/evento";
       	        
       	        if (id > 0) {
       	        	method = "PUT";
//       	        	urlCustomizada="https://64acce2b9edb4181202fd445.mockapi.io/usuario/campanha/"+id;
       	        	urlCustomizada="${urlApi}/campanha/evento/"+id;
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
                    //console.log(JSON.stringify(data))
                   	$("#formCampanha").find(".btn-secondary").trigger('click');
                   	atualizarTabela();
                   	
                    
                   // $("#popupCampanhaMsgSucesso").html("Sucesso");
                   	$("#popupCampanhaSucesso").fadeIn('fade').animate({opacity: 2.0}, 1500).effect("fade", { times: 1}, 10).fadeOut('fade');
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

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    

        <%@include file="menu.jsp" %>
        

  </aside><!-- End Sidebar-->

  <main id="main" class="main">
		  
	  <div class="pagetitle">
      <h1>Campanha</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Forms</li>
          <li class="breadcrumb-item active">Validation</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    
    
    <!-- Small Modal Painel Votacao -->
       <div class="modal fade" id="smallModalVotacao" tabindex="-1">
         <div class="modal-dialog ">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title">Votação</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
                    <div class="col-md-12">
					  <table class="table border-primary tabelaPerguntas" >
		                <tbody class="linhaPesquisaPainelVisualizacao">	
		                					                                   
		                </tbody>
		              </table>				
               	 </div>
               
             </div>
             <div class="modal-footer">
               <button type="button" class="btn btn-secondary" id="salvarVotar" data-bs-dismiss="modal">FECHAR</button>
             </div>
           </div>
         </div>
       </div><!-- End Small Modal-->
    
    

    <section class="section">
      <div class="card">
            <div class="card-body">
              <h5 class="card-title">Campanhas</h5>
              
              <!-- Extra Large Modal -->
               
			<div class="row">
				  <div class="col-xs-6 col-md-4">
				  <button type="button" class="btn btn-primary btNovaCampanha" data-bs-toggle="modal" data-bs-target="#ExtralargeModal">
                     Nova campanha
   	              </button>
				  
			  </div>
			</div>
                 
              <div class="modal fade" id="ExtralargeModal" tabindex="-1" >
                <div class="modal-dialog modal-xl">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Cadastro de Evento</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      
                      <div class="col-lg-13">
                      
					          <div class="card">
					            <div class="card-body">
					              <h5 class="card-title">Eventos</h5>
					              <p>For custom Bootstrap form validation messages, youâll need to add the <code>novalidate</code> boolean attribute to your <code>&lt;form&gt;</code>. This disables the browser default feedback tooltips, but still provides access to the form validation APIs in JavaScript. </p>
								
<!-- 								<div id="popupCampanhaErro" class="modal fade " data-bs-backdrop="static" role="dialog"  -->
<!-- 								style="text-align: center; z-index: 100; "> -->
<!-- 								  <div class="modal-dialog" > -->
<!-- 								    Modal content -->
<!-- 								    <div class="modal-content" style="border-style: hidden; background-color: transparent;"> -->
<!-- 								      <div class="modal-body"> -->
<!-- 								      	  <div class="alert alert-danger alert-dismissible fade show" role="alert"> -->
<!-- 							                <i class="bi bi-exclamation-octagon me-1"></i> -->
<!-- 							                <span id="popupCampanhaMsgErro">Erro</span> -->
<!-- 							              </div> -->
<!-- 								      </div>       -->
<!-- 								    </div> -->
<!-- 								  </div> -->
<!-- 								</div> -->
					              
					              <!-- Custom Styled Validation -->
					              <form id="formCampanha" class="row g-3 needs-validation" novalidate>
					              
					                <div class="col-md-4">
					                  <label for="validationCustom01" class="form-label">Campanha </label>
					                 <div class="input-group col-md-4">
                      				  <span class="input-group-text codigoCampanha"></span>
					                  <input type="text" class="form-control" id="validationCustom01" name="campanha" value="" required>
					                  <div class="valid-feedback">
					                    Looks good!
					                  </div>
					                </div>
					                </div>
					               					                
					                <div class="col-md-2">
					                  <label for="validationCustom02" class="form-label">Data Evento</label>
					                  <input type="date" class="form-control" id="validationCustom03" required name="dataInicio">
					                  <div class="invalid-feedback">
					                    Informe uma data valida.
					                  </div>
					                </div>
					                <div class="col-md-2">
					                  <label for="validationCustom03" class="form-label">Data Fim Evento</label>
					                  <input type="date" class="form-control" id="validationCustom03" required name="dataFim">
					                  <div class="invalid-feedback">
					                    Informe uma data valida.
					                  </div>
					                </div>
					                <div class="col-12">
					                  <label for="validationCustom01" class="form-label">Imagem(URL) </label>
					                 <div class="input-group col-md-4">
                      				  <span class="input-group-text ">@</span>
					                  <input type="text" class="form-control" id="validationCustom01" name="imagemUrl" value="" required>
					                  <div class="valid-feedback">
					                    Looks good!
					                  </div>
					                </div>
					                </div>
					                
					                
					                <div class="modal-footer">
				                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
				                      <button class="btn btn-primary" type="submit">Salvar</button>
				                    </div>
					                
					                
					              </form><!-- End Custom Styled Validation -->
					
					            </div>
					          </div>
					        </div>
                    
                    
                    </div>
                    
<!--                     <div class="modal-footer"> -->
<!--                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
<!--                       <button type="button" class="btn btn-primary">Save changes</button> -->
<!--                       <button class="btn btn-primary" type="submit">Submit form</button> -->
<!--                     </div> -->
                    
                    
                  </div>
                </div>
              </div><!-- End Extra Large Modal-->
              
              
              
              <div class="modal fade" id="painelVotacao" tabindex="-1">
              
                <div class="modal-dialog modal-xl">
                  <div class="modal-content">
                    <div class="modal-header">
                    
                    <h5 class="modal-title">Votacao</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body">
                      <div class="col-lg-13">

					          <div class="card">
					            <div class="card-body">
					              <h5 class="card-title">Votacao</h5>
					              <h6 data-codevento=""></h6>
					              
					
					              <!-- Custom Styled Validation -->
				                     <div class="col-md-12">
									
									
									  <table class="table border-primary tabelaPerguntas" >
						                <tbody class="linhaPesquisaPainelVisualizacaoOld">	
						                					                                   
						                </tbody>
						              </table>				
			                    		   
				               	 </div>
					                <div class="modal-footer">
					           			<button type="button" class="btn btn-secondary" id="salvarVotarOld" data-bs-dismiss="modal">VOTAR</button>
				                    </div>
					
					            </div>
					          </div>
					        </div>
                    </div>
                    
<!--                     <div class="modal-footer"> -->
<!--                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
<!--                       <button type="button" class="btn btn-primary">Save changes</button> -->
<!--                       <button class="btn btn-primary" type="submit">Submit form</button> -->
<!--                     </div> -->
                    
                    
                  </div>
                </div>
              </div><!-- End Extra Large Modal PESQUISA-->
              
              
              

              <div class="modal fade" id="PesquisaModal" tabindex="-1">
              
                <div class="modal-dialog modal-xl">
                  <div class="modal-content">
                    <div class="modal-header">
                    
                    <h5 class="modal-title">Cadastros de pesquisa</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body">
                      <div class="col-lg-13">

					          <div class="card">
					            <div class="card-body">
					              <h5 class="card-title" >Evento</h5>
					              <h6 data-codevento="" id="nomeCampanhaPergunta">................</h6>
					              
					
					              <!-- Custom Styled Validation -->
					              <form class="row g-3 needs-validation" novalidate>
					              
					                     <div class="col-md-12">
	    				                 	<label for="validationCustom01" class="form-label">Pergunta</label>	    				                
						                    <div class="row">
											  <div class="col-md-8" style="padding-left: 5px; padding-right: 5px;">
											      <div class="input-group">
							                 	    <input type="text" class="form-control" id="textoPesquisa" value="" required>							                  
							                  		<span class="input-group-text" id="addonTextoPesquisa" >?</span>
							                  		<button type="button" class="btn btn-info salvarPesquisa" style=""> Salvar</button>
						                    	 </div>
						                    	
											 	
											 </div> 
									  		</div>
				                    			                    
				                    		<div class="row">
						                    	<div class="col-md-7">
						                    	<br>						                  
 								                  <div id="center" class="rating">
													  <span class="fa fa-star" id="star5"></span>
													  <span class="fa fa-star" id="star4"></span>
													  <span class="fa fa-star" id="star3"></span>
													  <span class="fa fa-star" id="star2"></span>
													  <span class="fa fa-star" id="star1"></span>
												  </div> 
												  </div>
												  
							                </div>
					                </div>
					                
					                <!-- End Custom Styled Validation -->
						                  
					                  <!-- Bordered Table -->
						              <table class="table table-bordered border-primary tabelaPerguntas" >
						                <thead>
						                  <tr>
						                    <th scope="col" class="text-center" style="width: 1%">#</th>
						                    <th scope="col">Pergunta</th>
						                    <th scope="col" class="text-center" style="width: 7%">Acoes</th>
						                  </tr>
						                </thead>
						                <tbody class="linhaPesquisa">						                                   
						                </tbody>
						              </table>
						              <!-- End Bordered Table -->
						                  
						                <div class="col-12">
						                	<span>Qtd:</span><span id="qtdPesquisa">0</span>
						                </div>					                

					                </form>
					                
					                <div class="modal-footer">
					           			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
				                    </div>
					
					            </div>
					          </div>
					        </div>
                    
                    
                    </div>
                    
<!--                     <div class="modal-footer"> -->
<!--                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
<!--                       <button type="button" class="btn btn-primary">Save changes</button> -->
<!--                       <button class="btn btn-primary" type="submit">Submit form</button> -->
<!--                     </div> -->
                    
                    
                  </div>
                </div>
              </div><!-- End Extra Large Modal PESQUISA-->
            </div>
            
            
            
            <div class="card-body">
              <h5 class="card-title">Eventos</h5>
              <!-- Bordered Table -->
              <table class="table table-bordered border-primary" id="dadosEventos">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Evento</th>
                    <th scope="col">Data</th>
                    <th scope="col">Gestao</th>
                    <th scope="col">Pesquisas</th>
                    <th scope="col">Acoes</th>
                  </tr>
                </thead>
                <tbody id="dadosEventosLinhas">
                                   
                </tbody>
              </table>
              <!-- End Bordered Table -->
          </div>
      </div>
    </section>
    

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  
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
	
  <div id="popupCampanhaAlerta" class="modal modalBackground" data-bs-backdrop="static" role="dialog">
	  <div class="modal-dialog " >
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
	
  <div id="popupCampanhaErro" class="modal modalBackground" data-bs-backdrop="static" role="dialog">
	  <div class="modal-dialog" >
	    <!-- Modal content-->
	    <div class="modal-content" style="border-style: hidden; background-color: transparent;">
	      <div class="modal-body">
	      	  <div class="alert alert-danger" role="alert">
                <i class="bi bi-check-circle me-1"></i>
                <span id="popupCampanhaMsgErro">Erro</span>
              </div>
	      </div>      
	    </div>
	  </div>
	</div>
	
	
	<div class="modal fade " id="modalDialogo" tabindex="-1">
     <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title modalDialogoTitulo"></h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body modalDialogoPerguntaCabecalho">
         </div>
         <div class="modal-body modalDialogoPergunta">
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-primary executarSim">Sim</button>
           <button type="button" class="btn btn-secondary executarNao" data-bs-dismiss="modal">Nao</button>
         </div>
       </div>
     </div>
   </div><!-- End Modal Dialog Scrollable-->
   
   
   <div class="modal fade" id="modalInformacao" tabindex="-1">
       <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modalInformacaoTitulo"><strong>Informacao</strong></h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modalInformacaoMensagem1">             
           </div>
           <br>
           <div class="modalInformacaoMensagem2">             
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
           </div>
         </div>
       </div>
     </div>
   
  
  <%@include file="footer.jsp" %>

 <!-- ======= Footer ======= -->
 
 
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>