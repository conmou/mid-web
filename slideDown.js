$("#more_option").click(function () {
    var x = $("#radio")
    if (x.css("display") == "none") {
        x.slideDown();
        $("i[class='bi bi-chevron-down']").toggleClass('bi bi-chevron-down bi bi-chevron-up');
    } else {
        x.slideUp();
        $("i[class='bi bi-chevron-up']").toggleClass('bi bi-chevron-up bi bi-chevron-down');

    };
});