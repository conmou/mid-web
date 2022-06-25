<?php
session_start();
if (!empty($_COOKIE["acc"]) and !empty($_COOKIE["pwd"])) {
    $_SESSION["acc"] = $_COOKIE["acc"];
    $acc = $_SESSION['acc'];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title _msthash="149916" _msttexthash="14518010">登入頁面</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <style>
        body,
        html {
            margin: 0;
            padding: 0;
            height: 100%;
            background-color: #113153 !important;
            background-image: url("https://www.transparenttextures.com/patterns/inspiration-geometry.png");
        }

        .user_card {
            font-family: cwTeXYen;
            height: 430px;
            width: 500px;
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
            height: 170px;
            width: 170px;
            top: -75px;
            border-radius: 50%;
            background: #fff;
            /* padding: 10px; */
            text-align: center;
        }

        .brand_logo {
            height: 150px;
            width: 150px;
            border-radius: 50%;
            border: 2px solid white;
            outline: 10px solid #113153;
        }

        .form_container {
            margin-top: 100px;
        }

        .login_btn {
            width: 400px;
            background: #C0563F !important;
            color: white !important;
            border-radius: 1.5rem !important;
            border: 2px solid rgba(0,0,0,0);
        }

        .login_btn:focus {
            box-shadow: none !important;
            outline: 0px !important;
        }

        .login_container {
            /* padding: 0 2rem; */
            font-weight: 500;
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
            width: 84%;
        }

        .custom-checkbox .custom-control-input:checked~.custom-control-label::before {
            background-color: #C0563F !important;
        }

        input:hover {
            color: black;
            background-color: #f2f2f2;
            border: 2px #708090 solid;
        }

        @font-face {
            font-family: 'cwTeXYen';
            font-style: normal;
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
                <div class="d-flex justify-content-center">
                    <div class="brand_logo_container">
                        <!-- <img src="logo.png" class="brand_logo" alt="Logo"> -->
                        <img src="img/Logo_background.svg" class="brand_logo" alt="商標" _mstalt="4811274">
                    </div>
                </div>
                <div class="d-flex justify-content-center form_container">
                    <form name="register_form" action="login_result_page.php" method="post">
                        <!-- <h2>加入我們<span class="badge badge-secondary" style="margin-top:20px !important;">網頁名</span></h2>
							 -->
                        <center>
                            <h2 style="font-weight: 1000;">登入</h2>
                        </center>

                        <!-- <div class="input-group mb-3">
                                <h2>login</h2><br>
                            </div> -->
                        <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <?php
                            if (!empty($_COOKIE["acc"])) {
                                echo '<input type="text" name="account" class="form-control input_user" value="' . $_COOKIE["acc"] . '" placeholder="帳號" _mstplaceholder="5771961" maxlength="10"> ';
                            } else {
                                echo '<input type="text" name="account" class="form-control input_user" value="" placeholder="帳號" _mstplaceholder="5771961" maxlength="10">';
                            }
                            ?>
                        </div>
                        <div class="input-group mb-2">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <?php
                            if (!empty($_COOKIE["pwd"])) {
                                echo '<input type="password" name="pwd" class="form-control input_pass" value="' . $_COOKIE["pwd"] . '" placeholder="密碼" _mstplaceholder="5352386">';
                            } else {
                                echo '<input type="password" name="pwd" class="form-control input_pass" value="" placeholder="密碼" _mstplaceholder="5352386">';
                            }
                            ?>
                        </div>
                        <div class="form-group">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customControlInline" name="remember" <?php echo (!empty($_COOKIE["acc"]) and !empty($_COOKIE["pwd"])) ? "checked" : ""; ?>>
                                <label class="custom-control-label" for="customControlInline" style="text-align: center;margin-left:14%;">記住我</label>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center mt-3 login_container">
                            <input type="submit" name="btn_submit" value="登入" id="button" class="btn login_btn">
                        </div>
                    </form>
                </div>

                <div class="mt-2">
                    <div class="d-flex justify-content-center links" style="color:gray;">
                        <font _mstmutation="1" _msthash="973102" _msttexthash="31861583">還沒有帳號嗎?</font><a href="register_page.php" class="ml-2" _msthash="1165112" _msttexthash="5391113">註冊</a>
                    </div>
                    <!-- <div class="d-flex justify-content-center links">
                        <a href="#">忘記密碼?</a>
                    </div> -->
                </div>
            </div>
        </div>
    </div>

    <!-- <div class="container h-100">
<ul style='display: flex; justify-content:center'>
<div class="d-flex justify-content-center form_container">
    <div class="brand_logo_container">
	    <img src="logo.png" class="brand_logo img-fluid" alt="Logo">
    </div>
<form name="register_form" action="login_result_page.php" method="post">
    <li style='list-style:none'><input type="text" name="account" placeholder="登入帳號" style="font-size:16px ;margin: 5px;width:260px;height: 30px;"><br></li>
    <li style='list-style:none'><input type="password" name="pwd" placeholder="登入密碼" style="font-size:16px;margin: 5px;width:260px;height: 30px;"><br><br></li>
    <li style='list-style:none;display: flex; justify-content:center'><input type="submit" name="btn_submit" value="登入" id="button"><br><br></li>
</div>
</div>
</ul>
</form> -->

</body>

</html>