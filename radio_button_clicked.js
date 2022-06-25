function enhancedRadio() {
    var r = document.forms[0].elements[this.name];
    for (var i = 0; i < r.length; i++) {
        if (r[i].index != this.index)
            r[i].isChecked = false;
    }
    this.isChecked = !this.isChecked;
    this.checked = this.isChecked;
}
function deployRadioEvent() {
    var f = document.forms[0];
    for (var i = 0; i < f.elements.length; i++) {
        var e = f.elements[i];
        if (e.type == "radio") {
            e.onclick = enhancedRadio;
            e.setAttribute("isChecked", false);
            e.setAttribute("index", i);
        }
    }
}
deployRadioEvent(); 