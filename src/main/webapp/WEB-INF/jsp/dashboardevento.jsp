<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="head.jsp"%>
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

* {
  margin: 0;
  padding: 0;
}
#chart-container {
  position: relative;
  height: 100vh;
  overflow: hidden;
}


</style>

<style>
#chartdiv {
  width: 100%;
  height: 600px
}
</style>




<link href="jquery.orgchart.css" rel="stylesheet">




<!-- Resources -->
<script src="./local/map/index.js"></script>
<script src="./local/map/map.js"></script>
<script src="./local/map/worldLow.js"></script>
<script src="./local/map/Animated.js"></script>

<!-- Chart code -->
<script>
am5.ready(function() {

var data = [
	{
	    id: "BR",
	    name: "Brasil",
	    value: 100
	},
	  
	{
	    id: "CL",
	    name: "Chile",
	    value: 100
	},
	{
	    id: "AR",
	    name: "Argentina",
	    value: 100
	}
];

var root = am5.Root.new("chartdiv");
root.setThemes([am5themes_Animated.new(root)]);

var chart = root.container.children.push(am5map.MapChart.new(root, {}));

var polygonSeries = chart.series.push(
  am5map.MapPolygonSeries.new(root, {
    geoJSON: am5geodata_worldLow,
    exclude: ["AQ"]
  })
);

var bubbleSeries = chart.series.push(
  am5map.MapPointSeries.new(root, {
    valueField: "value",
    calculateAggregates: true,
    polygonIdField: "id"
  })
);

var circleTemplate = am5.Template.new({});

bubbleSeries.bullets.push(function(root, series, dataItem) {
  var container = am5.Container.new(root, {});
  
  var circle = container.children.push(
    am5.Circle.new(root, {
      radius: 20,
      fillOpacity: 0.7,
      fill: am5.color(0x00ff99),
      cursorOverStyle: "pointer",
      tooltipText: '{name}: [bold]{value}[/]',
      panX: "rotateX",
      wheelY: "none"
    }, circleTemplate)
  );

  var countryLabel = container.children.push(
    am5.Label.new(root, {
      text: "{name}",
      paddingLeft: 5,
      populateText: true,
      fontWeight: "bold",
      fontSize: 13,
      centerY: am5.p50
    })
  );

  circle.on("radius", function(radius) {
    countryLabel.set("x", radius);
  })

  return am5.Bullet.new(root, {
    sprite: container,
    dynamic: true
  });
});

bubbleSeries.bullets.push(function(root, series, dataItem) {
  return am5.Bullet.new(root, {
    sprite: am5.Label.new(root, {
      text: "{value.formatNumber('#.')}",
      fill: am5.color(0xffffff),
      populateText: true,
      centerX: am5.p50,
      centerY: am5.p50,
      textAlign: "center"
    }),
    dynamic: true
  });
});



// minValue and maxValue must be set for the animations to work
bubbleSeries.set("heatRules", [
  {
    target: circleTemplate,
    dataField: "value",
    min: 10,
    max: 50,
    minValue: 0,
    maxValue: 100,
    key: "radius"
  }
]);


bubbleSeries.data.setAll(data);

updateData();

function updateData() {
  for (var i = 0; i < bubbleSeries.dataItems.length; i++) {
    bubbleSeries.data.setIndex(i, { value: Math.round(Math.random() * 100), id: data[i].id, name: data[i].name })
  }
}


}); // end am5.ready()
</script>


