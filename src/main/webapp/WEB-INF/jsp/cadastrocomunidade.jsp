<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="head.jsp" %>  
</head>

  <script>
  
	$(document).ready(function(){
		
	});
</script>

<body>
 
  <%@include file="barra.jsp" %>

  <!-- Sidebar -->
  <aside id="sidebar" class="sidebar">
        <%@include file="menu.jsp" %>
  </aside>
  <!-- End Sidebar-->

  <main id="main" class="main">
  
	  <div class="pagetitle">
      <h1>Cadastro</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Cadastro</li>
          <li class="breadcrumb-item active">Usuario</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
		  
	  
	  
	  <div class="card">
<div class="p-3 pb-0 border-0 card-header">
<div class="d-flex align-items-center">
<h6 class="mb-0">Consumption by room</h6>
<button type="button" class="mb-0 btn btn-icon-only btn-rounded btn-white ms-2 btn-sm d-flex align-items-center justify-content-center ms-auto" data-bs-toggle="tooltip" data-bs-placement="bottom">
<i class="fas fa-info" aria-hidden="true"></i>
</button>
</div>
</div>
<div class="p-3 card-body">
<div class="row">
<div class="text-center col-5">
<div class="chart">
<canvas id="chart-consumption" class="chart-canvas" height="265" width="256" style="display: block; box-sizing: border-box; height: 196.296px; width: 189.63px;"></canvas>
</div>
<h4 class="font-weight-bold mt-n8">
<span>310</span>
<span class="text-sm d-block text-body">WATTS</span>
</h4>
</div>
<div class="py-2 col-7">
<div class="table-responsive">
<table class="table mb-0 align-items-center">
<tbody>
<tr>
<td class="py-2">
<div class="px-2 py-0 d-flex">
<span class="badge badge-md rounded-1 badge-opaque bg-primary me-3"> </span>
<div class="d-flex flex-column justify-content-center">
<h6 class="mb-0 text-sm">Living Room</h6>
</div>
</div>
</td>
<td class="py-2 text-sm text-center align-middle">
<span class="text-xs font-weight-bold"> 15% </span>
</td>
</tr>
<tr>
<td class="py-2">
<div class="px-2 py-0 d-flex">
<span class="badge badge-md rounded-1 badge-opaque bg-secondary me-3"> </span>
<div class="d-flex flex-column justify-content-center">
<h6 class="mb-0 text-sm">Kitchen</h6>
</div>
</div>
</td>
<td class="py-2 text-sm text-center align-middle">
<span class="text-xs font-weight-bold"> 20% </span>
</td>
</tr>
<tr>
<td class="py-2">
<div class="px-2 py-0 d-flex">
<span class="badge badge-md rounded-1 badge-opaque bg-info me-3"> </span>
<div class="d-flex flex-column justify-content-center">
<h6 class="mb-0 text-sm">Attic</h6>
</div>
</div>
</td>
<td class="py-2 text-sm text-center align-middle">
<span class="text-xs font-weight-bold"> 13% </span>
</td>
</tr>
<tr>
<td class="py-2">
<div class="px-2 py-0 d-flex">
<span class="badge badge-md rounded-1 badge-opaque bg-success me-3"> </span>
<div class="d-flex flex-column justify-content-center">
<h6 class="mb-0 text-sm">Garage</h6>
</div>
</div>
</td>
<td class="py-2 text-sm text-center align-middle">
<span class="text-xs font-weight-bold"> 32% </span>
</td>
</tr>
<tr>
<td class="py-2">
<div class="px-2 py-0 d-flex">
<span class="badge badge-md rounded-1 badge-opaque bg-danger me-3"> </span>
<div class="d-flex flex-column justify-content-center">
<h6 class="mb-0 text-sm">Basement</h6>
</div>
</div>
</td>
<td class="py-2 text-sm text-center align-middle">
<span class="text-xs font-weight-bold"> 20% </span>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
</div>
</div>
	  
	            
           <div class="card">
           
           
           <div class="row">
