<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register page</title>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<style>
body {
	text-transform: capatalize;
	font-size: 21px;
	font-family: cursive;
}
</style>
</head>
<body
	style="background: url('p1.jpg'); background-attachment: fixed; background-size: cover; z-index: -1100;">
	<div class="container" style="margin-top: 4rem;">
		<div class="row">
			<div class="col s6 offset-s3">

				<div class="card center-align">
					<div class="card-content">
						<h3 class="center-align" style="margin-top: 20px;">Register
							form</h3>
						<h5 id="msg" class="center-align"></h5>
						<div class="form">
							<form action="dataservlet" method="post" id="myform">
								<input type="text" placeholder="first name" name="user_fname">
								
								<input type="text" placeholder="second name" name="user_lname">
								
								<input type="password" placeholder="password " name="user_password">
								
								<input type="email" placeholder="email" name="user_email">
								<br> 
								<div class="file-field input-field">
									<div class="btn">
										<span>File</span> <input name="image" type="file" multiple>
									</div>
									<div class="file-path-wrapper">
										<input class="file-path validate" type="text"
											placeholder="Upload one or more files">
									</div>
								</div>
								
								<label><input type="radio" class="with-gap" name="user_gender"
									value="male"><span>male</span>
								</label> 
								
								<label><input type="radio" class="with-gap"
									name="user_gender" value="female"><span>female</span>
								</label>
								<br><br>
								<button type="submit" class="waves-effect waves-light btn">submit</button>
							</form>
						</div>

						<div class="loader center-align"
							style="margin-top: 12px; display: none;">
							<div class="preloader-wrapper big active">
								<div class="spinner-layer spinner-blue">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>

								<div class="spinner-layer spinner-red">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>

								<div class="spinner-layer spinner-yellow">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>

								<div class="spinner-layer spinner-green">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>
							</div>
							<h6>loading....</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"
		integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							console.log("page is ready...")

							$('#myform')
									.on(
											'submit',
											function(event) {
												event.preventDefault();

											//	var key_pair = $(this).serialize()
											//  serialize is used for sending the text data in serialize format but not work for files or images . so we use different method 					
											let key_pair=new FormData(this);
											
												console.log(key_pair);

												$('.form').hide();
												$('.loader').show();

												$.ajax({
															url : "dataservlet",
															type : "post",
															data : key_pair,
															success : function(data,textStatus,jqXHR) {
																console.log(data);
																$('.form').show();
																console.log("success........");
																$('.loader').hide();
																if (data.trim() === 'connected') {
																	$('#msg').html("Successfully registered.");
																	$('#msg').addClass('green-text');
																} 
																else {
																	$('#msg').html("Something went wrong..");
																	$('#msg').addClass('red-text');
																}
																
															},
															error : function(jqXHR,textStatus,errorThrown) {
																console.log(data);
																$('.form').show();
																$('.loader').hide();
																$('#msg').html("Something went wrong at server side..");
																$('#msg').addClass('red-text');
																console.log("error........");
															},
															processData:false,
															contentType:false

														})

											})

						})
	</script>
</body>
</html>