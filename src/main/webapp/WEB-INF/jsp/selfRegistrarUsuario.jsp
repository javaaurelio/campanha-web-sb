<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="import-head.jsp" %> 
</head>


 <script>
     $(document).ready(function(){
    	 
    	 $(document).ajaxSend(function(event, jqxhr, settings) {
    			settings.url = settings.url.replaceAll("#(host_api)", "${urlApi}")
    			jqxhr.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
    			jqxhr.setRequestHeader('Accept', 'application/json; charset=utf-8');

   				sessionStorage.removeItem("jwtLocal");

   		});
    	 
    	 $.ajaxSetup(
    				{
    					timeout: 60000,
    					dataType: 'json'
    				}
    			);
    	 
    	 $(".formularioSelfCadastroUsuario" ).on("submit", function( event ) {
	        	
	        	if (!event.target.checkValidity()) {
	        		event.preventDefault();
	        	} else {
	        		dadosCadastroUsuario = {}
	        		dadosCadastroUsuario ["nome"] = $('.nome').val();
	        		dadosCadastroUsuario ["email"] = $('.email').val();
	        		dadosCadastroUsuario ["login"] = $('.usuario').val();
	        		dadosCadastroUsuario ["senha"] = $('.senha').val();
	       	        
	       	        var method = "POST";
	       	        var urlCustomizada = "#(host_api)/campanha/usuario/selfregistration";
	          	    event.preventDefault();
	       	        
	       	        $.ajax({
	                   type: method,
	                   url: urlCustomizada,
	                   data: JSON.stringify(dadosCadastroUsuario),
	                   success: function(data)
	                   {
	                      
	                      Swal.fire({
	                    	  title: "Pré-cadastro realizado com sucesso!",
		    	    		  text: "Verifique sua caixa de email. Se nao for confirmado em 48h o pre-cadastro deve ser realizado novamente! ",
		    	    		  icon: "success",
							  confirmButtonText: "Entendi",
							}).then((result) => {
							  /* Read more about isConfirmed, isDenied below */
							  if (result.isConfirmed) {
								  window.location.href = "http://localhost:8080/";
							  } 
							});
	                   },	                   
	                   error: function(data)
	                   {
	                	   console.log(data)
	                	   Swal.fire({
	             	  		  title: "Falha na operacao.",
	             	  		  text: "",
	             	  		  icon: "error"
	             		  	});
	                   }
	               });
	       	        
	       	     
	        	}
	        	
	        });
    	 
    	 
    	 
	  });
</script>


<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block">Dashboard</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Criacao de conta</h5>
                    <p class="text-center small">Informe alguns dados basico para iniciar seu cadastro</p>
                  </div>

                   <form class="row g-3 needs-validation formularioSelfCadastroUsuario" novalidate>
                    <div class="col-12">
                      <label for="yourName" class="form-label">Seu Nome</label>
                      <input type="text" class="form-control nome" placeholder="Seu Nome" required>
                      <div class="invalid-feedback">Informe seu nome</div>
                    </div>

                    <div class="col-12">
                      <label for="yourEmail" class="form-label">Seu Email</label>
                      <input type="email" class="form-control email" placeholder="Seu Email" required>
                      <div class="invalid-feedback">Informe um email valido!</div>
                    </div>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Login</label>
                      <div class="input-group has-validation">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                        <input type="text" class="form-control usuario" placeholder="Seu User Name" required>
                        <div class="invalid-feedback">Informe um user name valido vc vai utiliza-lo para logar</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Senha</label>
                      <input type="password" class="form-control senha" required>
                      <div class="invalid-feedback">Informe um senha segura! Minimo: 8 caracteres</div>
                    </div>

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" name="terms" type="checkbox" value="" id="acceptTerms" required>
                        <label class="form-check-label" for="acceptTerms">Aceitar os <a href="#">termo de uso</a>.</label>
                        <div class="invalid-feedback">É necessario aceitar o termo de uso.]</div>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Criar conta</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">Voce ja tem uma conta ? <a href="/">Logar</a></p>
                    </div>
                  </form>

                </div>
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