<div class="position-relative overflow-hidden">
<div class="swiper mySwiper mt-4 mb-2 swiper-cards swiper-3d swiper-initialized swiper-horizontal swiper-pointer-events swiper-watch-progress">
<div class="swiper-wrapper" id="swiper-wrapper-d2585b3b0c0dcaa8" aria-live="polite" style="cursor: grab; transition-duration: 0ms;">
<div class="swiper-slide swiper-slide-prev" role="group" aria-label="1 / 6" style="width: 600px; transition-duration: 0ms; z-index: 5; transform: translate3d(calc(-7.25% + 0px), 0px, -100px) rotateZ(-2deg) scale(1);">
<div>
<div class="card card-background shadow-none border-radius-xl card-background-after-none align-items-start mb-0">
<div class="full-background bg-cover" style="background-image: url('../../assets/img/img-2.jpg')"></div>
<div class="card-body text-start px-3 py-0 w-100">
<div class="row mt-12">
<div class="col-sm-3 mt-auto">
<h4 class="text-dark font-weight-bolder">#1</h4>
<p class="text-dark opacity-6 text-xs font-weight-bolder mb-0">Name</p>
<h5 class="text-dark font-weight-bolder">Secured</h5>
</div>
<div class="col-sm-3 ms-auto mt-auto">
<p class="text-dark opacity-6 text-xs font-weight-bolder mb-0">Category</p>
<h5 class="text-dark font-weight-bolder">Banking</h5>
</div>
</div>
</div>
</div>
</div>
<div class="swiper-slide-shadow" style="opacity: 1; transition-duration: 0ms;"></div></div>
<div class="swiper-slide swiper-slide-visible swiper-slide-active" role="group" aria-label="2 / 6" style="width: 600px; transition-duration: 0ms; z-index: 6; transform: translate3d(-600px, 0px, 0px) rotateZ(0deg) scale(1);">
<div class="card card-background shadow-none border-radius-xl card-background-after-none align-items-start mb-0">
<div class="full-background bg-cover" style="background-image: url('../../assets/img/img-1.jpg')"></div>
<div class="card-body text-start px-3 py-0 w-100">
<div class="row mt-12">
<div class="col-sm-3 mt-auto">
<h4 class="text-dark font-weight-bolder">#2</h4>
<p class="text-dark opacity-6 text-xs font-weight-bolder mb-0">Name</p>
<h5 class="text-dark font-weight-bolder">Cyber</h5>
</div>
<div class="col-sm-3 ms-auto mt-auto">
<p class="text-dark opacity-6 text-xs font-weight-bolder mb-0">Category</p>
<h5 class="text-dark font-weight-bolder">Security</h5>
</div>
</div>
</div>
</div>
<div class="swiper-slide-shadow" style="opacity: 0; transition-duration: 0ms;"></div></div>
<div class="swiper-slide swiper-slide-next" role="group" aria-label="3 / 6" style="width: 600px; transition-duration: 0ms; z-index: 5; transform: translate3d(calc(7.25% - 1200px), 0px, -100px) rotateZ(2deg) scale(1);">
<div class="card card-background shadow-none border-radius-xl card-background-after-none align-items-start mb-0">
<div class="full-background bg-cover" style="background-image: url('../../assets/img/img-3.jpg')"></div>
<div class="card-body text-start px-3 py-0 w-100">
<div class="row mt-12">
<div class="col-sm-3 mt-auto">
<h4 class="text-dark font-weight-bolder">#3</h4>
<p class="text-dark opacity-6 text-xs font-weight-bolder mb-0">Name</p>
<h5 class="text-dark font-weight-bolder">Alpha</h5>
</div>
<div class="col-sm-3 ms-auto mt-auto">
<p class="text-dark opacity-6 text-xs font-weight-bolder mb-0">Category</p>
<h5 class="text-dark font-weight-bolder">Blockchain</h5>
</div>
</div>
</div>
</div>
<div class="swiper-slide-shadow" style="opacity: 1; transition-duration: 0ms;"></div></div>
<div class="swiper-slide" role="group" aria-label="4 / 6" style="width: 600px; transition-duration: 0ms; z-index: 4; transform: translate3d(calc(13% - 1800px), 0px, -200px) rotateZ(4deg) scale(1);">
<div class="card card-background shadow-none border-radius-xl card-background-after-none align-items-start mb-0">
<div class="full-background bg-cover" style="background-image: url('../../assets/img/img-4.jpg')"></div>
<div class="card-body text-start px-3 py-0 w-100">
<div class="row mt-12">
<div class="col-sm-3 mt-auto">
<h4 class="text-dark font-weight-bolder">#4</h4>
<p class="text-dark opacity-6 text-xs font-weight-bolder mb-0">Name</p>
<h5 class="text-dark font-weight-bolder">Beta</h5>
</div>
<div class="col-sm-3 ms-auto mt-auto">
<p class="text-dark opacity-6 text-xs font-weight-bolder mb-0">Category</p>
<h5 class="text-dark font-weight-bolder">Web3</h5>
</div>
</div>
</div>
</div>
<div class="swiper-slide-shadow" style="opacity: 1; transition-duration: 0ms;"></div></div>
<div class="swiper-slide" role="group" aria-label="5 / 6" style="width: 600px; transition-duration: 0ms; z-index: 3; transform: translate3d(calc(17.25% - 2400px), 0px, -300px) rotateZ(6deg) scale(1);">
<div class="card card-background shadow-none border-radius-xl card-background-after-none align-items-start mb-0">
<div class="full-background bg-cover" style="background-image: url('../../assets/img/img-5.jpg')"></div>
<div class="card-body text-start px-3 py-0 w-100">
<div class="row mt-12">
<div class="col-sm-3 mt-auto">
<h4 class="text-dark font-weight-bolder">#5</h4>
<p class="text-dark opacity-6 text-xs font-weight-bolder mb-0">Name</p>
<h5 class="text-dark font-weight-bolder">Gama</h5>
</div>
<div class="col-sm-3 ms-auto mt-auto">
<p class="text-dark opacity-6 text-xs font-weight-bolder mb-0">Category</p>
<h5 class="text-dark font-weight-bolder">Design</h5>
</div>
</div>
</div>
</div>
<div class="swiper-slide-shadow" style="opacity: 1; transition-duration: 0ms;"></div></div>
<div class="swiper-slide" role="group" aria-label="6 / 6" style="width: 600px; transition-duration: 0ms; z-index: 2; transform: translate3d(calc(20% - 3000px), 0px, -400px) rotateZ(8deg) scale(1);">
<div class="card card-background shadow-none border-radius-xl card-background-after-none align-items-start mb-0">
<div class="full-background bg-cover" style="background-image: url('../../assets/img/img-1.jpg')"></div>
<div class="card-body text-start px-3 py-0 w-100">
<div class="row mt-12">
<div class="col-sm-3 mt-auto">
<h4 class="text-dark font-weight-bolder">#6</h4>
<p class="text-dark opacity-6 text-xs font-weight-bolder mb-0">Name</p>
<h5 class="text-dark font-weight-bolder">Rompro</h5>
</div>
<div class="col-sm-3 ms-auto mt-auto">
<p class="text-dark opacity-6 text-xs font-weight-bolder mb-0">Category</p>
<h5 class="text-dark font-weight-bolder">Security</h5>
</div>
</div>
</div>
</div>
<div class="swiper-slide-shadow" style="opacity: 1; transition-duration: 0ms;"></div></div>
</div>
<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
<div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-d2585b3b0c0dcaa8" aria-disabled="false"></div>
<div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-d2585b3b0c0dcaa8" aria-disabled="false"></div>
</div>
</div>
</div>

           
           
           
           <div class="card">
