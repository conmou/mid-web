<?php
session_start();
if (!empty($_COOKIE["acc"]) and !empty($_SESSION["acc"])) {
    $_SESSION["acc"] = $_COOKIE["acc"];
    $acc = $_SESSION['acc'];
} else {
    if (!empty($_SESSION["acc"])) {
        $acc = $_SESSION['acc'];
    } else {
        $acc = "";
    }
}
if (!empty($acc)) {
    $link = @mysqli_connect('localhost', 'root', '', 'laptop');
    $sql = "SELECT * FROM `member` WHERE m_Id='$acc';";
    $result = mysqli_query($link, $sql);
    if ($rows = mysqli_fetch_assoc($result)) {
        $name = $rows['m_name'];
        $pwd = $rows['m_pwd'];
        $email = $rows['email'];
    } else {
        echo "<script>alert('請登入會員!'); location.href = 'http://localhost:8080/mid-web/login_page.php';</script>";
    }
}

$link = @mysqli_connect('localhost', 'root', '', 'laptop');
if ($_POST) {
    if (isset($_POST["name"])) {
        $name = $_POST["name"];
        if (!empty($name)) {
            $sql = "UPDATE member set m_name = '$name' WHERE m_Id='$acc';";
            $result = mysqli_query($link, $sql);
            echo "<script>alert('暱稱更新成功!'); location.href = 'http://localhost:8080/mid-web/user_info_page.php';</script>";
        } else {
            echo "<script>alert('暱稱更新失敗! 不得為空值'); location.href = 'http://localhost:8080/mid-web/user_info_page.php';</script>";
        }
    }
    if (isset($_POST["newPwd"])) {
        $newPwd = $_POST["newPwd"];
        echo $newPwd;
    }
    if (isset($_POST["checkPwd"])) {
        $checkPwd = $_POST["checkPwd"];
        echo $checkPwd;
    }
    $salt = "52wgt";
    if (hash('sha256', $newPwd . $salt) == $pwd) {
        echo "<script>alert('密碼更新失敗！新密碼與舊密碼一樣！'); location.href = 'http://localhost:8080/mid-web/user_info_page.php';</script>";
    } elseif (!empty($pwd) and !empty($newPwd) and ($newPwd == $checkPwd)) {
        $newPwd = hash('sha256', $newPwd . $salt);
        $sql = "UPDATE member set m_pwd = '$newPwd' WHERE m_Id='$acc';";
        $result = mysqli_query($link, $sql);
        echo "<script>alert('密碼更新成功！'); location.href = 'http://localhost:8080/mid-web/user_info_page.php';</script>";
    } elseif ($newPwd != $checkPwd) {
        echo "<script>alert('密碼更新失敗！新密碼與確認密碼不一致！'); location.href = 'http://localhost:8080/mid-web/user_info_page.php';</script>";
    } elseif (empty($newPwd) or empty($checkPwd)) {
        echo "<script>alert('密碼更新失敗！新密碼或確認密碼不得為空值！'); location.href = 'http://localhost:8080/mid-web/user_info_page.php';</script>";
    }
}
