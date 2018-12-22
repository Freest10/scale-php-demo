document.addEventListener("DOMContentLoaded", ready);

function ready() {
 var ordering = new Ordering();
 ordering.init();
}

function Ordering(){
}

Ordering.prototype.init = function () {
    this.name = new mdc.textField.MDCTextField(document.getElementById('name-ordering'));
    this.phone = new mdc.textField.MDCTextField(document.getElementById('phone-ordering'));
    this.buttonSend = new mdc.ripple.MDCRipple(document.querySelector('#checkout-ordering'));
    this.buttonSend.listen('click', this.send.bind(this));
    this.buttonSend.root_.disabled = true;

    this.name.listen('input', this.validateSend.bind(this));
    this.phone.listen('input', this.validateSend.bind(this));
}

Ordering.prototype.send = function (callback) {
    const snackbar = new mdc.snackbar.MDCSnackbar(document.querySelector('#info-snack'));

    const dataSuccessAuth = {
        message: 'Success',
        actionText: 'Your order has arrived for processing',
        timeout: 2000,
        actionHandler: function () {
        }
    };

    var self = this;
    fetch('?xhrRequestType=ordering-response' + this.getRequestParams())
        .then(function (response) {
            if (!response.ok) {
                var json = response.json();
                return json.then(function (err) {
                    throw err
                });
            }
        })
        .then(function () {
            snackbar.show(dataSuccessAuth);
            setTimeout(function () {
                window.location = '/'
            }, 2000)
        }, function (json) {
            dataErrorRegistration = {
                message: 'Error',
                actionText: json.description,
                timeout: 2000,
                actionHandler: function () {
                }
            };

            snackbar.show(dataErrorRegistration);
        })
}

Ordering.prototype.validateSend = function () {
    if (this.phone.value && this.name.value) {
        this.buttonSend.root_.disabled = false;
    } else {
        this.buttonSend.root_.disabled = true;
    }
};

Ordering.prototype.getRequestParams = function () {
    var params = '';
    params += '&name=';
    params += this.name.value;
    params += '&phone=';
    params += this.phone.value;

    return params;
}