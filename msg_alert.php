<?php
$msg_id = $_GET["id"];
$link = @mysqli_connect('localhost', 'root', '', 'laptop');
$sql = "update `message_board` set alert=1 where msg_Id='$msg_id';";
$result = mysqli_query($link, $sql);

$sql = "SELECT article.type_id,message_board.arti_id FROM `message_board`
        INNER JOIN article on message_board.arti_id=article.arti_Id
        where msg_Id='$msg_id';";
$result = mysqli_query($link, $sql);
while ($rows = mysqli_fetch_array($result, MYSQLI_NUM)) {
    if ($rows[0] == 1) {
        $urlLink = "http://localhost:8080/mid-web/forumques.php?msg=edit&id={$rows[1]}";
    } else if ($rows[0] == 2) {
        $urlLink = "http://localhost:8080/mid-web/forumexper.php?msg=edit&id={$rows[1]}";
    }
}
echo "<script>alert('檢舉成功 等待管理員查核！'); location.href = '$urlLink';</script>";
