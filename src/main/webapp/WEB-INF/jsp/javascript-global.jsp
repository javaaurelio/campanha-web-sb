<script>
$(document).ready(function(){
// 	if (!sessionStorage.getItem("jwtLocal")) {
// 		window.location.href = "http://localhost:8080";
// 	}

$(document).ajaxSend(function(event, jqxhr, settings) {
	settings.url = settings.url.replaceAll("#(host_api)", "${urlApi}")
	jqxhr.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
	jqxhr.setRequestHeader('Accept', 'application/json; charset=utf-8');

	if (sessionStorage.getItem("jwtLocal")) {
		jqxhr.setRequestHeader('X-controlado', 'true');
		jqxhr.setRequestHeader('Authorization', 'Bearer ' + sessionStorage.getItem("jwtLocal"));
	} else {
		sessionStorage.removeItem("jwtLocal");
	}

});

$.ajaxSetup(
	{
		timeout: 60000,
		dataType: 'json'
	}
);

$(document).on('ajaxError', function(event, xhr) {
	
	if (xhr.status == 401 || xhr.status == 403) {
		window.location.href = "http://localhost:8080";
	}
	
	if  (xhr.statusText=='error' && xhr.status == 0) {
		Swal.fire({
  		  title: "Falha na conexao.",
  		  text: "",
  		  icon: "error"
	  	});
	}

});

	$(document).on("click", ".logoutDashboard", function() {
	
		Swal.fire({
			title: "Deseja sair ?",
			showDenyButton: true,
			showCancelButton: false,
	
			denyButtonText: "N&atilde;o",
			confirmButtonText: "Sim",
			denyButtonColor: "#B7B7B7",
			//         		      confirmButtonColor: "#96C283",
			confirmButtonColor: "#69AADB",
		}).then((result) => {
			if (result.isConfirmed) {
				sessionStorage.removeItem("jwtLocal");
				sessionStorage.removeItem("jwtLocal");
				window.location.href = "http://localhost:8080";
			} else if (result.isDenied) {
				//Swal.fire("Operacao cancelada", "", "info");
			}
		});
	});
	
// 	carregarDadosUsuario();
// 	function carregarDadosUsuario() {
// 		 $.ajax({
// 	            type: "GET",
// 	            url: "#(host_api)/campanha/usuario/logado/perfil",
// 	            success: function(data)
// 	            {
// // 	            	$('.gallery').html('<img id="iconProfile" class="rounded-circle" src="'+ data.perfilBase64Imagem +'">');
// 	            },
// 	            error: function(data)
// 	            {
// 	            	//alert("Erro dados usuario")
// 	            }
// 	        });
//     }

});   
</script>
