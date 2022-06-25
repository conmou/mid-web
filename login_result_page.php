<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登入結果</title>
</head>

<body>
    <?php
    if ($_POST["account"] != "" and $_POST["pwd"] != "") {
        //以記住密碼方式登入 且按記住密碼
        if (!empty($_COOKIE["acc"]) and !empty($_COOKIE["pwd"]) and isset($_POST["remember"])) {
            if ($_POST["account"] == $_COOKIE["acc"] and $_POST["pwd"] == $_COOKIE["pwd"]) {
                print "<script>alert('登入成功'); location.href = 'http://localhost:8080/mid-web/user_page.php';</script>";
            } else {
                print "<script>alert('帳號或密碼輸入錯誤'); location.href = 'http://localhost:8080/mid-web/login_page.php';</script>";
            }
        }
        //以記住密碼方式登入 且沒有按記住密碼
        else if (!empty($_COOKIE["acc"]) and !empty($_COOKIE["pwd"]) and !isset($_POST["remember"])) {
            if ($_POST["account"] == $_COOKIE["acc"] and $_POST["pwd"] == $_COOKIE["pwd"]) {
                setcookie("acc", "", time() - 3600 * 24 * 365 * 3);
                setcookie("pwd", "", time() - 3600 * 24 * 365 * 3);
                print "<script>alert('登入成功'); location.href = 'http://localhost:8080/mid-web/user_page.php';</script>";
            } else {
                setcookie("acc", "", time() - 3600 * 24 * 365 * 3);
                setcookie("pwd", "", time() - 3600 * 24 * 365 * 3);
                print "<script>alert('帳號或密碼輸入錯誤'); location.href = 'http://localhost:8080/mid-web/login_page.php';</script>";
            }
        }
        //以普通方式登入
        else {
            $salt = "52wgt";
            $acc = $_POST["account"];
            $pwd = hash("sha256", $_POST["pwd"] . $salt);
            $isOk = true;
            $sql = "SELECT m_Id ,m_pwd,status from member where m_Id='$acc'";
            $link = @mysqli_connect('localhost', 'root', '', 'laptop');
            $result = mysqli_query($link, $sql);
            while ($rows = mysqli_fetch_array($result, MYSQLI_NUM)) {
                $status = $rows[2];
                if ($status == '0') {
                    print "<script>alert('登入失敗!請前往信箱驗證!'); location.href = 'http://localhost:8080/mid-web/user_page.php';</script>";
                    $isOk = false;
                }
                if ($acc == $rows[0] and $pwd == $rows[1] and $isOk != false) {
                    //如果按記住密碼 加入cookie
                    if (isset($_POST['remember'])) {
                        setcookie("acc", $acc, time() + 3600 * 24 * 365 * 3);
                        setcookie("pwd", $pwd, time() + 3600 * 24 * 365 * 3);
                    }
                    if (strpos($acc, "manager") !== FALSE) { #要用三個
                        session_start();
                        $_SESSION['acc'] = $acc;
                        print "<script>alert('登入成功'); location.href = 'http://localhost:8080/mid-web/user_page.php';</script>";
                    } else {
                        session_start();
                        $_SESSION['acc'] = $acc;
                        print "<script>alert('登入成功'); location.href = 'http://localhost:8080/mid-web/user_page.php';</script>";
                    }
                }
            }
        }
        print "<script>alert('帳號或密碼輸入錯誤'); location.href = 'http://localhost:8080/mid-web/login_page.php';</script>";
    } else {
        print "<script>alert('帳號或密碼輸入不完整'); location.href = 'http://localhost:8080/mid-web/login_page.php';</script>";
    }
    ?>
</body>

</html>