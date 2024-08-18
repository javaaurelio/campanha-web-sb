
 <script>
   
   $(document).on("click", ".mostrarModalGraficoPreCadastro", function(){
		
// 	       var options = {
// 				exportEnabled: true,
// 				animationEnabled: false,
// 				title:{
// 					text: "Pre Cadastro"
// 				},
// 				legend:{
// 					horizontalAlign: "right",
// 					verticalAlign: "center"
// 				},
// 				data: [{
// 					type: "pie",
// 					showInLegend: true,
// 					toolTipContent: "<b>{name}</b>: ${y} (#percent%)",
// 					indexLabel: "{name}",
// 					legendText: "{name} (#percent%)",
// 					indexLabelPlacement: "inside",
// 					dataPoints: [
// 						{ y: 6566.4, name: "Housing" },
// 						{ y: 684, name: "Others"},
// 						{ y: 1231.2, name: "Utilities" }
// 					]
// 				}]
// 			};
			//$("#chartContainer").CanvasJSChart(options);
	   

		 $('#painelPreCadastroPendente').modal('show');
	});
	
   
   
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
	
	
	<div class="modal fade" id="modalCadastrarEvento" tabindex="-1" >
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
	              <p> </p>
	              
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
	                
	                
<!-- 					                  <label for="validationCustom01" class="form-label">Imagem(URL) </label> -->
	                  <div class="input-group col-md-4">
						 <div class="form-floating mb-3">
			                  <input type="text" placeholder="Leave a comment here" class="form-control"
			                   id="validationCustom01" name="imagemUrl" value="" required>
			                  <label for="floatingTextarea">Imagem (URL)</label>
								</div>	
								<div class="invalid-feedback">
	                      Informe uma URL valida.
	                    </div>				                  
	                </div>
	                <div class="col-12">
<!-- 					                  <label for="validationCustom01" class="form-label">Descricao</label> -->
	                 <div class="input-group col-md-4">
	                  
	                   <div class="form-floating mb-3">
	                      <textarea class="form-control descricao" id="floatingTextarea" style="height: 100px;" required></textarea>
	                      <label for="floatingTextarea">Descricao</label>
	                    </div>
	                  
	                  <div class="valid-feedback">
	                    Looks good!
	                  </div>
	                </div>
	                </div>
	                <div class="col-12">
	                  <label for="validationCustom01" class="form-label">Layout Painel Votacao </label>
	                 <div class="input-group col-md-4">
                  				  <span class="input-group-text "></span>
	                  <select class="form-select form-control layoutPainelVotacao" name="layoutPainelVotacao" aria-label="Default select example" id="validationCustom01" value="" required>
	                      <option selected value="">-- selecione --</option>
	                      <option value="padrao">Padrao</option>
	                      <option value="carousel">Carousel</option>
	                    </select>
		                 <div class="invalid-feedback">
		                    Informe uma data valida.
		                  </div>
	                </div>
	                </div>
	                
	                
	                <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                      <button class="btn btn-primary" type="submit">Salvar</button>
                    </div>

	              </form>
	
	            </div>
	          </div>
	        </div>
                
                
                </div>
                
              </div>
            </div>
</div>


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
									<label for="validationCustom01" class="form-label">Pergunta</label>
									<div class="row">
										<div class="col-md-8"
											style="padding-left: 5px; padding-right: 5px;">
											<div class="input-group">
												<input type="text" class="form-control" id="textoPesquisa"
													value="" required> <span class="input-group-text"
													id="addonTextoPesquisa">?</span>
												<button type="button" class="btn btn-info salvarPesquisa"
													style="">Salvar</button>
											</div>


										</div>
									</div>

<!-- 									<div class="row"> -->
<!-- 										<div class="col-md-7"> -->
<!-- 											<br> -->
<!-- 											<div id="center" class="rating"> -->
<!-- 												<span class="fa fa-star" id="star5"></span> <span -->
<!-- 													class="fa fa-star" id="star4"></span> <span -->
<!-- 													class="fa fa-star" id="star3"></span> <span -->
<!-- 													class="fa fa-star" id="star2"></span> <span -->
<!-- 													class="fa fa-star" id="star1"></span> -->
<!-- 											</div> -->
<!-- 										</div> -->

<!-- 									</div> -->
								</div>

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
									<tbody class="linhaPesquisa">
									</tbody>
								</table>
								<!-- End Bordered Table -->

								<div class="col-12">
									<span>Qtd:</span><span id="qtdPesquisa">0</span>
								</div>

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

