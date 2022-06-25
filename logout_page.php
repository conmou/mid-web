<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    header("Content-Type:text/html; charset=utf-8");
    session_start();
    unset($_SESSION['acc']);
    unset($_SESSION['pwd']);
    session_destroy();
    header("Location:http://localhost:8080/mid-web/user_page.php");
    ?>
</body>

</html>