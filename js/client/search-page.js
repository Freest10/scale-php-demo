document.addEventListener("DOMContentLoaded", ready);

function ready() {
    var search = new SearchPage();
    search.init();
}

function SearchPage(){}

SearchPage.prototype.init= function () {
    this.search = new mdc.textField.MDCTextField(document.getElementById('search-string-page'));
};
