<!-- ======= Header ======= -->
  
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

   <title>Dashboard - </title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
  
  
  <!-- rating -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"/>

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  
  
  <!-- Icone tabela Material -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

  
  <!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Apr 20 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   
<!--    sweetalert -->
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.0/dist/sweetalert2.all.min.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.0/dist/sweetalert2.min.css" rel="stylesheet">
<!--    sweetalert -->

<!--    Graficos  -->
<script type="text/javascript" src="https://cdn.canvasjs.com/jquery.canvasjs.min.js"></script>
  
<!--    Local Util Ajax -->
   <script>
		   
		   $(document).ajaxSend(function (event, jqxhr, settings) {
			    jqxhr.setRequestHeader('X-Authrization', 'new-value')
			});
		   
		   
			carregarImagemPefil();
			function carregarImagemPefil() {
				 $.ajax({
			            type: "GET",
			            url: "http://localhost:8081/campanha/usuario/imagem/perfil/9",
			            success: function(data)
			            {
			            	$('.gallery').html('<img id="iconProfile" class="rounded-circle" src="'+ data +'">');
			            	//localStorage['perfil'] = data;
			            },
			            error: function(data)
			            {
			            	alert("Erro dados usuario")
			            	
			            	
			            }
			        });
				
			}
		   
   </script>
<!--    Local Util Ajax -->
  
  <style>
  
    .colored-toast.swal2-icon-success {
  		background-color: #c8f7b7 !important;
	}
  
  .modal-backdrop {
	width: 200vw;
	height: 200vw;
  }
  
    body { 
    zoom: 80%; 
    color: #66615b;
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
	
	.modalBackground1 {
	    position: fixed;
	    z-index: 1;
	    padding-top: 250px;
	    padding-left: 300px;
	    left: 0;
	    top: 0;
	    width: 100%;
	    height: 100%;
	    overflow: auto;
	    justify-content: center;
		align-items: center;
		text-align: center;
		 min-height: 100vh;
		 margin-top: -50px;
	     margin-left: -50px;
	}
	
	  	
	  	.modalBackground {
			 position: fixed;
		     top: 50%;
		     left: 50%;
		     margin-top: -100px;
		     margin-left: -100px;
		     width: 200px;
		     height: 200px;
		     text-align: center;
			 min-height: 100vh;
		}
		
		.modalBackground3 {
			display: flex;
		    justify-content: center;
		   align-items: center;
		   text-align: center;
		   min-height: 100vh;
		   
		}

</style>

  
 <!-- End Header -->