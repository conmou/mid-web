<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>註冊結果</title>
</head>

<body>
    <?php
    $iscorrect = true;
    //判斷密碼和確認密碼是否一樣
    if ($_POST["pwd"] != $_POST["check_pwd"]) {
        print "<script>alert('密碼與確認密碼不一樣!!'); location.href = 'http://localhost:8080/mid-web/register_page.php';</script>";
        $iscorrect = false;
    }
    //判斷帳密是否符合長度規則
    else if (strlen($_POST["account"]) < 8 or strlen($_POST["pwd"]) < 8 or strlen($_POST["account"]) > 12 or strlen($_POST["pwd"]) > 12) {
        print "<script>alert('帳號或密碼字元數不正確'); location.href = 'http://localhost:8080/mid-web/register_page.php';</script>";
        $iscorrect = false;
    }
    //判斷帳密是否有非法字元 
    elseif (strpos($_POST["account"], "'") !== FALSE or strpos($_POST["pwd"], "'") !== FALSE) {
        print "<script>alert('帳號密碼不能有非法字元'); location.href = 'http://localhost:8080/mid-web/register_page.php';</script>";
        $iscorrect = false;
    }
    //判斷帳密是否有空格 
    elseif (strpos($_POST["account"], " ") !== FALSE or strpos($_POST["pwd"], " ") !== FALSE) {
        print "<script>alert('帳號密碼不能有空格'); location.href = 'http://localhost:8080/mid-web/register_page.php';</script>";
        $iscorrect = false;
    }
    //判斷信箱格式
    else if (strlen($_POST["email"]) != 0) {
        $regex = "/^([a-zA-Z0-9\.]+@+[a-zA-Z]+(\.)+[a-zA-Z]{2,3})$/";
        if (!preg_match($regex, $_POST["email"])) {
            print "<script>alert('信箱格式不正確'); location.href = 'http://localhost:8080/mid-web/register_page.php';</script>";
            $iscorrect = false;
        }
    }
    if ($_POST["account"] != "" and $_POST["pwd"] != "" and $_POST["email"] != "") {
        $salt = "52wgt";
        $acc = $_POST["account"];
        $pwd = hash("sha256", $_POST["pwd"] . $salt);
        $email = $_POST["email"];
        $token = hash('sha256', time());
        $isexist = FALSE;
        $link = @mysqli_connect('localhost', 'root', '', 'laptop');
        //檢查member email是否已註冊
        $check_email_sql = "SELECT email from member where email='$email'";
        $check_email_result = mysqli_query($link, $check_email_sql);
        $check_email_fields = mysqli_num_rows($check_email_result);
        $check_id_sql = "SELECT m_Id from member where m_Id='$acc'";
        $check_id_result = mysqli_query($link, $check_id_sql);
        $check_id_fields = mysqli_num_rows($check_id_result);
        if ($check_email_fields > 0) {
            print "<script>alert('此信箱已被註冊過'); location.href = 'http://localhost:8080/mid-web/register_page.php';</script>";
            $isexist = TRUE;
        }
        //檢查member id是否已存在
        elseif ($check_id_fields > 0) {
            print "<script>alert('此帳號已被註冊過'); location.href = 'http://localhost:8080/mid-web/register_page.php';</script>";
            $isexist = TRUE;
        }
        //都OK
        if ($isexist != TRUE and $iscorrect) {
            $emailsubject = "使用者帳號激活";
            $emailbody = "親愛的 " . $acc . " 請點擊此連結激活帳號~\n" . "http://localhost:8080/mid-web/active.php?token=" . $token;
            if (mail($email, $emailsubject, $emailbody)) {
                $sql = "insert into member(m_Id,m_pwd,email,token,status) values('$acc','$pwd','$email','$token','0')";
                mysqli_query($link, $sql);
                print "<script>alert('申請註冊成功，請前往信箱點擊驗證連結'); location.href = 'http://localhost:8080/mid-web/user_page.php';</script>";
            } else {
                echo "mail失敗 請聯繫EJ";
            }
        }
    } else {
        print "<script>alert('帳號或密碼輸入不完整'); location.href = 'http://localhost:8080/mid-web/register_page.php';</script>";
    }
    ?>
</body>

</html>