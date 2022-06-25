<?php
$sName = "localhost";
$uName = "root";
$pass = "";
$db_name = "laptop";

try {
    $conn = new PDO("mysql:host=$sName;dbname=$db_name", $uName, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->query("SET NAMES utf8");
    //echo "成功";
} catch (PDOException $e) {
    echo "連結失敗 : " . $e->getMessage();
}
if (isset($_GET["id"])) {
    $id = $_GET["id"];
}
if (isset($_GET["show"])) {
    $show = $_GET["show"];
}

switch ($show) {
    case "update":
        $content = $_POST["content"];
        $todos = $conn->prepare("UPDATE message_board SET content=:content WHERE arti_id=:id ");
        //$todos->bindValue(':id',$id,':title',$title);
        $todos->execute(["id" => $id , "content" => $content]);
        //$todos=$conn->query("UPDATE todos SET title=$title WHERE id=$id");
        header("Location: ../forumques.php");
        break;
    case "msgedit":
        $todos = $conn->prepare("SELECT m_id,content,post_time FROM message_board WHERE arti_id=:id");
        //$todos->bindValue(':id',$id);
        $todos->execute(["id" => $id]);
        $todo = $todos->fetch();
        //$todos=$conn->query("SELECT title FROM todos WHERE id=$id");
            //$todo=$todos->fetch();
        $content = $todo['content'];
        break;
}
