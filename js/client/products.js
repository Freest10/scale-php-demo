document.addEventListener("DOMContentLoaded", ready);

function ready() {
    var filter = new Filter();
    filter.init();
    filter.callbackOnSendFn = function () {
        basket.init();
    }
}

/*---------- Filter -----------*/
function Filter() {
}

Filter.prototype.init = function () {
    this.minPrice = new mdc.textField.MDCTextField(document.getElementById('min-price'));
    this.maxPrice = new mdc.textField.MDCTextField(document.getElementById('max-price'));
    this.errorsBlock = document.getElementById('filter-range-errors');
    this.select = new mdc.select.MDCSelect(document.querySelector('#country'));

    this.minPrice.listen('keydown', this.changeRangeValue.bind(this));
    this.maxPrice.listen('keydown', this.changeRangeValue.bind(this));

    const buttonApply = document.querySelector('#apply-filter');
    buttonApply.addEventListener('click', this.updateFilter.bind(this));

    const buttonReset = document.querySelector('#reset-filter');
    buttonReset.addEventListener('click', this.resetFilter.bind(this));
}

Filter.prototype.setCallBackOnSendFilter = function (callback) {
    this.callbackOnSendFn = callback;
}

Filter.prototype.updateFilter = function () {
    if (!this.isValidRange()) {
        return true;
    }

    var self = this;
    fetch('?xhrRequestType=filter' + this.getRequestParams())
        .then(function (response) {
            return response.text()
        })
        .then(function (html) {
            var productsBlock = document.getElementById('products-wrap');
            productsBlock.innerHTML = html;
            if (typeof self.callbackOnSendFn === 'function') {
                self.callbackOnSendFn();
            }
        });
}

Filter.prototype.resetFilter = function () {
    this.select.value = null;
    this.minPrice.value = null;
    this.maxPrice.value = null;
    this.updateFilter();
}

Filter.prototype.getRequestParams = function () {
    var params = '';
    if (this.select.value) {
        params += '&country=' + this.select.value;
    }

    if (this.minPrice.value) {
        params += '&price_min=' + this.minPrice.value;
    }

    if (this.maxPrice.value) {
        params += '&price_max=' + this.maxPrice.value;
    }

    return params;
}

Filter.prototype.isValidRange = function () {
    if (this.minPrice.value && this.maxPrice.value && Number(this.minPrice.value) > Number(this.maxPrice.value)) {
        this.errorsBlock.innerText = 'Min could not be more than max';
        return false;
    }

    if (Number(this.minPrice.value) < 0 || Number(this.maxPrice.value) < 0) {
        this.errorsBlock.innerText = 'Price could not be less then 0';
        return false;
    }

    return true;
}

Filter.prototype.changeRangeValue = function () {
    this.errorsBlock.innerText = null;
}

/*---------- Filter -----------*/
