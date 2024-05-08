<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="head.jsp" %>  
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
  </style>
  

<script>
	$(document).ready(function(){

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
		 
		 carregarDadosDashboardAtividades();
		 function carregarDadosDashboardAtividades() {
	       	$(".listaAtividades").html('');
	       	$(".labelAtividadeOnline").html('Item Pesquisa | Online');
	       	
	       	var html = 
	       		
		     '  <div class="activity-item d-flex"> ' +
	         '   <div class="activite-label atividadeItemVotoTemp" title="_tempoEspecifico_">_tempo_</div>  ' +
	         '   <i class="bi bi-circle-fill _voto_ activity-badge align-self-start"></i>  ' +
	         '   <div class="activity-content">  ' +
	         '     <a href="#" class="fw-bold text-dark atividadeItemVotoPesquisa">_pesquisa_</a> <a class="atividadeItemVotoPesquisado"> (_nome_, _uf_, _sexo_) </a></div> ' +
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
	         '     <a href="#" class="fw-bold text-dark atividadeItemVotoPesquisa">_media_</a><a class="atividadeItemVotoPesquisado">(_nome_, _uf_, _sexo_) </a></div> ' +
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
		 
		 
		 
	});
</script>		
<body>

  <%@include file="barra.jsp" %>

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="/dashboard">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->
      
      
      <li class="nav-item">
        <a class="nav-link " href="/campanha">
          <i class="bi bi-grid"></i>
          <span>Cadastro</span>
        </a>
      </li><!-- End Dashboard Nav -->

      
      


  </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1 class='tituloDashboard'>Dashboard   <label class='nomeEvento'></label></h1> <br>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item filtroPainelTotalVoto" href="#">Total Geral</a></li>
                    <li><a class="dropdown-item filtroPainelHojeVoto" href="#">Hoje</a></li>
                    <li><a class="dropdown-item filtroPainelOntemVoto" href="#">Ontem</a></li>
                    <li><a class="dropdown-item filtroPainelUltimo7DiasVoto" href="#">Ultimos 7 dias</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Votos <span>| </span> <span class="filtroPainelTotal">-</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-megaphone-fill"></i>
                    </div>
                    <div class="ps-3">
                      <h6 class="qtdVotosEvento"></h6>
                      <span class="text-success small pt-1 fw-bold aumentoVotosEvento">0%</span> <span class="text-muted small pt-2 ps-1">aumento</span>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            
            <!-- End Revenue Card -->

            <!-- Customers Card -->
            
            <!-- End Customers Card -->

            <!-- Reports -->
            <div class="col-12">
              <div class="card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Exporte</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">PDF</a></li>
                    <li><a class="dropdown-item" href="#">HTML</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Data<span> / </span></h5>

                  <!-- Line Chart -->
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
	  	        			
	  		            },
	  		            
	  		            error: function(data)
	  		            {
	  		            	console.log(JSON.stringify(data))
	  		            	$("#popupCampanhaMsgErro").html("Erro ! " + data.status);
	  		            	$("#popupCampanhaErro").fadeIn('slow').animate({opacity: 1.0}, 900).effect("scale", { times: 1 }, 900).fadeOut('slow');
	  		            
	  		            }
	  		        });
                  
                    document.addEventListener("DOMContentLoaded", () => {
                      new ApexCharts(document.querySelector("#reportsChart"), {
                        series: seriesItem,
                        chart: {
                          height: 350,
                          type: 'area',
                          toolbar: {
                            show: false
                          },
                        },
                        markers: {
                          size: 4
                        },
                        colors: ['#444444', '#a90606', '#f1c232', '#4154f1', '#00b662'],
                        fill: {
                          type: "gradient",
                          gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.3,
                            opacityTo: 0.4,
                            stops: [0, 90, 100]
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
                      }).render();
                    });
                  </script>
                  <!-- End Line Chart -->

                </div>

              </div>
            </div><!-- End Reports -->

           
            <!-- Top Selling -->

          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">

          <!-- Recent Activity -->
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Visualizacao</h6>
                </li>

                <li><a class="dropdown-item filtroPainelUltimaAtividadeItemVoto" href="#">Item voto</a> </li>
                <li><a class="dropdown-item filtroPainelUltimaAtividadeMediaVoto" href="#">Voto media pessoa </a>      </li>
              </ul>
            </div>

            <div class="card-body">
              <h5 class="card-title">Ultimas atividades <span class="labelAtividadeOnline"></span> </h5>

              <div class="activity listaAtividades">
					
              </div>

            </div>
          </div><!-- End Recent Activity -->

          <!-- Budget Report -->
          <!-- End Budget Report -->

          <!-- Website Traffic -->
          <!-- End Website Traffic -->

          <!-- News & Updates Traffic -->
          

        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

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