<?php
$arti_id = $_GET["id"];
echo $arti_id;
$link = @mysqli_connect('localhost', 'root', '', 'laptop');
$sql = "update `article` set alert=1 WHERE arti_Id='$arti_id';";
$result = mysqli_query($link, $sql);

$sql = "SELECT type_id from article where arti_Id='$arti_id';";
$result = mysqli_query($link, $sql);
while ($rows = mysqli_fetch_array($result, MYSQLI_NUM)) {
    if ($rows[0] == 1) {
        $urlLink = "http://localhost:8080/mid-web/forumques.php";
    } else if ($rows[0] == 2) {
        $urlLink = "http://localhost:8080/mid-web/forumexper.php";
    }
}
echo "<script>alert('檢舉成功 等待管理員查核！'); location.href = '$urlLink';</script>";
