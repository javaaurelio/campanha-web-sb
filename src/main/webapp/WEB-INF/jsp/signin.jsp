<!DOCTYPE html>
<html lang="en">

<head>
  <%@include file="import-head.jsp" %> 
</head>

<script>

$(document).ready(function(){
	
	 $(document).ajaxSend(function (event, jqxhr, settings) {
		    settings.url = settings.url.replaceAll("#(host_api)", "${urlApi}")
		    //jqxhr.setRequestHeader('Authorization', 'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJBUFAtQ2FtcGFuaGEiLCJzdWIiOiJmYWJpbyIsImV4cCI6MTcxOTYwNjExNX0.hZOFlM6wy7gAGvAkP6nMx8NmDcKH65ajMnD3jhXJ-Q5V5BJnC8RfvSbVFmye_SBhjCN27K9W408PkQxVr0upww')
	});

    $("#formLogin" ).on("submit", function( event ) {
    	
    	if (!event.target.checkValidity()) {
    		event.preventDefault();
    	} else {
   	        item = {}
   	        item ["login"] = $('#formLogin').find('input[name="username"]').val();
   	        item ["senha"] = $('#formLogin').find('input[name="password"]').val();
   	        
   	        var method = "POST";
   	        var urlCustomizada = "#(host_api)/campanha/login";
      	    event.preventDefault();

      	    $.ajax({
               type: method,
               url: urlCustomizada,
               contentType: "application/json; charset=utf-8",
               data: JSON.stringify(item),
               dataType: 'json' ,
               success: function(data)
               {
            	  sessionStorage.setItem('jwtLocal', data.token	);
                  window.location.href = "http://localhost:8080/dashboard";
               },
               
               error: function(data, as)
               {
            	   
            	   if  (data.statusText=='error' && data.status == 0) {
            			Swal.fire({
            	  		  title: "Falha na conexao.",
            	  		  text: "",
            	  		  icon: "error"
            		  	});
            		}
            	   
            	   Swal.fire({
	    	    		  title: "Login ou senha invalidos ",
	    	    		  text: "",
	    	    		  icon: "error"
// 	    	    		  timer: 1500,
// 	    				  timerProgressBar: true
	    	    	});
               }
           });
    	}
    	
    });
    
});   
    

</script>

<body >

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container" >
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="dashboard" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block">Dashboard</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Login</h5>
                    <p class="text-center small">Informe Login e Senha</p>
                  </div>

                  <form id="formLogin" class="row g-3 needs-validation" novalidate method="post" action="/sigini">

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">login</label>
                      <div class="input-group has-validation">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                        <input type="text" name="username" class="form-control" id="yourUsername" value="fabio" required>
                        <div class="invalid-feedback">Entre com seu login.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                      <input type="password" name="password" class="form-control" id="yourPassword" value="aurelio" required>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Login</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">Voce ainda nao tem uma conta? <a href="registrarusuario">Criar uma conta</a></p>
                    </div>
                  </form>

                </div>
              </div>

              <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

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