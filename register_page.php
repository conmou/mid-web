<!DOCTYPE html>
<html lang="en">

<head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title _msthash="149916" _msttexthash="14518010">註冊頁面</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
	<style>
		body,
		html {
			margin: 0;
			padding: 0;
			height: 100%;
			background: #113153 !important;
			background-image: url("https://www.transparenttextures.com/patterns/inspiration-geometry.png") !important;
		}

		.user_card {
			font-family: cwTeXYen;
			height: 480px;
			width: 1000px;
			margin-top: auto;
			margin-bottom: auto;
			background: #ffffff;
			position: relative;
			display: flex;
			justify-content: center;
			flex-direction: column;
			padding: 10px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			-webkit-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			-moz-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			border-radius: 5px;
		}

		.brand_logo_container {
			position: absolute;
			/* height: 250px; */
			/* width: 170px; */
			top: 15%;
			/* left: 70%; */
			right: 2%;
			/* border-radius: 50%; */
			/* background: #113153; */
			padding: 10px;
			text-align: right;
		}

		.brand_logo {
			height: 320px;
			z-index: 10;
			/* width: 150px; */
			/* border-radius: 50%; */
			/* border: 2px solid white; */
		}

		.form_container {
			margin-top: 100px;
		}

		.login_btn {
			width: 400px;
			background: #C0563F !important;
			color: white !important;
			border-radius: 1.5rem !important;
		}

		.login_btn:focus {
			box-shadow: none !important;
			outline: 0px !important;
		}

		.login_container {
			/* padding: 0 2rem; */
			font-weight: bolder;
		}

		.input-group-text {
			background: #C0563F !important;
			color: white !important;
			border: 0 !important;
			border-radius: 1.5rem 0 0 1.5rem !important;
		}

		.input_user,
		.input_pass {
			/* :focus */
			box-shadow: none !important;
			outline: 0px !important;
			border: 1.5px #bfbfbf solid !important;
			border-radius: 0 1.5rem 1.5rem 0 !important;
			height: 40px;
			width: 100%;
			/* margin-right: 0px !important; */
		}

		.custom-checkbox .custom-control-input:checked~.custom-control-label::before {
			background-color: #C0563F !important;
		}

		input:hover {
			color: black;
			background-color: #f2f2f2;
			border: 2px #708090 solid;
		}

		.text {
			opacity: 80%;
		}

		/* @media screen and (max-width:768px) {
			.box {
				width: 100%;
				background-color: green;
			}
		} */


		@media screen and (max-width:992px) {
			.pic {
				opacity: 50%;
				/* background-color: blue; */
			}
		}

		@media screen and (max-width:840px) {
			.pic {
				opacity: 40%;
				/* background-color: blue; */
			}
		}

		@media screen and (min-width:768px) {
			.box {
				width: 100%;
				/* background-color: blue; */
			}
		}

		@media screen and (max-width:500px) {
			.pic {
				opacity: 30%;
				/* background-color: blue; */
			}
		}

		@media screen and (max-width:468px) {
			.pic {
				opacity: 0%;
				/* background-color: blue; */
			}

			.box {
				width: 80%;
			}
		}

		@font-face {
			font-family: 'cwTeXYen';
			font-weight: bolder;
			/* src: local("GenJyuuGothic-Bold.ttf"); */
			/* src: url("/fonts/GenJyuuGothic-Bold.ttf"); */
			src: url(https://justfont.com/huninn/);
			src: url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.eot);
			src: url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.eot?#iefix) format('embedded-opentype'),
				url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.woff2) format('woff2'),
				url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.woff) format('woff'),
				url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.ttf) format('truetype');
		}
	</style>

</head>

<body>

	<div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div class="user_card">
				<div style="margin-left:10%;z-index:20;" style="font-family: cwTeXYen;">
					<div class="d-flex justify-content-left form_container" style="margin:0 !important;">
						<form name="register_form" action="http://localhost:8080/mid-web/register_result_page.php" method="post">
							<!-- <div class="input-group mb-3">
                                <h2>login</h2><br>
                            </div> -->
							<h1 style="font-weight: bold;">加入我們<span class="badge badge-secondary" style="margin-left: 20px !important;">Rappu Tappu</span></h1>
							<div class="input-group mb-3 box" style="margin-bottom: 5px !important;margin-top:30px !important;">
								<div class="input-group-append">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" name="account" class="form-control input_user text" value="" placeholder="帳號" _mstplaceholder="5771961" minlength="8" maxlength="12">

							</div>
							<div style="margin:0px 0px 3px 40px !important;font-size:small;">
								<span style="color: red;">*</span>請輸入8~12個英數字元
							</div>
							<div class="input-group mb-2 box" style="margin-bottom: 3px !important;">
								<div class="input-group-append">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<input type="password" name="pwd" class="form-control input_pass text" value="" placeholder="密碼" _mstplaceholder="5352386" minlength="8" maxlength="12">
							</div>
							<div style="margin:0px 0px 3px 40px !important;font-size:small;">
								<span style="color: red;">*</span>請輸入8~12個英數字元
							</div>
							<div class="input-group mb-2 box" style="margin-bottom: 3px !important;">
								<div class="input-group-append">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<input type="password" name="check_pwd" class="form-control input_pass text" value="" placeholder="確認密碼" _mstplaceholder="5352386" minlength="8" maxlength="12">
							</div>
							<div style="margin:0px 0px 3px 40px !important;font-size:small;">
								<span style="color: red;">*</span>請輸入8~12個英數字元
							</div>
							<div class="input-group mb-2 box" style="margin-bottom: 7px !important;">
								<div class="input-group-append">
									<span class="input-group-text"><i class="fas fa-envelope"></i></span>
								</div>
								<input type="email" name="email" class="form-control input_pass text" value="" placeholder="電子郵件信箱" _mstplaceholder="5352386">
							</div>

							<div class="d-flex justify-content-center mt-3 login_container box">
								<input type="submit" name="btn_submit" value="註冊" id="button" class="btn login_btn">
							</div>
							<div class="mt-2" style="margin-right: 7px !important;">
								<!--  -->
								<div class="d-flex justify-content-center links" style="color:gray;">
									<font _mstmutation="1" _msthash="973102" _msttexthash="31861583">已經有帳號了嗎？</font><a href="http://localhost:8080/mid-web/login_page.php" class="ml-2" _msthash="1165112" _msttexthash="5391113">登入</a>
								</div>
							</div>
						</form>
					</div>
				</div>

				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<!-- <img src="logo.png" class="brand_logo" alt="Logo"> -->
						<img src="img/computer-bear-background.png" class="brand_logo img-fluid pic" alt="商標" _mstalt="4811274">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <ul style='display: flex; justify-content:center'>
    <form name="register_form" action="register_result_page.php" method="post" >
        <li style='list-style:none'><input type="text" name="account" placeholder="註冊帳號" style="font-size:16px ;margin: 5px;width:260px;height: 30px;"><br></li>
        <li style='list-style:none;color:#c0c0c0;margin-left: 2%;font-size:13px'><span style="color: red;">*</span>最多10個英數字元</li>
        <li style='list-style:none'><input type="password" name="pwd" placeholder="註冊密碼" style="font-size:16px ;margin: 5px;width:260px;height: 30px;"><br></li>
        <li style='list-style:none;color:#c0c0c0;margin-left: 2%;font-size:13px'><span style="color: red;">*</span>最多10個英數字元</li><br>
        <li style='list-style:none ;display: flex; justify-content:center'><input type="submit" name="btn_submit" value="註冊" id="button"><br><br></li>
    </ul>
    </form> -->

</body>

</html>