<script src="https://fastly.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js"></script>
<script>
	$(document).ready(function(){
		
		
		$( ".am5-layer-30" ).remove();
		
		

// 		##########################################
// 		############Carregamento Principal #######
// 		##########################################
		 carregarDadosDashboard();
		 function carregarDadosDashboard() {
			$(".filtroPainelTotal").text('Total Geral');
	       	$(".aumentoVotosEvento").html('');
			var idEventoParam = (new URL(location.href)).searchParams.get('idEvento');
			
	        $.ajax({
	            type: "GET",
	            //url: "https://64acce2b9edb4181202fd445.mockapi.io/usuario/campanha",
	            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam,
	            success: function(data)
	            {
	       			$(".nomeEvento").html(data.nomeEvento );
        			$(".qtdVotosEvento").html( data.quantidadeVotos );
	            },
	            
	            error: function(data)
	            {
	            	console.log(JSON.stringify(data))
	            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
	            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
	            
	            }
	        });
		 }
		 
		 $(document).on("click", ".atividadeItemVotoPesquisa", function(){
			 $('#modalInformacao').modal('show');	
			 
			 var map = 
			   '<section class="map_section">'
			    +'<div class="map_container">'
			    +'<div class="map-responsive">'
			    +'  <iframe src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&q=_latitude_,_longitude_" width="600" height="300" frameborder="0" style="border:0; width: 100%; height:100%" allowfullscreen></iframe>'
			    +'  </div>'
			    +' </div>'
			    +'</section>';
			    
			    map = map.replaceAll("_latitude_", $(this).data("latitude"));
			    map = map.replaceAll("_longitude_", $(this).data("longitude"));
 	    	$('.modalInformacaoTitulo').html('Inform&ccedil;&atilde;o do Voto');
 	    	$('.modalInformacaoMensagem1').html("Pesquisado: " + $(this).data("pesquisado"));
 	    	$('.modalInformacaoMensagem2').html(map);
	     });
		 
		 carregarDadosDashboardAtividades();
		 function carregarDadosDashboardAtividades() {
	       	$(".listaAtividades").html('');
	       	$(".labelAtividadeOnline").html('Item Pesquisa | Online');
	       	
	       	var html = 
	       		
		     ' <div class="activity-item d-flex"> ' +
	         '   <div class="activite-label atividadeItemVotoTemp" title="_tempoEspecifico_">_tempo_</div>  ' +
	         '   <i class="bi bi-circle-fill _voto_ activity-badge align-self-start"></i>  ' +
	         '   <div class="activity-content">  ' +
	         '     <a ' +
	         '		data-latitude="_latitude_" data-longitude="_longitude_" ' +  
	         '		data-pesquisado="_nome_, _uf_, _sexo_" ' +  
	         '      href="#" class="fw-bold text-dark atividadeItemVotoPesquisa">_pesquisa_</a> <a class="atividadeItemVotoPesquisado"> (_nome_, _uf_, _sexo_) </a></div> ' +
	         ' </div>';
	         
	       	
			var idEventoParam = (new URL(location.href)).searchParams.get('idEvento');
	           $.ajax({
	            type: "GET",
	            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam+"/atividades/online",
	            success: function(data)
	            {
	            	$(".listaAtividades").html('');
	            	
	    			//alert(JSON.stringify(data))
	            	$.each(data, function(i, item) {	            		
	            			
	            		var temp = html;
						temp = temp.replaceAll("_tempo_", item.tempo);           	
						temp = temp.replaceAll("_tempoEspecifico_", item.tempoEspecifico);           	
						temp = temp.replaceAll("_pesquisa_", item.pesquisa);           	
						temp = temp.replaceAll("_nome_", item.nome);           	
						temp = temp.replaceAll("_uf_", item.uf);
						temp = temp.replaceAll("_sexo_", item.sexo);
						temp = temp.replaceAll("_latitude_", item.latitude);
						temp = temp.replaceAll("_longitude_", item.longitude);
						
						
						switch(item.voto) {
						  case 1:
							  temp = temp.replaceAll("_voto_", 'voto-1');
						    break;
						  case 2:
						    // code block
							  temp = temp.replaceAll("_voto_", 'voto-2');
						    break;
						  case 3:
						    // code block
							  temp = temp.replaceAll("_voto_", 'voto-3');
						    break;
						  case 4:
						    // code block
							  temp = temp.replaceAll("_voto_", 'voto-4');
						    break;
						  case 5:
							  temp = temp.replaceAll("_voto_", 'voto-5');
							 break;
						}
						
						
	        			$(".listaAtividades").append(temp);
		        		
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
		 function carregarDadosDashboardAtividadesMediaVoto() {
	       	$(".listaAtividades").html('');
			 $(".labelAtividadeOnline").html('Voto media pessoa | Online');
	       	
	       	var html = 
	       		
		     '   <div class="activity-item d-flex"> ' +
	         '   <div class="activite-label atividadeItemVotoTemp" title="_tempoEspecifico_">_tempo_</div>  ' +
	         '   <i class="bi bi-circle-fill _voto_ activity-badge align-self-start"></i>  ' +
	         '   <div class="activity-content">  ' +
	         '     <a href="#" class="fw-bold text-dark atividadeItemVotoPesquisa">_media_</a><a class="atividadeItemVotoPesquisado">(_nome_, _uf_, _sexo_)</a> <i class="bi bi-globe-americas"></i></div> ' +
	         ' </div>';
	       	
	       	
			var idEventoParam = (new URL(location.href)).searchParams.get('idEvento');
	           $.ajax({
	            type: "GET",
	            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam+"/atividades/online/media",
	            success: function(data)
	            {
	            	$(".listaAtividades").html('');
	            	
	    			//alert(JSON.stringify(data))
	            	$.each(data, function(i, item) {	            		
	            			
	            		var temp = html;
						temp = temp.replaceAll("_tempo_", item.tempo);           	
						temp = temp.replaceAll("_tempoEspecifico_", item.tempoEspecifico);           	
						temp = temp.replaceAll("_media_", item.mediaVotos);           	
						temp = temp.replaceAll("_nome_", item.nome);           	
						temp = temp.replaceAll("_uf_", item.uf);
						temp = temp.replaceAll("_sexo_", item.sexo);
						
						
						switch(item.mediaVotos) {
						  case 1:
							  temp = temp.replaceAll("_voto_", 'voto-1');
						    break;
						  case 2:
						    // code block
							  temp = temp.replaceAll("_voto_", 'voto-2');
						    break;
						  case 3:
						    // code block
							  temp = temp.replaceAll("_voto_", 'voto-3');
						    break;
						  case 4:
						    // code block
							  temp = temp.replaceAll("_voto_", 'voto-4');
						    break;
						  case 5:
							  temp = temp.replaceAll("_voto_", 'voto-5');
							 break;
						}
						
						
	        			$(".listaAtividades").append(temp);
		        		
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
		 
		 $(document).on("click", ".filtroPainelTotalVoto", function(){
			 
			 $(".filtroPainelTotal").html('Total Geral');
			 var idEventoParam = (new URL(location.href)).searchParams.get('idEvento');
		        $.ajax({
		            type: "GET",
		            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam,
		            success: function(data)
		            {
		       			$(".nomeEvento").html(data.nomeEvento );
	        			$(".qtdVotosEvento").html( data.quantidadeVotos );
	        			$(".aumentoVotosEvento").html('');
		            },
		            
		            error: function(data)
		            {
		            	console.log(JSON.stringify(data))
		            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
		            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
		            
		            }
		        });
          });
		        
		 $(document).on("click", ".filtroPainelHojeVoto", function(){
	            
			 $(".filtroPainelTotal").html('Hoje');
			 var idEventoParam = (new URL(location.href)).searchParams.get('idEvento');
		        $.ajax({
		            type: "GET",
		            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam+"/hoje",
		            success: function(data)
		            {
		       			$(".nomeEvento").html(data.nomeEvento );
	        			$(".qtdVotosEvento").html( data.quantidadeVotos );
		            },
		            
		            error: function(data)
		            {
		            	console.log(JSON.stringify(data))
		            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
		            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
		            
		            }
	          });
          });
		 
		 $(document).on("click", ".filtroPainelOntemVoto", function(){
	            
			 $(".filtroPainelTotal").html('Ontem');
			 var idEventoParam = (new URL(location.href)).searchParams.get('idEvento');
		        $.ajax({
		            type: "GET",
		            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam+"/ontem",
		            success: function(data)
		            {
		       			$(".nomeEvento").html(data.nomeEvento );
	        			$(".qtdVotosEvento").html( data.quantidadeVotos );
		            },
		            
		            error: function(data)
		            {
		            	console.log(JSON.stringify(data))
		            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
		            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
		            
		            }
		        });
          });
		        
		 $(document).on("click", ".filtroPainelUltimo7DiasVoto", function(){
	            
			 $(".filtroPainelTotal").html('Ultimos 7 dias');
			 var idEventoParam = (new URL(location.href)).searchParams.get('idEvento');
		        $.ajax({
		            type: "GET",
		            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam+"/ultimo7dias",
		            success: function(data)
		            {
		       			$(".nomeEvento").html(data.nomeEvento );
	        			$(".qtdVotosEvento").html( data.quantidadeVotos );
		            },
		            
		            error: function(data)
		            {
		            	console.log(JSON.stringify(data))
		            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
		            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
		            
		            }
		        });
          });
		 
		 $(document).on("click", ".filtroPainelUltimaAtividadeItemVoto", function(){
	            
			 carregarDadosDashboardAtividades();
         });
		 
		 $(document).on("click", ".filtroPainelUltimaAtividadeMediaVoto", function(){
			 carregarDadosDashboardAtividadesMediaVoto();
         });
		 
		 
		 
		 $(document).on("click", ".filtroGraficoBarraDia", function(){
			 carregarGraficoBarra("dia");
         });
		 $(document).on("click", ".filtroGraficoBarraMes", function(){
			 carregarGraficoBarra("mes");
         });
		 
		 $(document).on("click", ".filtroGraficoBarraAno", function(){
			 carregarGraficoBarra("ano");
         });
		 $(document).on("click", ".filtroGraficoBarraHora24", function(){
			 carregarGraficoBarra("hora24");
         });
		 $(document).on("click", ".filtroGraficoBarraHoraDia", function() {
			 
			 Swal.fire({
				  title: "Informe o dia",
				  input: "date",
				  inputAttributes: {
				    autocapitalize: "off"
				  },
				  showCancelButton: true,
				  confirmButtonText: "Aplicar",
				  showLoaderOnConfirm: true,
				  preConfirm: async (dataSelecionada) => {
				    try {
				    	if (dataSelecionada == "") {				    		
				        	return Swal.showValidationMessage("Informe uma data valida! "); 
				    	}
				    	
				    	return dataSelecionada;
				    } catch (error) {
				      Swal.showValidationMessage("ERRO : ${error}     ");
				    }
				  },
				  allowOutsideClick: () => !Swal.isLoading()
				}).then((result) => {
				  if (result.isConfirmed) {	
					  carregarGraficoBarra("hora24", result.value);					  
				  }
				});
         });
		 
		 carregarGraficoBarra("dia");
		 
         function carregarGraficoBarra(agrupamento, dataSelecionada) {
        
          var categoriesData = [];
   		  var seriesData = [];
   			var dataSelecionadaUrl = "";
   		  	if (dataSelecionada) {
   		  	     dataSelecionadaUrl = "/" + dataSelecionada;
   		  	}

   		  	// http://localhost:8081/campanha/dashboardevento/33/grafico/barra/hora24/2024-07-16


             var idEventoParam = (new URL(location.href)).searchParams.get('idEvento');
 		      $.ajax({
 		            type: "GET",
 		            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam+"/grafico/barra/"+agrupamento+""+dataSelecionadaUrl,
 		            success: function(data)
 		            {
 	        			categoriesData = [];
 	        			seriesData = [];
 	        			$.each(data, function(i, item) {	
 	        				categoriesData.push(item.dataVoto);
 	        				seriesData.push(item.qtdVotos);
 	        			});
 	        			
 	        			    $('#barChart').html('');
 	        			
 	        			    var options = {
 	        			          series: [{
 	        			          name: 'Votos registrados',
 	        			          data: seriesData
 	        			        }],
 	        			          chart: {
 	        			              height: 350,
 	        			              type: 'bar'
 	        			        },
 	        			        plotOptions: {
 	        			          bar: {
 	        			            borderRadius: 10,
 	        			            dataLabels: {
 	        			              position: 'top', // top, center, bottom
 	        			            },
 	        			          }
 	        			        },
 	        			        dataLabels: {
 	        			          enabled: true,
 	        			          formatter: function (val) {
 	        			            return val + "";
 	        			          },
 	        			          offsetY: -20,
 	        			          style: {
 	        			            fontSize: '12px',
 	        			            colors: ["#304758"]
 	        			          }
 	        			        },
 	        			        
 	        			        xaxis: {
 	        			          categories: categoriesData,
 	        			          position: 'top',
 	        			          labels: {
 	        			            format: 'dd-MM-yyyy'
 	        			          },
 	        			          axisBorder: {
 	        			            show: false
 	        			          },
 	        			          axisTicks: {
 	        			            show: false
 	        			          },
 	        			          crosshairs: {
 	        			            fill: {
 	        			              type: 'gradient',
 	        			              gradient: {
 	        			                colorFrom: '#D8E3F0',
 	        			                colorTo: '#BED1E6',
 	        			                stops: [0, 100],
 	        			                opacityFrom: 0.4,
 	        			                opacityTo: 0.5,
 	        			              }
 	        			            }
 	        			          },
 	        			          tooltip: {
 	        			            enabled: true,
 	        			          }
 	        			        },
 	        			        yaxis: {
 	        			          axisBorder: {
 	        			            show: false
 	        			          },
 	        			          axisTicks: {
 	        			            show: false,
 	        			          },
 	        			          labels: {
 	        			            show: true,
 	        			            formatter: function (val) {
 	        			              return val + "";
 	        			            },
  	        			            format: 'dd-MM-yyyy'
 	        			          }
 	        			        
 	        			        },
 	        			        title: {
 	        			          text: 'Votos registrados',
 	        			          floating: true,
 	        			          offsetY: 330,
 	        			          align: 'center',
 	        			          style: {
 	        			            color: '#444'
 	        			          }
 	        			        }
 	        			        };

 	        				    var chart = new ApexCharts(document.querySelector("#barChart"), options);
 	        			        chart.render();
	        		    
 		            
 		            
 		            },
 		            
 		            error: function(data)
 		            {
 		            	console.log(JSON.stringify(data))
 		            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
 		            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
 		            
 		            }
 		        });
 		      
         }	
         
         
         
         var dom = document.getElementById('chart-container');
         var myChart = echarts.init(dom, null, {
           renderer: 'canvas',
           useDirtyRect: false
         });
         var app = {};

         var option;

         option = {
        		  series: [
        		    {
        		      type: 'gauge',
        		      progress: {
        		        show: true,
        		        width: 18
        		      },
        		      axisLine: {
        		        lineStyle: {
        		          width: 18
        		        }
        		      },
        		      axisTick: {
        		        show: false
        		      },
        		      splitLine: {
        		        length: 15,
        		        lineStyle: {
        		          width: 2,
        		          color: '#999'
        		        }
        		      },
        		      axisLabel: {
        		        distance: 25,
        		        color: '#999',
        		        fontSize: 20
        		      },
        		      anchor: {
        		        show: true,
        		        showAbove: true,
        		        size: 25,
        		        itemStyle: {
        		          borderWidth: 10
        		        }
        		      },
        		      title: {
        		        show: false
        		      },
        		      detail: {
        		        valueAnimation: true,
        		        fontSize: 80,
        		        offsetCenter: [0, '70%']
        		      },
        		      data: [
        		        {
        		          value: 70
        		        }
        		      ]
        		    }
        		  ]
        		};
         
         setInterval(function () {
           myChart.setOption({
             series: [
               {
                 data: [
                   {
                     value: +(Math.random() * 100).toFixed(2)
                   }
                 ]
               }
             ]
           });
         }, 2000);

         if (option && typeof option === 'object') {
           myChart.setOption(option);
         }

         window.addEventListener('resize', myChart.resize);
		 
	});
</script>
<body>

	<%@include file="barra.jsp"%>

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">
		<%@include file="menu.jsp"%>
	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">
		<div class="pagetitle">
			<h1 class='tituloDashboard'>
				Dashboard <label class='nomeEvento_'></label>
				
			</h1>
			<br>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-8">
					<div class="row">

						<!-- Sales Card -->
						<div class="col-xxl-4 col-md-6">

							<!--             <div class="container-fluid"> -->
							<!-- 			   	 <div class="map-responsive"> -->
							<!-- 			   <iframe src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&q=Eiffel+Tower+Paris+France" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe> -->
							<!-- 			</div> -->
							<!-- 			</div> -->

							<div class="card info-card sales-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item filtroPainelTotalVoto"
											href="#">Total Geral</a></li>
										<li><a class="dropdown-item filtroPainelHojeVoto"
											href="#">Hoje</a></li>
										<li><a class="dropdown-item filtroPainelOntemVoto"
											href="#">Ontem</a></li>
										<li><a class="dropdown-item filtroPainelUltimo7DiasVoto"
											href="#">Ultimos 7 dias</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Votos <span>| </span> <span class="filtroPainelTotal">-</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-megaphone-fill"></i>
										</div>
										<div class="ps-3">
											<h6 class="qtdVotosEvento"></h6>
											<span
												class="text-success small pt-1 fw-bold aumentoVotosEvento">0%</span>
											<span class="text-muted small pt-2 ps-1">aumento</span>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Sales Card -->

						<!-- Revenue Card -->

						<!-- End Revenue Card -->

						<!-- Customers Card -->

						<!-- End Customers Card -->

						<!-- Reports -->
						<div class="col-12">

							<div class="card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Agrupamento</h6>
										</li>

										<li><a class="dropdown-item filtroGraficoBarraDia"
											href="#">Dia</a></li>
										<li><a class="dropdown-item filtroGraficoBarraMes"
											href="#">Mes</a></li>
										<li><a class="dropdown-item filtroGraficoBarraAno"
											href="#">Ano</a></li>
										<li><a class="dropdown-item filtroGraficoBarraHora24"
											href="#">Por hora 24</a></li>
										<li><a class="dropdown-item filtroGraficoBarraHoraDia"
											href="#">Horas do Dia</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">Votos por Periodo</h5>

									<!-- Bar Chart -->
<!-- 									<div id="_barChart" style="min-height: 400px;" class="echart_"></div> -->
									<div id="barChart"></div>

									<!-- End Bar Chart -->

								</div>
							</div>
							
							
							
							<div class="card">
					            <div class="card-body">
					              <h5 class="card-title"></h5>
					
					              <!-- Default Tabs -->
					              <ul class="nav nav-tabs d-flex" id="myTabjustified" role="tablist">
					                <li class="nav-item flex-fill" role="presentation">
					                  <button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" 
					                  data-bs-target="#home-justified" type="button" role="tab" 
					                  aria-controls="home" aria-selected="true">Por Perguntas</button>
					                </li>
					                <li class="nav-item flex-fill" role="presentation">
					                  <button class="nav-link w-100" id="profile-tab" data-bs-toggle="tab" 
					                  data-bs-target="#profile-justified" type="button" role="tab" 
					                  aria-controls="profile" aria-selected="false">Regiao</button>
					                </li>
					                <li class="nav-item flex-fill" role="presentation">
					                  <button class="nav-link w-100" id="contact-tab" data-bs-toggle="tab" 
					                  data-bs-target="#contact-justified" type="button" role="tab" 
					                  aria-controls="contact" aria-selected="false">Brasil</button>
					                </li>
					              </ul>
					              
					              <div class="tab-content pt-2" id="myTabjustifiedContent">
					                <div class="tab-pane fade show active" id="home-justified" role="tabpanel" aria-labelledby="home-tab">
					                  
											<div id="reportsChart"></div>

											<script>
                  
									                  var categoriesItem = [];
									        		  var seriesItem = [];
									        			
									                  var idEventoParam = (new URL(location.href)).searchParams.get('idEvento');
										  		      $.ajax({
										  		            type: "GET",
										  		            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam+"/grafico",
										  		            success: function(data)
										  		            {
										  		       			$(".nomeEvento").html(data.nomeEvento );
										  	        			$(".qtdVotosEvento").html( data.quantidadeVotos );
										  	        			
										  	        			categoriesItem = [];
										  	        			seriesItem = [];
										  	        			$.each(data.dataVoto, function(i, item) {	
										  	        				categoriesItem.push(item);
										  	        			});
										  	        			
										  	        			$.each(data.dadosDashboardEventoGraficoVotoPorDatas, function(i, item) {	
										  	        				
										  	        				
										  	        				var itemQualificador = {};
										  	        				itemQualificador.name = item.qualificador;
										  	        				itemQualificador.data = [];
																	
										  	        				$.each(item.listaVotos, function(i, item) {	
										  	        					itemQualificador.data.push(item.quantidadeVotos);
										  	        				});
										  	        				seriesItem.push(itemQualificador);
										  	        			});
										  	        			
										  	        			console.log(JSON.stringify(categoriesItem));
										  	        			console.log(JSON.stringify(seriesItem));
										  	        			
										  	        		  $('#reportsChart').html('');
										  	        			
										  	        			var options = {
										  	                        series: seriesItem,
										  	                        chart: {
										  	                          height: 350,
										  	                          type: 'area',
										  	                          toolbar: {
										  	                            show: true
										  	                          },
										  	                        },
										  	                        markers: {
										  	                          size: 5
										  	                        },
										  	                        colors: ['#444444', '#a90606', '#f1c232', '#4154f1', '#00b662'],
										  	                        fill: {
										  	                          type: "gradient",
										  	                          gradient: {
										  	                            shadeIntensity: 2,
										  	                            opacityFrom: 0.3,
										  	                            opacityTo: 0.4,
										  	                            stops: [0, 90, 1000]
										  	                          }
										  	                        },
										  	                        dataLabels: {
										  	                          enabled: false
										  	                        },
										  	                        stroke: {
										  	                          curve: 'smooth',
										  	                          width: 2
										  	                        },
										  	                        xaxis: {
										  	                          type: 'date',
										  	                          categories: categoriesItem
										  	                        },
										  	                        tooltip: {
										  	                          x: {
										  	                            format: 'yy-MM-dd'
										  	                          },
										  	                        }
										  	                      }
										  	        			 
										  	        			 
										  	        			 
										  	        			
										  	        			var reportsChart =  new ApexCharts(document.querySelector("#reportsChart"), options );
										  	        			reportsChart.render();
										  	        			
										  	        			
										  		            },
										  		            
										  		            error: function(data)
										  		            {
										  		            	console.log(JSON.stringify(data))
										  		            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
										  		            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
										  		            
										  		            }
										  		        });
									                  
					                    
					                  </script>


								</div>
					                <div class="tab-pane fade" id="profile-justified" role="tabpanel" aria-labelledby="profile-tab">
																	                 
												<div id="chartdiv"></div>
					                </div>
					                
					                
					                <div class="tab-pane fade" id="contact-justified" role="tabpanel" aria-labelledby="contact-tab">
					                 
									<div id="pieChart"></div>

									<script>
		              	              
						              var labelPieChart = [];
					        		  var seriesItemPieChart = [];
					        			
					                  var idEventoParam = (new URL(location.href)).searchParams.get('idEvento');
						  		      $.ajax({
						  		            type: "GET",
						  		            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam+"/grafico/pie",
						  		            success: function(data)
						  		            {
						  		            	
				// 		  		            	console.log(JSON.stringify(data));
						  	        			$.each(data, function(i, item) {	
						  	        				labelPieChart.push(item.estado);
						  	        				seriesItemPieChart.push(parseInt(item.soma));
						  	        			});
						  		            },
						  		            error: function(data)
						  		            {
						  		            	console.log(JSON.stringify(data))
						  		            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
						  		            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
						  		            
						  		            }
						  		        });
					                  
						              
						              
						                document.addEventListener("DOMContentLoaded", () => {
						                  new ApexCharts(document.querySelector("#pieChart"), {
						                    series: seriesItemPieChart,
						                    chart: {
						                      height: 300,
						                      type: 'pie',
						                      toolbar: {
						                        show: true
						                      },
						                    },
						                    labels: labelPieChart
						                  }).render();
						                });
						              </script>
					                  
					                  
					                </div>
					              </div><!-- End Default Tabs -->
					
					            </div>
					          </div>
							


							<div class="card">

<!-- 								<div class="filter"> -->
<!-- 									<a class="icon" href="#" data-bs-toggle="dropdown"><i -->
<!-- 										class="bi bi-three-dots"></i></a> -->
<!-- 									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow"> -->
<!-- 										<li class="dropdown-header text-start"> -->
<!-- 											<h6>Exporte</h6> -->
<!-- 										</li> -->

<!-- 										<li><a class="dropdown-item" href="#">PDF</a></li> -->
<!-- 										<li><a class="dropdown-item" href="#">HTML</a></li> -->
<!-- 									</ul> -->
<!-- 								</div> -->





							</div>

						</div>
						<!-- End Reports -->

						<!-- Top Selling -->

					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<div class="col-lg-4">

					<!-- Recent Activity -->
					<div class="card">

						<div class="filter">
							<a class="icon" href="#" data-bs-toggle="dropdown"><i
								class="bi bi-three-dots"></i></a>
							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
								<li class="dropdown-header text-start">
									<h6>Visualizacao</h6>
								</li>

								<li><a
									class="dropdown-item filtroPainelUltimaAtividadeItemVoto"
									href="#">Item voto</a></li>
								<li><a
									class="dropdown-item filtroPainelUltimaAtividadeMediaVoto"
									href="#">Voto media pessoa </a></li>
							</ul>
						</div>

						<div class="card-body">
							<h5 class="card-title">
								Ultimas atividades <span class="labelAtividadeOnline"></span>
							</h5>

							<div class="activity listaAtividades"></div>

						</div>
					</div>
					<!-- End Recent Activity -->
					
					<!-- Recent Activity -->
<!-- 					<div class="card"> -->

<!-- 						<div class="card-body"> -->

<!-- 							<div id="chart-container"></div> -->

<!-- 						</div> -->
<!-- 					</div> -->
					<!-- End Recent Activity -->

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Radar Votacao - Geral</h5>

							<!-- Radar Chart -->
							<div id="radarChart"></div>

							<script>
	              
				              var categoriesItemRadar = [];
			        		  var seriesItemRadar = [];
			        			
			                  var idEventoParam = (new URL(location.href)).searchParams.get('idEvento');
				  		      $.ajax({
				  		            type: "GET",
				  		            url: "${urlApi}/campanha/dashboardevento/"+idEventoParam+"/grafico/radar",
				  		            success: function(data)
				  		            {
				  		            	categoriesItemRadar = [];
				  		            	seriesItemRadar = [];
				  	        			
				  	        			var seriesItemDataRadar = {};
				  	        			seriesItemDataRadar.name = 'Total Votos';
				  	        			seriesItemDataRadar.data = [];
				  	        			
				  	        			
				  	        			$.each(data, function(i, item) {	
				  	        				seriesItemDataRadar.data.push(item.soma);
				  	        				categoriesItemRadar.push(item.pesquisa);
				  	        			});
				  	        			
				  	        			seriesItemRadar.push(seriesItemDataRadar);
				  	        			
			// 	  	        			console.log(JSON.stringify(categoriesItem));
			// 	  	        			console.log(JSON.stringify(seriesItem));
				  	        			
				  		            },
				  		            
				  		            error: function(data)
				  		            {
				  		            	console.log(JSON.stringify(data))
				  		            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
				  		            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
				  		            
				  		            }
				  		        });
				  		      
				  		      
				  		    	document.addEventListener("DOMContentLoaded", () => {
				                  new ApexCharts(document.querySelector("#radarChart"), {
				                	  
				                	  stroke: {
				                		    show: true,
				                		    width: 2,
				                		    colors: [],
				                		    dashArray: 0
				                		  },
				                	series: seriesItemRadar,	                      
				                    chart: {
				                      height: 350,
				                      type: 'radar'
				                    },
				                    xaxis: {
				                      categories: categoriesItemRadar,
				                      labels: {
				                    	  show: true,
				                    	  style: {
				                    	    colors: ["#a8a8a8"],
				                    	    fontSize: "11px",
				                    	    fontFamily: 'Arial'
				                    	  }
				                    	}
				                    },
				                    dataLabels: {
				                    	  enabled: true,
				                    	  background: {
				                    	    enabled: true,
				                    	    borderRadius:2,
				                    	  }
				                    	}
				                  }).render();
				                });
				                
				              </script>
							<!-- End Radar Chart -->

						</div>
					</div>

				</div>
				<!-- End Right side columns -->

			</div>
		</section>

	</main>
	<!-- End #main -->

	<%@include file="modal.jsp"%>

	<!-- ======= Footer ======= -->
	<%@include file="footer.jsp"%>


	<div class="modal fade " id="modalDialogo" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title modalDialogoTitulo"></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body modalDialogoPerguntaCabecalho"></div>
				<div class="modal-body modalDialogoPergunta"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary executarSim">Sim</button>
					<button type="button" class="btn btn-secondary executarNao"
						data-bs-dismiss="modal">Nao</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal Dialog Scrollable-->

	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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