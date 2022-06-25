<?php
$token = $_GET['token'];
$sql = "SELECT token from member where token='$token'";
$link = @mysqli_connect('localhost', 'root', '', 'laptop');
$result = mysqli_query($link, $sql);
$total_fields = mysqli_num_fields($result);
if ($total_fields > 0) {
    $sql = "UPDATE member set status=1 WHERE token='$token'";
    $result = mysqli_query($link, $sql);
    echo '驗證成功!';
} else {
    echo '你怎麼知道這:O?';
}
