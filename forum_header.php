<header>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #44546A!important;">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <a class="navbar-brand" href="http://localhost:8080/mid-web/user_page.php"><img src="img/Logo.svg" style="width: 60px; height: 60px;"></a>
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <p>&nbsp&nbsp&nbsp</p>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/mid-web/user_page.php">
                        <i class="bi bi-search"></i> 找筆電&nbsp&nbsp&nbsp</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/mid-web/forumques.php">
                        <i class="bi bi-chat-square-dots"></i> 討論區&nbsp&nbsp&nbsp</a>
                </li>

                <?php
                if (!empty($acc)) {
                    echo '
                  <li class="nav-item">
                     <a class="nav-link" href="http://localhost:8080/mid-web/favorite_page.php">
                     <i class="bi bi-star-fill"></i> 我的收藏</a>
                  </li>
                  <p>&nbsp&nbsp&nbsp</p>';
                    if ($acc == "manager1") {
                        echo '
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/mid-web/manager_page.php">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-wrench-adjustable-circle" viewBox="0 0 16 16">
                            <path d="M12.496 8a4.491 4.491 0 0 1-1.703 3.526L9.497 8.5l2.959-1.11c.027.2.04.403.04.61Z"/>
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0Zm-1 0a7 7 0 1 0-13.202 3.249l1.988-1.657a4.5 4.5 0 0 1 7.537-4.623L7.497 6.5l1 2.5 1.333 3.11c-.56.251-1.18.39-1.833.39a4.49 4.49 0 0 1-1.592-.29L4.747 14.2A7 7 0 0 0 15 8Zm-8.295.139a.25.25 0 0 0-.288-.376l-1.5.5.159.474.808-.27-.595.894a.25.25 0 0 0 .287.376l.808-.27-.595.894a.25.25 0 0 0 .287.376l1.5-.5-.159-.474-.808.27.596-.894a.25.25 0 0 0-.288-.376l-.808.27.596-.894Z"/>
                        </svg> 後台管理</a>
                    </li>
                    ';
                    }
                }
                ?>
            </ul>
            <?php

            $link = @mysqli_connect('localhost', 'root', '', 'laptop');
            $sql = "SELECT img_name FROM member WHERE m_Id='$acc'";
            $result = mysqli_query($link, $sql);
            if (!empty($acc)) {
                // echo '<div style="border-style:solid;border-color:#d9d9d9;width:auto;color:#ffffff;padding:0.5% 2.5%;">';
                // echo "<a id='link' href='http://localhost:8080/mid-web/user_info_page.php'> 會員帳號：$acc</a></div>";
                // echo '
                // <a style="float: right; list-style:none;margin: 5px 15px; color:white;
                //    border-radius: 20px;width:3%!important;" href="http://localhost:8080/mid-web/logout_page.php">
                // <img src="img/logout.png" alt="logout" style="width:100%!important;">
                // </a>';
                if ($rows = mysqli_fetch_assoc($result)) {
                    $img_name = $rows['img_name'];
                    echo '<div class="imagePreview" style="background: url(uploads/$img_name) no-repeat center/cover;">';
                } else {
                    echo '<div class="imagePreview"></div>';
                }
                echo '
               <div class="dropdown">
                  <button class="btn" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border-radius: 50%;padding:0%;outline:none !important;">
                  ';
                // dropdown-toggle (class 新增▼符號)
                if (!empty($img_name)) {
                    echo "<img class='user_info_img_btn' src='uploads/$img_name'>";
                } else {
                    echo '<i class="bi bi-person-circle" style="color:white;font-size:3vw!important;margin-right:0.3vw!important;"></i>';
                }
                echo '
               </button>
                  <div class="dropdown-menu dropdown-menu-lg-right" style="font-size:1.75vw;" aria-labelledby="dropdownMenuButton">';
                echo "<a class='dropdown-header' style='font-size:1.8vw;.color:#6c757d !important;'> 會員帳號／$acc</a>";


                echo '<div class="dropdown-divider"></div>';
                // <i class='bi bi-person-circleb'></i>
                echo '
                     <a class="dropdown-item bi bi-person-circleb" href="http://localhost:8080/mid-web/user_info_page.php">
                     <i class="bi bi-pen"></i>
                     編輯個人資訊</a>';
                echo '
                     <a class="dropdown-item shake shake_background" href="http://localhost:8080/mid-web/logout_page.php">
                     <i class="bi bi-box-arrow-right"></i>
                     登出</a>
                  </div>
               </div>';
            } else {
                echo '
               <a id="link" class="nav-link" href="http://localhost:8080/mid-web/login_page.php">登入</a>
               <a id="link" class="nav-link" href="http://localhost:8080/mid-web/register_page.php">註冊</a>
                  ';
            }
            ?>

        </div>
    </nav>
    <!-- feather script-->
    <script>
        feather.replace()
    </script>
    <!-- feather script-->
</header>