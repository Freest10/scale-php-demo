document.addEventListener("DOMContentLoaded", ready);

function ready() {
    var registration = new Registration();
    registration.init();
}

function Registration() {
}

Registration.prototype.init = function () {
    this.login = new mdc.textField.MDCTextField(document.querySelector('#registration-login'));
    this.email = new mdc.textField.MDCTextField(document.querySelector('#registration-email'));
    this.password = new mdc.textField.MDCTextField(document.querySelector('#registration-password'));
    this.confirmPassword = new mdc.textField.MDCTextField(document.querySelector('#registration-confirm-password'));

    this.errorsBlock = document.getElementById('registration-errors');

    const buttonSend = document.getElementById('registration-button');
    buttonSend.addEventListener('click', this.registrateAfterErrorCheck.bind(this));
}

Registration.prototype.registrateAfterErrorCheck = function () {
    if (!this.errorCheck()) {
        this.registrate();
    }
}

Registration.prototype.registrate = function () {
    const registrationSnackbar = new mdc.snackbar.MDCSnackbar(document.querySelector('#registration-success'));

    const dataRegistration = {
        message: 'Success',
        actionText: 'You have successfully registered!',
        timeout: 2000,
        actionHandler: function () {
        }
    };

    fetch('?xhrRequestType=registration' + this.getRequestParams())
        .then(function (response) {
            if (!response.ok) {
                var json = response.json();
                return json.then(function (err) {
                    throw err
                });
            }
        })
        .then(function () {
            registrationSnackbar.show(dataRegistration);
            setTimeout(function () {
                window.location.href = '/';
            }, 700)
        }, function (json) {
            dataErrorRegistration = {
                message: 'Error',
                actionText: json.description,
                timeout: 2000,
                actionHandler: function () {
                }
            };

            registrationSnackbar.show(dataErrorRegistration);
        });
}

Registration.prototype.getRequestParams = function () {
    var params = '';

    params += '&login=';
    params += this.login.value;
    params += '&email=';
    params += this.email.value;
    params += '&password=';
    params += this.password.value;
    params += '&confirmPassword=';
    params += this.confirmPassword.value;

    return params;
}

Registration.prototype.errorCheck = function () {
    if (!this.login.value) {
        this.errorsBlock.innerText = 'Enter login';
        return true;
    }

    if (!this.email.value) {
        this.errorsBlock.innerText = 'Enter email';
        return true;
    }

    if (!this.password.value || !this.confirmPassword.value) {
        this.errorsBlock.innerText = 'Enter password';
        return true;
    }

    if (this.password.value && this.password.value !== this.confirmPassword.value) {
        this.errorsBlock.innerText = 'Passwords do not match';
        return true;
    }

    return false;
}

