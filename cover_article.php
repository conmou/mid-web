<?php
$arti_id = $_GET["id"];
$action = $_GET["action"];
echo $arti_id;
$link = @mysqli_connect('localhost', 'root', '', 'laptop');
if ($action == "pass") {
    $sql = "update `article` set alert=0 WHERE arti_Id='$arti_id';";
    $result = mysqli_query($link, $sql);
    echo "<script>alert('審核通過成功！'); location.href = 'http://localhost:8080/mid-web/manager_page.php';</script>";
} else if ($action == "cover") {
    $sql = "update `article` set state=1 WHERE arti_Id='$arti_id';";
    $result = mysqli_query($link, $sql);
    echo "<script>alert('隱藏成功！'); location.href = 'http://localhost:8080/mid-web/manager_page.php';</script>";
}