<div class="card-header border-bottom">
<div class="d-sm-flex align-items-center">
<div>
<h6 class="mb-0 text-lg font-weight-semibold">Customers list</h6>
<p class="text-sm">See information about all members</p>
</div>
<div class="ms-auto d-flex">
<button type="button" class="btn btn-sm btn-white me-2">
View all
</button>
<button type="button" class="btn btn-sm btn-dark btn-icon d-flex align-items-center me-2">
<span class="btn-inner--icon">
<svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="d-block me-2">
<path d="M6.25 6.375a4.125 4.125 0 118.25 0 4.125 4.125 0 01-8.25 0zM3.25 19.125a7.125 7.125 0 0114.25 0v.003l-.001.119a.75.75 0 01-.363.63 13.067 13.067 0 01-6.761 1.873c-2.472 0-4.786-.684-6.76-1.873a.75.75 0 01-.364-.63l-.001-.122zM19.75 7.5a.75.75 0 00-1.5 0v2.25H16a.75.75 0 000 1.5h2.25v2.25a.75.75 0 001.5 0v-2.25H22a.75.75 0 000-1.5h-2.25V7.5z"></path>
</svg>
</span>
<span class="btn-inner--text">Add member</span>
</button>
</div>
</div>
</div>
<div class="px-0 card-body pb-0">
<div class="px-3 mb-3 row">
<div class="col-6">
<div class="btn-group" role="tablist">
<input class="btn-check active" type="radio" name="radiotable" id="radiotable1" autocomplete="off" role="tab" aria-controls="table1" aria-selected="true" checked="">
<label class="px-4 mb-0 btn btn-white" for="radiotable1">View All</label>
<input class="btn-check active" type="radio" name="radiotable" id="radiotable2" autocomplete="off" role="tab" aria-controls="table2" aria-selected="false">
<label class="px-4 mb-0 btn btn-white" for="radiotable2">Monitored</label>
<input class="btn-check active" type="radio" name="radiotable" id="radiotable3" autocomplete="off" role="tab" aria-controls="table3" aria-selected="false">
<label class="px-4 mb-0 btn btn-white" for="radiotable3">Unmonitored</label>
</div>
</div>
<div class="col-6">
<div class="input-group w-lg-50 w-80 ms-auto">
<span class="input-group-text text-body">
<svg xmlns="http://www.w3.org/2000/svg" width="16px" height="16px" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
<path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"></path>
</svg>
</span>
<input type="text" class="form-control" placeholder="Search" onfocus="focused(this)" onfocusout="defocused(this)">
</div>
</div>
</div>
<div class="mt-4 table-responsive">
<table class="table mb-0 align-items-center">
<thead class="bg-gray-100">
<tr>
<th class="text-xs text-secondary font-weight-semibold opacity-7">Customer</th>
<th class="text-xs text-secondary font-weight-semibold opacity-7">Plan</th>
<th class="text-xs text-secondary font-weight-semibold opacity-7">Status</th>
<th class="text-xs text-secondary font-weight-semibold opacity-7">Biling Date</th>
<th class="text-xs text-secondary font-weight-semibold opacity-7"></th>
</tr>
</thead>
<tbody>
<tr>
<td>
<div class="px-2 py-1 d-flex">
<div class="d-flex align-items-center">
<img src="../../assets/img/team-1.jpg" class="avatar avatar-sm rounded-circle me-2" alt="user1">
</div>
<div class="d-flex flex-column justify-content-center ms-1">
<h6 class="mb-0 text-sm font-weight-semibold">Sarah Lamalo</h6>
<p class="mb-0 text-sm text-secondary">sarah@creative-tim.com</p>
</div>
</div>
</td>
<td>
<p class="mb-0 text-sm text-secondary">Starter</p>
</td>
<td class="text-sm align-middle">
<span class="border badge border-radius-lg border-success opacity-7 text-success bg-success">Active</span>
</td>
<td class="align-middle">
<span class="text-sm text-secondary font-weight-normal">12/06/2022</span>
</td>
<td class="align-middle">
<a href="javascript:;" class="text-xs text-secondary font-weight-bold" data-bs-toggle="tooltip" data-bs-title="Edit user">
<svg width="14" height="14" viewBox="0 0 15 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M11.2201 2.02495C10.8292 1.63482 10.196 1.63545 9.80585 2.02636C9.41572 2.41727 9.41635 3.05044 9.80726 3.44057L11.2201 2.02495ZM12.5572 6.18502C12.9481 6.57516 13.5813 6.57453 13.9714 6.18362C14.3615 5.79271 14.3609 5.15954 13.97 4.7694L12.5572 6.18502ZM11.6803 1.56839L12.3867 2.2762L12.3867 2.27619L11.6803 1.56839ZM14.4302 4.31284L15.1367 5.02065L15.1367 5.02064L14.4302 4.31284ZM3.72198 15V16C3.98686 16 4.24091 15.8949 4.42839 15.7078L3.72198 15ZM0.999756 15H-0.000244141C-0.000244141 15.5523 0.447471 16 0.999756 16L0.999756 15ZM0.999756 12.2279L0.293346 11.5201C0.105383 11.7077 -0.000244141 11.9624 -0.000244141 12.2279H0.999756ZM9.80726 3.44057L12.5572 6.18502L13.97 4.7694L11.2201 2.02495L9.80726 3.44057ZM12.3867 2.27619C12.7557 1.90794 13.3549 1.90794 13.7238 2.27619L15.1367 0.860593C13.9869 -0.286864 12.1236 -0.286864 10.9739 0.860593L12.3867 2.27619ZM13.7238 2.27619C14.0917 2.64337 14.0917 3.23787 13.7238 3.60504L15.1367 5.02064C16.2875 3.8721 16.2875 2.00913 15.1367 0.860593L13.7238 2.27619ZM13.7238 3.60504L3.01557 14.2922L4.42839 15.7078L15.1367 5.02065L13.7238 3.60504ZM3.72198 14H0.999756V16H3.72198V14ZM1.99976 15V12.2279H-0.000244141V15H1.99976ZM1.70617 12.9357L12.3867 2.2762L10.9739 0.86059L0.293346 11.5201L1.70617 12.9357Z" fill="#64748B"></path>
</svg>
</a>
</td>
</tr>
<tr>
<td>
<div class="px-2 py-1 d-flex">
<div class="d-flex align-items-center">
<img src="../../assets/img/team-2.jpg" class="avatar avatar-sm rounded-circle me-2" alt="user1">
</div>
<div class="d-flex flex-column justify-content-center ms-1">
<h6 class="mb-0 text-sm font-weight-semibold">Charles Deluvio</h6>
<p class="mb-0 text-sm text-secondary">charles@creative-tim.com</p>
</div>
</div>
</td>
<td>
<p class="mb-0 text-sm text-secondary">Business</p>
</td>
<td class="text-sm align-middle">
<span class="border badge border-radius-lg border-secondary opacity-7 text-secondary bg-secondary">Inactive</span>
</td>
<td class="align-middle">
<span class="text-sm text-secondary font-weight-normal">10/01/2022</span>
</td>
<td class="align-middle">
<a href="javascript:;" class="text-xs text-secondary font-weight-bold" data-bs-toggle="tooltip" data-bs-title="Edit user">
<svg width="14" height="14" viewBox="0 0 15 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M11.2201 2.02495C10.8292 1.63482 10.196 1.63545 9.80585 2.02636C9.41572 2.41727 9.41635 3.05044 9.80726 3.44057L11.2201 2.02495ZM12.5572 6.18502C12.9481 6.57516 13.5813 6.57453 13.9714 6.18362C14.3615 5.79271 14.3609 5.15954 13.97 4.7694L12.5572 6.18502ZM11.6803 1.56839L12.3867 2.2762L12.3867 2.27619L11.6803 1.56839ZM14.4302 4.31284L15.1367 5.02065L15.1367 5.02064L14.4302 4.31284ZM3.72198 15V16C3.98686 16 4.24091 15.8949 4.42839 15.7078L3.72198 15ZM0.999756 15H-0.000244141C-0.000244141 15.5523 0.447471 16 0.999756 16L0.999756 15ZM0.999756 12.2279L0.293346 11.5201C0.105383 11.7077 -0.000244141 11.9624 -0.000244141 12.2279H0.999756ZM9.80726 3.44057L12.5572 6.18502L13.97 4.7694L11.2201 2.02495L9.80726 3.44057ZM12.3867 2.27619C12.7557 1.90794 13.3549 1.90794 13.7238 2.27619L15.1367 0.860593C13.9869 -0.286864 12.1236 -0.286864 10.9739 0.860593L12.3867 2.27619ZM13.7238 2.27619C14.0917 2.64337 14.0917 3.23787 13.7238 3.60504L15.1367 5.02064C16.2875 3.8721 16.2875 2.00913 15.1367 0.860593L13.7238 2.27619ZM13.7238 3.60504L3.01557 14.2922L4.42839 15.7078L15.1367 5.02065L13.7238 3.60504ZM3.72198 14H0.999756V16H3.72198V14ZM1.99976 15V12.2279H-0.000244141V15H1.99976ZM1.70617 12.9357L12.3867 2.2762L10.9739 0.86059L0.293346 11.5201L1.70617 12.9357Z" fill="#64748B"></path>
</svg>
</a>
</td>
</tr>
<tr>
<td>
<div class="px-2 py-1 d-flex">
<div class="d-flex align-items-center">
<img src="../../assets/img/team-3.jpg" class="avatar avatar-sm rounded-circle me-2" alt="user2">
</div>
<div class="d-flex flex-column justify-content-center ms-1">
<h6 class="mb-0 text-sm font-weight-semibold">Vicky Hladynets</h6>
<p class="mb-0 text-sm text-secondary">vicky@creative-tim.com</p>
</div>
</div>
</td>
<td>
<p class="mb-0 text-sm text-secondary">Enterprise</p>
</td>
<td class="text-sm align-middle">
<span class="border badge border-radius-lg border-secondary opacity-7 text-secondary bg-secondary">Inactive</span>
</td>
<td class="align-middle">
<span class="text-sm text-secondary font-weight-normal">21/05/2021</span>
</td>
<td class="align-middle">
<a href="javascript:;" class="text-xs text-secondary font-weight-bold" data-bs-toggle="tooltip" data-bs-title="Edit user">
<svg width="14" height="14" viewBox="0 0 15 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M11.2201 2.02495C10.8292 1.63482 10.196 1.63545 9.80585 2.02636C9.41572 2.41727 9.41635 3.05044 9.80726 3.44057L11.2201 2.02495ZM12.5572 6.18502C12.9481 6.57516 13.5813 6.57453 13.9714 6.18362C14.3615 5.79271 14.3609 5.15954 13.97 4.7694L12.5572 6.18502ZM11.6803 1.56839L12.3867 2.2762L12.3867 2.27619L11.6803 1.56839ZM14.4302 4.31284L15.1367 5.02065L15.1367 5.02064L14.4302 4.31284ZM3.72198 15V16C3.98686 16 4.24091 15.8949 4.42839 15.7078L3.72198 15ZM0.999756 15H-0.000244141C-0.000244141 15.5523 0.447471 16 0.999756 16L0.999756 15ZM0.999756 12.2279L0.293346 11.5201C0.105383 11.7077 -0.000244141 11.9624 -0.000244141 12.2279H0.999756ZM9.80726 3.44057L12.5572 6.18502L13.97 4.7694L11.2201 2.02495L9.80726 3.44057ZM12.3867 2.27619C12.7557 1.90794 13.3549 1.90794 13.7238 2.27619L15.1367 0.860593C13.9869 -0.286864 12.1236 -0.286864 10.9739 0.860593L12.3867 2.27619ZM13.7238 2.27619C14.0917 2.64337 14.0917 3.23787 13.7238 3.60504L15.1367 5.02064C16.2875 3.8721 16.2875 2.00913 15.1367 0.860593L13.7238 2.27619ZM13.7238 3.60504L3.01557 14.2922L4.42839 15.7078L15.1367 5.02065L13.7238 3.60504ZM3.72198 14H0.999756V16H3.72198V14ZM1.99976 15V12.2279H-0.000244141V15H1.99976ZM1.70617 12.9357L12.3867 2.2762L10.9739 0.86059L0.293346 11.5201L1.70617 12.9357Z" fill="#64748B"></path>
</svg>
</a>
</td>
</tr>
<tr>
<td>
<div class="px-2 py-1 d-flex">
<div class="d-flex align-items-center">
<img src="../../assets/img/team-4.jpg" class="avatar avatar-sm rounded-circle me-2" alt="user2">
</div>
<div class="d-flex flex-column justify-content-center ms-1">
<h6 class="mb-0 text-sm font-weight-semibold">Leio Mclaren</h6>
<p class="mb-0 text-sm text-secondary">leio@creative-tim.com</p>
</div>
</div>
</td>
<td>
<p class="mb-0 text-sm text-secondary">Starter</p>
</td>
<td class="text-sm align-middle">
<span class="border badge border-radius-lg border-success opacity-7 text-success bg-success">Active</span>
</td>
<td class="align-middle">
<span class="text-sm text-secondary font-weight-normal">26/03/2021</span>
</td>
<td class="align-middle">
<a href="javascript:;" class="text-xs text-secondary font-weight-bold" data-bs-toggle="tooltip" data-bs-title="Edit user">
<svg width="14" height="14" viewBox="0 0 15 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M11.2201 2.02495C10.8292 1.63482 10.196 1.63545 9.80585 2.02636C9.41572 2.41727 9.41635 3.05044 9.80726 3.44057L11.2201 2.02495ZM12.5572 6.18502C12.9481 6.57516 13.5813 6.57453 13.9714 6.18362C14.3615 5.79271 14.3609 5.15954 13.97 4.7694L12.5572 6.18502ZM11.6803 1.56839L12.3867 2.2762L12.3867 2.27619L11.6803 1.56839ZM14.4302 4.31284L15.1367 5.02065L15.1367 5.02064L14.4302 4.31284ZM3.72198 15V16C3.98686 16 4.24091 15.8949 4.42839 15.7078L3.72198 15ZM0.999756 15H-0.000244141C-0.000244141 15.5523 0.447471 16 0.999756 16L0.999756 15ZM0.999756 12.2279L0.293346 11.5201C0.105383 11.7077 -0.000244141 11.9624 -0.000244141 12.2279H0.999756ZM9.80726 3.44057L12.5572 6.18502L13.97 4.7694L11.2201 2.02495L9.80726 3.44057ZM12.3867 2.27619C12.7557 1.90794 13.3549 1.90794 13.7238 2.27619L15.1367 0.860593C13.9869 -0.286864 12.1236 -0.286864 10.9739 0.860593L12.3867 2.27619ZM13.7238 2.27619C14.0917 2.64337 14.0917 3.23787 13.7238 3.60504L15.1367 5.02064C16.2875 3.8721 16.2875 2.00913 15.1367 0.860593L13.7238 2.27619ZM13.7238 3.60504L3.01557 14.2922L4.42839 15.7078L15.1367 5.02065L13.7238 3.60504ZM3.72198 14H0.999756V16H3.72198V14ZM1.99976 15V12.2279H-0.000244141V15H1.99976ZM1.70617 12.9357L12.3867 2.2762L10.9739 0.86059L0.293346 11.5201L1.70617 12.9357Z" fill="#64748B"></path>
</svg>
</a>
</td>
</tr>
<tr>
<td>
<div class="px-2 py-1 d-flex">
<div class="d-flex align-items-center">
<img src="../../assets/img/team-5.jpg" class="avatar avatar-sm rounded-circle me-2" alt="user2">
</div>
<div class="d-flex flex-column justify-content-center ms-1">
<h6 class="mb-0 text-sm font-weight-semibold">Vicky Hladynets</h6>
<p class="mb-0 text-sm text-secondary">vicky@creative-tim.com</p>
</div>
</div>
</td>
<td>
<p class="mb-0 text-sm text-secondary">Enterprise</p>
</td>
<td class="text-sm align-middle">
<span class="border badge border-radius-lg border-secondary opacity-7 text-secondary bg-secondary">Inactive</span>
</td>
<td class="align-middle">
<span class="text-sm text-secondary font-weight-normal">11/01/2019</span>
</td>
<td class="align-middle">
<a href="javascript:;" class="text-xs text-secondary font-weight-bold" data-bs-toggle="tooltip" data-bs-title="Edit user">
<svg width="14" height="14" viewBox="0 0 15 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M11.2201 2.02495C10.8292 1.63482 10.196 1.63545 9.80585 2.02636C9.41572 2.41727 9.41635 3.05044 9.80726 3.44057L11.2201 2.02495ZM12.5572 6.18502C12.9481 6.57516 13.5813 6.57453 13.9714 6.18362C14.3615 5.79271 14.3609 5.15954 13.97 4.7694L12.5572 6.18502ZM11.6803 1.56839L12.3867 2.2762L12.3867 2.27619L11.6803 1.56839ZM14.4302 4.31284L15.1367 5.02065L15.1367 5.02064L14.4302 4.31284ZM3.72198 15V16C3.98686 16 4.24091 15.8949 4.42839 15.7078L3.72198 15ZM0.999756 15H-0.000244141C-0.000244141 15.5523 0.447471 16 0.999756 16L0.999756 15ZM0.999756 12.2279L0.293346 11.5201C0.105383 11.7077 -0.000244141 11.9624 -0.000244141 12.2279H0.999756ZM9.80726 3.44057L12.5572 6.18502L13.97 4.7694L11.2201 2.02495L9.80726 3.44057ZM12.3867 2.27619C12.7557 1.90794 13.3549 1.90794 13.7238 2.27619L15.1367 0.860593C13.9869 -0.286864 12.1236 -0.286864 10.9739 0.860593L12.3867 2.27619ZM13.7238 2.27619C14.0917 2.64337 14.0917 3.23787 13.7238 3.60504L15.1367 5.02064C16.2875 3.8721 16.2875 2.00913 15.1367 0.860593L13.7238 2.27619ZM13.7238 3.60504L3.01557 14.2922L4.42839 15.7078L15.1367 5.02065L13.7238 3.60504ZM3.72198 14H0.999756V16H3.72198V14ZM1.99976 15V12.2279H-0.000244141V15H1.99976ZM1.70617 12.9357L12.3867 2.2762L10.9739 0.86059L0.293346 11.5201L1.70617 12.9357Z" fill="#64748B"></path>
</svg>
</a>
</td>
</tr>
</tbody>
</table>
</div>
<div class="px-3 py-3 border-top d-flex align-items-center">
<p class="mb-0 text-sm font-weight-semibold text-dark">Page 1 of 10</p>
<div class="ms-auto">
<button class="mb-0 btn btn-sm btn-white">Previous</button>
<button class="mb-0 btn btn-sm btn-white">Next</button>
</div>
</div>
</div>
</div>




           
           
           
             
  <%@include file="footer.jsp" %>
  
  <%@include file="modal.jsp" %>
  
  <%@include file="footerscript.jsp" %>
  
</body>

</html>