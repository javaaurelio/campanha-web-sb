<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="head.jsp" %>  
	
</head>

<script>
  
	$(document).ready(function(){
		
		
		carregarDadosPefil();
		
		function carregarDadosPefil() {
			
			 $.ajax({
		            type: "GET",
		            url: "http://localhost:8081/campanha/usuario/9",
		            success: function(data)
		            {
		            	$('.nome').data('id', data.nome);
		            	$('.nome').val(data.nome);
		        		$('.detalheNome').html(data.nome);
		        		$('.email').val(data.email);
		        		$('.endereco').val(data.endereco);
		        		$('.cidade').val(data.cidade);
		        		$('.uf').val(data.uf);
		        		$('.cep').val(data.cep);
		        		$('.dataNascimento').val(data.dataNascimentoDDMMYYYY.split("/").reverse().join("-"));
		        		
		        		//$(   $.parseHTML('<img>') ).attr('id', "iconProfile").attr('class', "rounded-circle").attr('src', event.target.result).appendTo(placeToInsertImagePreview);
		            },
		            error: function(data)
		            {
		            	alert("Erro dados usuario")
		            	
		            	
		            }
		        });
			
			
		}
		
		var imagesPreview = function(input, placeToInsertImagePreview) {

	        if (input.files) {
	            var filesAmount = input.files.length;

	            for (i = 0; i < filesAmount; i++) {
	                
	            	var reader = new FileReader();
	            	
	                reader.onload = function(event) {
	                    $(   $.parseHTML('<img>') ).attr('id', "iconProfile").attr('class', "rounded-circle").attr('src', event.target.result).appendTo(placeToInsertImagePreview);
	                }

	                reader.readAsDataURL(input.files[i]);
	            }
	        }

	    };

	    $('#gallery-photo-add').on('change', function() {
	    	$('.gallery').html('')
	        imagesPreview(this, 'div.gallery');
	    });
	    
	    $('.uploadImagemPerfil').click(function(){ $('#gallery-photo-add').trigger('click'); });
	    $('.removeImagemPerfil').click(function(){ $('.gallery').html(''); });

	    $(document).on("click", ".salvarImagemPerfil", function(){
	    	
    	  var base64Imagem = $('#iconProfile').attr('src');
    		 Swal.fire({
	        	  title: "Tem certeza que deseja atualizar seu Profile ?",
	        	  showDenyButton: true,
	        	  showCancelButton: false,
	        	  confirmButtonText: "Sim",
	        	  denyButtonText: "Não"
	        	}).then((result) => {
	        	  if (result.isConfirmed) {
	        		  
	        		  $.ajax({
	      	            type: "PUT",
	      	            url: "http://localhost:8081/campanha/usuario/imagem/perfil/9",
	      	            contentType: "application/json; charset=utf-8",
	      	            data: base64Imagem,
	      	            success: function(data)
	      	            {
	      	               Swal.fire({
	      	 	    		  title: "Realizado",
	      	 	    		  text: "Atualizado",
	      	 	    		  icon: "success",
	      	 	    		  timer: 1000,
	      	 				  timerProgressBar: true,
	      	 	    		});
	      	            },
	      	            error: function(data)
	      	            {
	      	            	alert('erro');
	      	            }
	      	        });
	        	  } else if (result.isDenied) {
	        		  Swal.fire("Operacao cancelada", "", "info");
	        	  }
	        	});
	        
	    });
		
		
	});
</script>

<body>

  <!-- ======= Header ======= -->
   <%@include file="barra.jsp" %>
  <!-- ======= Header ======= -->

  <!-- ======= Sidebar ======= -->
  
  <aside id="sidebar" class="sidebar">
        <%@include file="menu.jsp" %>
  </aside>
  <!-- End Sidebar-->
  
      

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Perfil usuario</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Perfil</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

