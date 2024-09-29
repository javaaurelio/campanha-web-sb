
 <script>
   
   function mostrarToastSucesso(textoParam) {
	   const Toast = Swal.mixin({
			  toast: true,
			  position: "top-end",
	// 		  position: "center",
			  showConfirmButton: false,
			  timer: 1000,
			  timerProgressBar: true,
			  customClass: {
				    popup: 'colored-toast',
		      },
			  didOpen: (toast) => {
			    toast.onmouseenter = Swal.stopTimer;
			    toast.onmouseleave = Swal.resumeTimer;
			  }
			});
	   
			Toast.fire({
			  icon: "success",
			  title: textoParam
			});
			
			
// // 			  Swal.fire(
// //                       'Get!',
// //                       'Your file has been deleted.',
// //                       'success'
// //                   );
			
   }
   
   function mostrarCarregando(titulo, bodyTexto, tempo) {
	   
	   let timerInterval;
	   Swal.fire({
	     title: titulo,
	     html: bodyTexto,
	     timer: tempo,
	     timerProgressBar: false,
	     allowOutsideClick: false,
	     allowEscapeKey: false,
	     allowEnterKey: false,
	     didOpen: () => {
	       Swal.showLoading();
	       const timer = Swal.getPopup().querySelector("b");
	       timerInterval = setInterval(() => {
	         timer.textContent = `${Swal.getTimerLeft()}`;
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
	   	   
   }
   
   </script>
   
   


<!-- ======= Lista de Modal ======= -->
  <div id="popupCarregando" class="modal modalBackground" data-bs-backdrop="static" role="dialog">
	  <div class="modal-dialog modal-dialog-centered" >
	    <!-- Modal content-->
	    <div class="spinner-grow text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
          </div>
	  </div>
	</div>

  <div class="copied-toast modal modalBackground alert alert-success modal-sm " style="position: top-right" ></div>
  
  <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
  <div class="toast-header">
<!--     <img src="..." class="rounded mr-2" alt="..."> -->
    <strong class="mr-auto">Bootstrap</strong>
    <small>11 mins ago</small>
    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="toast-body">
    Hello, world! This is a toast message.
  </div>
</div>

	
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
   
   <!-- ======= Lista de PreCadastro  ======= -->   
   <div class="modal fade" id="painelPreCadastroPendente" tabindex="-1" data-bs-backdrop="static">
	  <div class="modal-dialog  modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Lista de Pre-Cadastro</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      		
<!-- 		              <div id="chartContainer"></div> -->
			Teste	      		
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
<!--        <div class="modal fade" id="modalCadastrarEvento" tabindex="-1" > -->
<!--             <div class="modal-dialog modal-xl"> -->
<!--               <div class="modal-content"> -->
<!--                 <div class="modal-header"> -->
<!--                   <h5 class="modal-title">Cadastro de Apresentação_</h5> -->
<!--                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!--                 </div> -->
<!--                 <div class="modal-body"> -->
                  
<!--               <div class="col-lg-13"> -->
                  
<!-- 	          <div class="card"> -->
<!-- 	            <div class="card-body"> -->
<!-- 	              <h5 class="card-title">Apresentacao</h5> -->
<!-- 	              <p> </p> -->
	              
<!-- 	              Custom Styled Validation -->
<!-- 	              <form id="formCampanha" class="row g-3 needs-validation" novalidate> -->
	              
<!--                    <div class="col-md-3"> -->
<!-- 	                 <label for="validationCustom01" class="form-label">Estado</label> -->
<!-- 	                 <div class="input-group col-md-4"> -->
<!--                   	  <span class="input-group-text "></span> -->
<!-- 	                  <select class="form-select form-control estado" name="estado" aria-label="Default select example" id="validationCustom01" value="" required> -->
<!-- 	                      <option selected value="">-- selecione --</option> -->
<!-- 							<option value="AC">Acre</option> -->
<!-- 							<option value="AL">Alagoas</option> -->
<!-- 							<option value="AP">Amapá</option> -->
<!-- 							<option value="AM">Amazonas</option> -->
<!-- 							<option value="BA">Bahia</option> -->
<!-- 							<option value="CE">Ceará</option> -->
<!-- 							<option value="DF">Distrito Federal</option> -->
<!-- 							<option value="ES">Espírito Santo</option> -->
<!-- 							<option value="GO">Goiás</option> -->
<!-- 							<option value="MA">Maranhão</option> -->
<!-- 							<option value="MT">Mato Grosso</option> -->
<!-- 							<option value="MS">Mato Grosso do Sul</option> -->
<!-- 							<option value="MG">Minas Gerais</option> -->
<!-- 							<option value="PA">Pará</option> -->
<!-- 							<option value="PB">Paraíba</option> -->
<!-- 							<option value="PR">Paraná</option> -->
<!-- 							<option value="PE">Pernambuco</option> -->
<!-- 							<option value="PI">Piauí</option> -->
<!-- 							<option value="RJ">Rio de Janeiro</option> -->
<!-- 							<option value="RN">Rio Grande do Norte</option> -->
<!-- 							<option value="RS">Rio Grande do Sul</option> -->
<!-- 							<option value="RO">Rondônia</option> -->
<!-- 							<option value="RR">Roraima</option> -->
<!-- 							<option value="SC">Santa Catarina</option> -->
<!-- 							<option value="SP">São Paulo</option> -->
<!-- 							<option value="SE">Sergipe</option> -->
<!-- 							<option value="TO">Tocantins</option> -->
<!-- 							<option value="EX">Estrangeiro</option> -->
<!-- 	                    </select> -->
<!-- 		                 <div class="invalid-feedback"> -->
<!-- 		                    Informe uma data valida. -->
<!-- 		                  </div> -->
<!-- 	                </div> -->
<!-- 	                </div> -->
	               					                
<!-- 	                <div class="col-md-2"> -->
<!-- 	                  <label for="validationCustom02" class="form-label">Data Apresentacao</label> -->
<!-- 	                  <input type="date" class="form-control" id="validationCustom03" required name="dataApresentacao"> -->
<!-- 	                  <div class="invalid-feedback"> -->
<!-- 	                    Informe uma data valida para apresentacao -->
<!-- 	                  </div> -->
<!-- 	                </div> -->
	                
<!-- 					<div class="col-md-3"> -->
<!-- 	                 <label for="validationCustom01" class="form-label">Ensaio</label> -->
<!-- 	                 <div class="input-group col-md-4"> -->
<!--                   	  <span class="input-group-text "></span> -->
<!-- 	                  <select class="form-select form-control ensaio" name="ensaio" aria-label="Default select example" id="validationCustom01" value="" required> -->
<!-- 	                      <option selected value="">-- selecione --</option> -->
<!-- 							<option value="AC">Acre</option> -->
<!-- 							<option value="AL">Alagoas</option> -->
<!-- 							<option value="AP">Amapá</option> -->
<!-- 							<option value="EX">Estrangeiro</option> -->
<!-- 	                    </select> -->
<!-- 		                 <div class="invalid-feedback"> -->
<!-- 		                    Informe uma data valida. -->
<!-- 		                  </div> -->
<!-- 	                </div> -->
<!-- 	                </div> -->
	                
	                
<!-- 	                <div class="col-md-8"> -->
<!-- 	                 <label for="validationCustom01" class="form-label">Agremiacao</label> -->
<!-- 	                 <div class="input-group col-md-4"> -->
<!--                   	  <span class="input-group-text "></span> -->
<!-- 	                  <select class="form-select form-control agremiacao" name="agremiacao" aria-label="Default select example" id="validationCustom01" value="" required> -->
<!-- 	                      <option selected value="">-- selecione --</option> -->
							
<!-- 							<option value="EX">Estrangeiro</option> -->
<!-- 	                    </select> -->
<!-- 		                 <div class="invalid-feedback"> -->
<!-- 		                    Informe uma data valida. -->
<!-- 		                  </div> -->
<!-- 	                </div> -->
<!-- 	                </div> -->
	                
<!-- 	                <div class="modal-footer"> -->
<!--                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button> -->
<!--                       <button class="btn btn-primary" type="submit">Salvar</button> -->
<!--                     </div> -->

<!-- 	              </form> -->
	
<!-- 	            </div> -->
<!-- 	          </div> -->
<!-- 	        </div> -->
                
                
<!--                 </div> -->
                
<!--               </div> -->
<!--             </div> -->
<!-- </div> -->

      <div class="modal fade" id="modalCadastrarApresentacao" tabindex="-1" >
            <div class="modal-dialog modal-xl">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Cadastro de Apresentação</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  
                  <div class="col-lg-13">
               
               <div id="carouselControleApresentacao" class="carousel slide" data-ride="carousel" data-interval="false" >
               
               			<div class="carousel-inner">
											
						     <div class="carousel-item active slideApresentacao">            
                  
					          <div class="card dadosApresentacao" data-codagremiacao="" data-codapresentacao="">
					            <div class="card-body">
					              <h5 class="card-title nomeAgremiacao"></h5>
					              <p> </p>
					              
					              <!-- Custom Styled Validation -->
					              <form id="formApresentacao" class="row g-3 needs-validation" novalidate>
					              
				                   <div class="col-md-3">
					                 <label for="validationCustom01" class="form-label">Estado</label>
					                 <div class="input-group col-md-4">
				                  	  <span class="input-group-text "></span>
					                  <select class="form-select form-control estadoFormApresentacao" name="estado" aria-label="Default select example" id="validationCustom01" value="" required>
					                      <option selected value="">-- selecione --</option>
											<option value="AC">Acre</option>
											<option value="AL">Alagoas</option>
											<option value="AP">Amapá</option>
											<option value="AM">Amazonas</option>
											<option value="BA">Bahia</option>
											<option value="CE">Ceará</option>
											<option value="DF">Distrito Federal</option>
											<option value="ES">Espírito Santo</option>
											<option value="GO">Goiás</option>
											<option value="MA">Maranhão</option>
											<option value="MT">Mato Grosso</option>
											<option value="MS">Mato Grosso do Sul</option>
											<option value="MG">Minas Gerais</option>
											<option value="PA">Pará</option>
											<option value="PB">Paraíba</option>
											<option value="PR">Paraná</option>
											<option value="PE">Pernambuco</option>
											<option value="PI">Piauí</option>
											<option value="RJ">Rio de Janeiro</option>
											<option value="RN">Rio Grande do Norte</option>
											<option value="RS">Rio Grande do Sul</option>
											<option value="RO">Rondônia</option>
											<option value="RR">Roraima</option>
											<option value="SC">Santa Catarina</option>
											<option value="SP">São Paulo</option>
											<option value="SE">Sergipe</option>
											<option value="TO">Tocantins</option>
											<option value="EX">Estrangeiro</option>
					                    </select>
						                 <div class="invalid-feedback">
						                    Informe uma data valida.
						                  </div>
					                </div>
					                </div>
					               					                
					                <div class="col-md-2">
					                  <label for="validationCustom02" class="form-label">Data apresentação</label>
					                  <input type="date" class="form-control dataApresentacaoFormApresentacao" id="validationCustom03" required name="dataApresentacao">
					                  <div class="invalid-feedback">
					                    Informe uma data valida para apresentação
					                  </div>
					                </div>
					                
									<div class="col-md-3">
					                 <label for="validationCustom01" class="form-label">Ensaio</label>
					                 <div class="input-group col-md-4">
				                  	  <span class="input-group-text "></span>
					                  <select class="form-select form-control ensaioFormApresentacao" name="ensaio" aria-label="Default select example" id="validationCustom01" value="" required>
					                      <option selected value="">-- selecione --</option>
											<option value="AC">Acre</option>
											<option value="AL">Alagoas</option>
											<option value="AP">Amapá</option>
											<option value="EX">Estrangeiro</option>
					                    </select>
						                 <div class="invalid-feedback">
						                    Informe uma data valida.
						                  </div>
					                </div>
					                </div>
					                
					                
				              	    <!-- Bordered Table -->
									<table
										class="table hoverable tabelaApresentacao">
										<thead>
											<tr>
												<th scope="col" class="text-center" style="width: 1%">#</th>
												<th scope="col">Estado</th>
												<th scope="col">Ensaio</th>
												<th scope="col">Data</th>
												<th scope="col" class="text-center" style="width: 7%">Ações</th>
											</tr>
										</thead>
										<tbody class="linhaApresentacao">
										</tbody>
									</table>
									<!-- End Bordered Table -->
									
							   <nav aria-label="Page navigation example">
								  <ul class="pagination  justify-content-center">
								    <li class="page-item primeiro" data-destino="primeiro"><a class="page-link primeiro" href="#" >Primeiro</a></li>
								    <li class="page-item anterior" data-paginadestino="anterior"><a class="page-link anterior" href="#">Anterior</a></li>
								    <li class="page-item"><a class="page-link" href="#"><span class="paginaAtual"></span> / <span class="paginasTotal"></span> </a></li>
								    <li class="page-item proximo" data-paginadestino="proximo"><a class="page-link" href="#" >Proximo</a></li>
								    <li class="page-item ultimo" data-paginadestino="ultima"><a class="page-link" href="#">Ultimo</a></li>
								  </ul>
								</nav>
				
									<div class="col-12">
										<span>Qtd:</span><span class="qtdLinhaApresentacao">0</span>
									</div>
					                
					                <div class="modal-footer">
				                      <button type="reset" class="btn btn-secondary rounded-pill btCancelarApresentacao" >Fechar</button>
				                      <button class="btn btn-success rounded-pill btSalvarApresentacao" type="submit">Salvar</button>
				                      <button class="btn btn-primary rounded-pill btPesquisarApresentacao" type="button">Pesquisar</button>
				                    </div>
				
					              </form>
					
					            </div>
					          </div>
					          
					          
					          
						        </div>
						        
									<div class="carousel-item slidePerguntas"> 
								
																<div class="card dadosApresentacao" data-codagremiacao="" data-codapresentacao="">
																            <div class="card-body">
																              <h5 class="card-title nomeAgremiacaoComApresentacao"></h5>
																              <p> </p>
																              
																            <form class="row g-3 needs-validation" novalidate>
																            
																	             <div class="col-md-8">
																                  <label for="validationCustom02" class="form-label">Pergunta</label>
																                  
																                  <div class="input-group">
																						<input type="text" class="form-control" id="textoPesquisa"
																							value="" required> <span class="input-group-text"
																							id="addonTextoPesquisa">?</span>
																						<button type="button" style="left: 15px;" class="w-25 btn btn-secondary rounded-pill salvarPesquisa" >Salvar</button>
																					</div>
																                  
																                  <div class="invalid-feedback">
																                    Informe uma data valida para apresentacao
																                  </div>
																                </div>
																            
																            

																				   <div class="col-md-12">
																						<!-- End Custom Styled Validation -->
														
																						<!-- Bordered Table -->
																						<table
																							class="table table-bordered border-primary tabelaPerguntas">
																							<thead>
																								<tr>
																									<th scope="col" class="text-center" style="width: 1%">#</th>
																									<th scope="col">Pergunta</th>
																									<th scope="col" class="text-center" style="width: 7%">Acoes</th>
																								</tr>
																							</thead>
																							<tbody class="linhaPergunta">
																							</tbody>
																						</table>
																						<!-- End Bordered Table -->
														
																						<div class="col-12">
																							<span>Qtd:</span><span id="qtdPesquisa">0</span>
																						</div>
																						
																						 <div class="modal-footer justify-content-center">
																						 <div class="row">
																						  <div class="col-3"></div>
																						  <div class="col-6">
																						  	<button type="button" class="btn btn-secondary rounded-pill" data-bs-target="#carouselControleApresentacao" data-bs-slide="prev"><i class="bi bi-arrow-left"></i> Voltar</button>
																						  </div>
																						  <div class="col-3"></div>
																						    
																						  </div>
																						 
																					     </div>
																	                      
																	                    </div>
												
																			</form>
																
																            </div>
																          </div>

									
									</div>
								</div>
							
									</div>
								</div>
								           						        
						        
						        </div>
						        
				        </div>
                
                			        </div>
                			        
                		</div>
                		
                		
              <div class="modal fade" id="modalResumoApresentacao" tabindex="-1" style="display: none;" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Resumo Apresentação</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      
                      <div class="list-group list-group-resumoApresentacao">
		              </div>
																						
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary rounded-pill" data-bs-dismiss="modal">Fechar</button>
                    </div>
                  </div>
                </div>
              </div>
                		
                		
<!--             </div> -->
<!-- </div> -->


<div class="modal fade" id="PesquisaModal" tabindex="-1">

	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">

				<h5 class="modal-title">Cadastros de Perguntas</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body">
				<div class="col-lg-13">
				
				
				<div class="card mb-3">
		            <div class="row g-0">
		              <div class="col-md-4">
		                <img src="assets/img/card.jpg" class="imagemUrl img-fluid rounded-start" alt="...">
		              </div>
		              <div class="col-md-8">
		                <div class="card-body">
		                  <h4 class="card-title nomeEvento"></h4>
		                  <p class="card-text descricaoEvento"></p>
		                  <p class="card-text dataapresentacao"></p>
		                </div>
		              </div>
		            </div>
		          </div>
						
					<div class="card" data-codevento="" id="nomeCampanhaPergunta">					
						<div class="card-body">
							<!-- Custom Styled Validation -->
							<form class="row g-3 needs-validation" novalidate>

								<div class="col-md-12">
								<br>
									<label for="validationCustom01" class="form-label"></label>
<!-- 									<div class="row"> -->
<!-- 										<div class="col-md-8" -->
<!-- 											style="padding-left: 5px; padding-right: 5px;"> -->
<!-- 											<div class="input-group"> -->
<!-- 												<input type="text" class="form-control" id="textoPesquisa" -->
<!-- 													value="" required> <span class="input-group-text" -->
<!-- 													id="addonTextoPesquisa">?</span> -->
<!-- 												<button type="button" class="btn btn-info salvarPesquisa" -->
<!-- 													style="">Salvar</button> -->
<!-- 											</div> -->


<!-- 										</div> -->
<!-- 									</div> -->

								<!-- End Custom Styled Validation -->

								<!-- Bordered Table -->
								<table
									class="table table-bordered border-primary tabelaPerguntas">
									<thead>
										<tr>
											<th scope="col" class="text-center" style="width: 1%">#</th>
											<th scope="col">Pergunta</th>
										</tr>
									</thead>
									<tbody class="linhaPesquisa">
									</tbody>
								</table>
								<!-- End Bordered Table -->

							</form>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Fechar</button>
							</div>

						</div>
					</div>
				</div>


			</div>

		</div>
	</div>
</div>


 <div class="modal fade " id="modalPublicarEvento" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title modalUtilGeralTitulo"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			
					<i class="bi bi-copy dadosPublicacao" data-idevento="" data-urlpublicacao="_urlpublicacao_" title="_urlpublicacao_" ></i> 
					<br>
					<i class="bi bi-facebook"></i> 
					<br>
					<i class="bi bi-whatsapp"></i>  
					
			
			</div>
			
			<div class="modal-footer d-flex justify-content-start">
			    <div class="form-check form-switch ">
				    <input class="form-check-input statusPublicar" type="checkbox" data-status=""/> Publicado 
			    </div>			    
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Fechar</button>
			</div>
		</div>
	</div>
</div>

