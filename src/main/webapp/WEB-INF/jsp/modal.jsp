
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
    <img src="..." class="rounded mr-2" alt="...">
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
   
   