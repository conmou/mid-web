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
if (isset($_GET["msg"])) {
    $action = $_GET["msg"];
}
if (isset($_GET["member"])) {
    $member = $_GET["member"];
}
if (isset($_POST["msg_content"])) {
    $msg_content = $_POST["msg_content"];
}
/*if (isset($_GET["show"])) {
    $show = $_GET["show"];
}*/

switch ($action) {
    case "edit":
        $todos = $conn->prepare("SELECT m_Id,title,content,post_time FROM article WHERE arti_Id=:id");
        //$todos->bindValue(':id',$id);
        $todos->execute(["id" => $id]);
        $todo = $todos->fetch();
        /*$todos=$conn->query("SELECT title FROM todos WHERE id=$id");
        $todo=$todos->fetch();
        $title = $todo['title'];
        $content = $todo['content'];*/
        break;
    case "insert":
        $todos = $conn->prepare("INSERT message_board(m_id,arti_id,content) VALUES(:member,:id,:msg_content)");
        $todos->execute(["member" => $member, "id" => $id, "msg_content" => $msg_content]);
        header("Location: ../forumques.php?msg=edit&id=$id");
        break;
}

/*switch ($show) {
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
}*/
/*
if(isset($_POST['title'])){
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

    $title=$_POST['title'];
    //echo $title;

    if(empty($title)){
        header("Location: ../forumques.php?mess=error");
    }
    else{
        $stmt=$conn->prepare("INSERT INTO message_board(mid,content) VALUES(?,?)");
        $res=$stmt->execute([$title]);

        if($res){
            header("Location: ../forumques.php?mess=success");
        }
        else{
            header("Location: ../forumques.php");
        }
        $conn=null;
        exit();
    }
}
else{
    header("Location: ../forumques.php?mess=error");
}*/
