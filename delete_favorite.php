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
//印出收藏內資料
$link = @mysqli_connect('localhost', 'root', '', 'laptop');
$sql = "SELECT * FROM `favorite` WHERE nb_id='$nb_id';";
$result = mysqli_query($link, $sql);

if ($rows = mysqli_fetch_array($result, MYSQLI_NUM)) {
    //在資料庫內 刪除
    $sql = "DELETE FROM `favorite` WHERE nb_id='$nb_id'";
    mysqli_query($link, $sql);
    echo "<script>alert('取消收藏!'); location.href = 'http://localhost:8080/mid-web/favorite_page.php';</script>";
}
?>