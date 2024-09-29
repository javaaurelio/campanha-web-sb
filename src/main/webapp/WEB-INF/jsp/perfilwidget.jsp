 <script>
     $(document).ready(function(){
		
		
		var imagesPreview = function(input, placeToInsertImagePreview) {

	        if (input.files) {
	            var filesAmount = input.files.length;

// 	            for (i = 0; i < filesAmount; i++) {
	                var reader = new FileReader();

	                reader.onload = function(event) {
	                    $(   $.parseHTML('<img>') ).attr('class', "rounded-circle").attr('src', event.target.result).appendTo(placeToInsertImagePreview);
	                }

	                reader.readAsDataURL(input.files[i]);
// 	            }
	        }

	    };

	    $('#gallery-photo-add').on('change', function() {
	        imagesPreview(this, 'div.gallery');
	    });
	    
		
		
	});
</script>


<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
  	<div class="gallery"></div>
     
   <span class="d-none d-md-block dropdown-toggle ps-2 nomeUsuarioLogado"></span>
   </a><!-- End Profile Iamge Icon -->

   <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
     <li class="dropdown-header">
	   <h6 class='nomeUsuarioLogado'></h6>
       <span class='perfilUsuarioLogado'></span>
     </li>
     <li>
       <hr class="dropdown-divider">
     </li>

     <li>
       <a class="dropdown-item d-flex align-items-center" href="profile">
         <i class="bi bi-person"></i>
         <span>Perfil</span>
       </a>
     </li>
     <li>
       <hr class="dropdown-divider">
     </li>

<!--      <li> -->
<!--        <a class="dropdown-item d-flex align-items-center" href="pages-faq.html"> -->
<!--          <i class="bi bi-question-circle"></i> -->
<!--          <span>Ajuda ?</span> -->
<!--        </a> -->
<!--      </li> -->
     <li>
       <hr class="dropdown-divider">
     </li>

     <li>
       <a class="dropdown-item d-flex align-items-center logoutDashboard">
         <i class="bi bi-box-arrow-right"></i>
         <span>Sair</span>
       </a>
     </li>

   </ul><!-- End Profile Dropdown Items -->