<!--               <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle gallery"> -->
				<div class="gallery"></div>
                <input type="file" id="gallery-photo-add" style="visibility: hidden;">
                
              <h2 class="detalheNome"></h2>
              <h3 class="detalhePerfil">Administrador</h3>
              <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

        </div>
        
        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Detalhes</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Editar Perfil</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-settings">Configuracoes</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Alterar Senha</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  <h5 class="card-title"></h5>
                  <p class="small fst-italic informacoesSobre"></p>

                  <h5 class="card-title">Detalhes</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">Nome Completo</div>
                    <div class="col-lg-9 col-md-8 detalheNome"></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Endereco</div>
                    <div class="col-lg-9 col-md-8">Brasilia</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Telefone</div>
                    <div class="col-lg-9 col-md-8">(436) 486-3538 x29071</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Email</div>
                    <div class="col-lg-9 col-md-8">k.anderson@example.com</div>
                  </div>

                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                    <form class="row g-3 needs-validation formularioUsuario" novalidate>
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Image do perfil</label>
                      <div class="col-md-8 col-lg-9">
                        <div class="gallery"></div>
                         <div class="pt-2">
		                   <a href="#" class="btn btn-primary btn-sm uploadImagemPerfil" title="Upload"><i class="bi bi-upload"></i></a>
		                   <a href="#" class="btn btn-danger btn-sm removeImagemPerfil" title="Remover"><i class="bi bi-trash"></i></a>
		                   <a href="#" class="btn btn-success btn-sm salvarImagemPerfil" title="Salvar"><i class="bi bi-floppy"></i></a>
		                 </div>

                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Nome</label>
                      <div class="col-md-8 col-lg-9">
                        <input type="text" class="form-control nome" id="floatingName" placeholder="Seu Nome" required>
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="Address" class="col-md-4 col-lg-3 col-form-label">Data de Nascimento</label>
                      <div class="col-md-8 col-lg-9">
                         <input type="date" class="form-control dataNascimento" id="floatingDataNascimento" required name="dataInicio">
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="Address" class="col-md-4 col-lg-3 col-form-label">Endereco</label>
                      <div class="col-md-8 col-lg-9">
                        <textarea class="form-control endereco" placeholder="Address" id="floatingTextarea" style="height: 100px;" required></textarea>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Country" class="col-md-4 col-lg-3 col-form-label">Cidade</label>
                      <div class="col-md-8 col-lg-9">
                      <input type="text" class="form-control cidade" id="floatingCity" placeholder="Cidade" required>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Telefone</label>
                      <div class="col-md-8 col-lg-9">
                         <input type="text" class="form-control telefone" id="floatingCity" placeholder="Fone" required>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                      <div class="col-md-8 col-lg-9">
                         <input type="email" class="form-control email" id="floatingEmail" placeholder="Seu Email" required>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Twitter" class="col-md-4 col-lg-3 col-form-label">Twitter Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="twitter" type="text" class="form-control" id="Twitter" value="https://twitter.com/#">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Facebook" class="col-md-4 col-lg-3 col-form-label">Facebook Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="facebook" type="text" class="form-control" id="Facebook" value="https://facebook.com/#">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Instagram" class="col-md-4 col-lg-3 col-form-label">Instagram Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="instagram" type="text" class="form-control" id="Instagram" value="https://instagram.com/#">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Linkedin" class="col-md-4 col-lg-3 col-form-label">Linkedin Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="linkedin" type="text" class="form-control" id="Linkedin" value="https://linkedin.com/#">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Salvar</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>

<!--                 <div class="tab-pane fade pt-3" id="profile-settings"> -->

<!--                   Settings Form -->
<!--                   <form> -->

<!--                     <div class="row mb-3"> -->
<!--                       <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Email Notifications</label> -->
<!--                       <div class="col-md-8 col-lg-9"> -->
<!--                         <div class="form-check"> -->
<!--                           <input class="form-check-input" type="checkbox" id="changesMade" checked> -->
<!--                           <label class="form-check-label" for="changesMade"> -->
<!--                             Changes made to your account -->
<!--                           </label> -->
<!--                         </div> -->
<!--                         <div class="form-check"> -->
<!--                           <input class="form-check-input" type="checkbox" id="newProducts" checked> -->
<!--                           <label class="form-check-label" for="newProducts"> -->
<!--                             Information on new products and services -->
<!--                           </label> -->
<!--                         </div> -->
<!--                         <div class="form-check"> -->
<!--                           <input class="form-check-input" type="checkbox" id="proOffers"> -->
<!--                           <label class="form-check-label" for="proOffers"> -->
<!--                             Marketing and promo offers -->
<!--                           </label> -->
<!--                         </div> -->
<!--                         <div class="form-check"> -->
<!--                           <input class="form-check-input" type="checkbox" id="securityNotify" checked disabled> -->
<!--                           <label class="form-check-label" for="securityNotify"> -->
<!--                             Security alerts -->
<!--                           </label> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->

<!--                     <div class="text-center"> -->
<!--                       <button type="submit" class="btn btn-primary">Save Changes</button> -->
<!--                     </div> -->
<!--                   </form>End settings Form -->

<!--                 </div> -->

                <div class="tab-pane fade pt-3" id="profile-change-password">
                  <!-- Change Password Form -->
                  <form>

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Senha atual</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="password" type="password" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">Nova Senha</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newpassword" type="password" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Nova senha - verificacao</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Change Password</button>
                    </div>
                  </form><!-- End Change Password Form -->

                </div>

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

  <%@include file="footer.jsp" %>
  
  <%@include file="modal.jsp" %>
  
  <%@include file="footerscript.jsp" %>

</body>

</html>