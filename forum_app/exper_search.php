<?php
session_start();
if (isset($_POST['title'])) {
    $title = $_POST['title'];
    $_SESSION["title"]=$title;
    if (empty($title)) {
        header("Location: ../forumexper_search.php?seach=error");
    } else {
        header("Location: ../forumexper_search.php?seach=success");
    }
} else {
    header("Location: ../forumexper_search.php?seach=error");
}