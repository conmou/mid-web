function resetLabels() {
    var all_rbl = $("input[type=radio]");
    all_rbl.each(function () {
        var rbl_name = $(this).attr("name");
        $("input[type=radio][name*='" + rbl_name + "']").attr("checked", false)
    });
}