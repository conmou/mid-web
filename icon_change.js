$("#more_option").click(function () {
    var x = $("#radio")
    if (x.css("display") == "none") {
        x.slideDown();
    } else {
        x.slideUp();
    };
});