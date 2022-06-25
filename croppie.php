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
        echo "<script>alert('請登入會員!'); location.href = 'http://localhost:8080/mid-web/login_page.php';</script>";
    }
}
$image = $_POST['image'];

list($type, $image) = explode(';', $image);
list(, $image) = explode(',', $image);

$image = base64_decode($image);
$image_name = time() . '.png';
file_put_contents('uploads/' . $image_name, $image);

$link = @mysqli_connect('localhost', 'root', '', 'laptop');
$sql = "UPDATE member SET img_name='$image_name' WHERE m_Id='$acc'";
mysqli_query($link, $sql);
