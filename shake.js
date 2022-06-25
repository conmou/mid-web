<script>
    $(document).ready(function() {
        $(".level1 > a").click(function () {
            $(this).addClass("current") //給當前元素新增"current"樣式
                .next().show() //下一個元素顯示
                .parent().siblings().children("a").removeClass("current")
                //父元素的兄弟元素的子元素<a>移除"current"樣式
                .next().hide(); //它們的下一個元素隱藏
            return false;
        });
      });
</script>