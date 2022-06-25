<?php
$sName="localhost";
$uName="root";
$pass="";
$db_name="laptop";

try{
    $conn=new PDO("mysql:host=$sName;dbname=$db_name",$uName,$pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    $conn->query("SET NAMES utf8");
    //echo "成功";
}
catch(PDOException $e){
    echo "連結失敗 : ". $e->getMessage();
}
if(isset($_GET["id"])){
    $id=$_GET["id"];
}
if(isset($_GET["action"])){
    $action=$_GET["action"];
}
switch($action){
    case "update":
        $title=$_POST["title"];
        $content=$_POST["content"];
        $todos=$conn->prepare("UPDATE article SET title=:title,content=:content WHERE arti_Id=:id ");
        //$todos->bindValue(':id',$id,':title',$title);
        $todos->execute(["id"=>$id,"title"=>$title,"content"=>$content]);
        //$todos=$conn->query("UPDATE todos SET title=$title WHERE id=$id");
        header("Location: ../forumexper.php");
        break;
    case "edit":
        $todos=$conn->prepare("SELECT article.*,member.img_name FROM article,member WHERE member.m_Id=article.m_Id and arti_Id=:id");
        //$todos->bindValue(':id',$id);
        $todos->execute(["id"=>$id]);
        $todo=$todos->fetch();
        /*$todos=$conn->query("SELECT title FROM todos WHERE id=$id");
        $todo=$todos->fetch();*/
        $title=$todo['title'];
        $content=$todo['content'];
        break;
}
?>