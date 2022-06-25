<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的最愛</title>
</head>

<body>
    <?php
    session_start();
    $acc = $_SESSION['acc'];
    ?>
</body>

</html>
<?php
$nb_id = $_GET["nb_id"];
$platform = $_GET["platform"];
$fav_id = $_GET["fav_id"];
$urlLink = "http://localhost:8080/mid-web/user_page.php?nb_id=$_SESSION[nb_id]&brand=$_SESSION[brand]&platform=$_SESSION[platform]&cpu=$_SESSION[cpu]&gpu=$_SESSION[gpu]&ram=$_SESSION[ram]&SSD=$_SESSION[SSD]&HDD=$_SESSION[HDD]&weight=$_SESSION[weight]&inch=$_SESSION[inch]&minPrice=$_SESSION[minPrice]&maxPrice=$_SESSION[maxPrice]&orderByPrice=$_SESSION[orderByPrice]&orderByWeight=$_SESSION[orderByWeight]&compare1_nb_id=$_SESSION[compare1_nb_id]&compare2_nb_id=$_SESSION[compare2_nb_id]&#$nb_id";
//印出收藏內資料
$link = @mysqli_connect('localhost', 'root', '', 'laptop');
$sql = "SELECT * FROM `favorite` WHERE nb_id='$nb_id' and platform='$platform';";
$result = mysqli_query($link, $sql);

if ($rows = mysqli_fetch_array($result, MYSQLI_NUM)) {
    //在資料庫內 刪除
    $sql = "DELETE FROM `favorite` WHERE fav_id='$fav_id'";
    mysqli_query($link, $sql);
    echo "<script>alert('取消收藏!'); location.href = '$urlLink';</script>";
} else {
    //不在資料庫內 新增
    $sql = "INSERT INTO favorite(m_Id,nb_id,platform) value('$acc','$nb_id','$platform')";
    mysqli_query($link, $sql);
    echo "<script>alert('收藏成功!'); location.href = '$urlLink';</script>";
}

?>