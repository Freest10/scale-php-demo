document.addEventListener("DOMContentLoaded", ready);

function ready() {
    var passwordRecovery = new PasswordRecovery();
    passwordRecovery.init();
}

/*---------- Filter -----------*/
function PasswordRecovery() {
}

PasswordRecovery.prototype.init = function () {
    this.password = new mdc.textField.MDCTextField(document.getElementById('password-recovery'));
    this.confirmPassword = new mdc.textField.MDCTextField(document.getElementById('confirm-password-recovery'));
    this.hash = document.querySelector('#password-recovery-hash').value;
    this.buttonSend = new mdc.ripple.MDCRipple(document.querySelector('#do_recovery_password'));
    this.buttonSend.listen('click', this.send.bind(this));

    this.password.listen('input', this.validateSend.bind(this));
    this.confirmPassword.listen('input', this.validateSend.bind(this));
}

PasswordRecovery.prototype.setCallBackOnSendFilter = function (callback) {
    this.callbackOnSendFn = callback;
}

PasswordRecovery.prototype.validateSend = function () {
    if (this.password.value && this.confirmPassword.value && this.hash) {
        this.buttonSend.root_.disabled = false;
    } else {
        this.buttonSend.root_.disabled = true;
    }
};

PasswordRecovery.prototype.send = function (callback) {
    const snackbar = new mdc.snackbar.MDCSnackbar(document.querySelector('#info-snack'));

    const dataSuccessAuth = {
        message: 'Success',
        actionText: 'You can login using the new password',
        timeout: 2000,
        actionHandler: function () {
        }
    };

    var self = this;
    fetch('?xhrRequestType=password-recovery-new-password' + this.getRequestParams())
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

PasswordRecovery.prototype.getRequestParams = function () {
    var params = '';
    params += '&password=';
    params += this.password.value;
    params += '&confirm_password=';
    params += this.confirmPassword.value;
    params += '&user_hash=';
    params += this.hash;

    return params;
}