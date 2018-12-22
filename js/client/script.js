document.addEventListener("DOMContentLoaded", ready);

var CornerBit = Object.freeze({
    BOTTOM: 1,
    CENTER: 2,
    RIGHT: 4,
    FLIP_RTL: 8
});

var Corner = Object.freeze({
    TOP_LEFT: 0,
    TOP_RIGHT: CornerBit.RIGHT,
    BOTTOM_LEFT: CornerBit.BOTTOM,
    BOTTOM_RIGHT: CornerBit.BOTTOM | CornerBit.RIGHT,
    TOP_START: CornerBit.FLIP_RTL,
    TOP_END: CornerBit.FLIP_RTL | CornerBit.RIGHT,
    BOTTOM_START: CornerBit.BOTTOM | CornerBit.FLIP_RTL,
    BOTTOM_END: CornerBit.BOTTOM | CornerBit.RIGHT | CornerBit.FLIP_RTL
});

var basket = new Basket();

function ready() {
    /*--------- Main menu ---------*/
    var mainMenu = new MainMenu();
    mainMenu.init();
    /*--------- Sign In ---------*/

    /*--------- Main slider ---------*/
    var mainSlider = tns({
        container: '#main-slider',
        items: 1,
        touch: true,
        autoplay: true,
        swipeAngle: true,
        autoplayHoverPause: true,
        nav: false,
        autoplayButton: false,
        autoplayButtonOutput: false,
        speed: 400
    });

    if (mainSlider) {
        var info = mainSlider.getInfo();
        info.controlsContainer.firstChild.classList.add('material-icons');
        info.controlsContainer.firstChild.classList.add('mdc-list-item__graphic');
        info.controlsContainer.firstChild.innerHTML = 'keyboard_arrow_left';

        info.controlsContainer.lastChild.classList.add('material-icons');
        info.controlsContainer.lastChild.classList.add('mdc-list-item__graphic');
        info.controlsContainer.lastChild.innerHTML = 'keyboard_arrow_right';

        /*---------------------Send message-------------------------------*/
        var sendMessage= new SendMessage();
        sendMessage.init();
    }
    /*--------- Main slider ---------*/

    /*-----------Authorization---------------------*/
    var authDialog = new Authorization();
    authDialog.init();
    authDialog.callbackOnUpdateToolbarFn = function () {
        mainMenu.init();
        setCallbackLogout();
        setCallbackShowAuthButton();
    }

    setCallbackLogout();
    setCallbackShowAuthButton();

    function setCallbackLogout() {
        mainMenu.callbackOnLogOutFn = function () {
            authDialog.logOut();
        }
    }

    function setCallbackShowAuthButton() {
        mainMenu.callbackOnShowAuthFn = function () {
            authDialog.open();
        }
    }

    var recoveryPassword = new RecoveryPassword();
    recoveryPassword.init();

    authDialog.callbackOnForgotPasswordFn = function () {
        authDialog.close();
        recoveryPassword.open();
    }

    basket.init();

    var search = new Search();
    search.init();
}

/*----------------Main menu-------------------*/
function MainMenu() {
}

MainMenu.prototype.init = function () {
    var menuEl = document.querySelector('#user-toolbar');
    var menu = new mdc.menu.MDCMenu(menuEl);
    var menuButtonEl = document.querySelector('.user-toolbar-button');
    menuButtonEl.addEventListener('click', function () {
        menu.open = !menu.open;
        if (menu.open) {
            menuEl.classList.add('mdc-menu--animating-open');
        }
    });
    menuEl.addEventListener('MDCMenu:selected', function (evt) {
        var detail = evt.detail;
    });

    var self = this;
    var logoutElement = document.querySelector('#logout');
    if (logoutElement) {
        logoutElement.addEventListener('click', function () {
            if (typeof self.callbackOnLogOutFn === 'function') {
                self.callbackOnLogOutFn();
            }
        })
    }

    var showAuthButton = document.querySelector('.auth-form');
    if (showAuthButton) {
        showAuthButton.addEventListener('click', function () {
            if (typeof self.callbackOnShowAuthFn === 'function') {
                self.callbackOnShowAuthFn();
            }
        })
    }

    menu.setAnchorCorner(Corner.BOTTOM_RIGHT);
    menu.quickOpen = true;
}

/*----------------Auth--------------*/
function Authorization() {
}

Authorization.prototype.init = function () {
    this.dialog = mdc.dialog.MDCDialog.attachTo(document.querySelector('#mdc-dialog-auth'));
    this.login = new mdc.textField.MDCTextField(document.querySelector('#auth-login'));
    this.password = new mdc.textField.MDCTextField(document.querySelector('#auth-password'));
    this.acceptButton = new mdc.ripple.MDCRipple(document.querySelector('#do_auth'));
    this.forgotPasswordElement = document.querySelector('#forgot-password-link');

    this.validateAccept();

    var self = this;
    this.acceptButton.listen('click', function (event) {
        self.auth();
    });

    this.login.listen('input', function () {
        self.validateAccept();
    });

    this.password.listen('input', function () {
        self.validateAccept();
    })

    this.forgotPasswordElement.addEventListener('click', function () {
        if (typeof self.callbackOnForgotPasswordFn === 'function') {
            self.callbackOnForgotPasswordFn();
        }
    })
}

Authorization.prototype.validateAccept = function () {
    if (this.login.value && this.password.value) {
        this.acceptButton.root_.disabled = false;
    } else {
        this.acceptButton.root_.disabled = true;
    }
}

Authorization.prototype.open = function () {
    this.dialog.show();
}

Authorization.prototype.close = function () {
    this.dialog.destroy();
}

Authorization.prototype.auth = function () {
    const snackbar = new mdc.snackbar.MDCSnackbar(document.querySelector('#info-snack'));

    const dataSuccessAuth = {
        message: 'Success',
        actionText: 'You have successfully authorized!',
        timeout: 2000,
        actionHandler: function () {
        }
    };

    var self = this;
    fetch('?xhrRequestType=auth' + this.getRequestParams())
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
            self.updateToolbar();
            self.dialog.destroy();
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

Authorization.prototype.updateToolbar = function () {
    var self = this;
    fetch('?xhrRequestType=header-toolbar')
        .then(function (response) {
            return response.text()
        })
        .then(function (html) {
            var productsBlock = document.getElementById('header-toolbar');
            productsBlock.innerHTML = html;
            if (typeof self.callbackOnUpdateToolbarFn === 'function') {
                self.callbackOnUpdateToolbarFn();
            }
        });
}

Authorization.prototype.logOut = function () {
    var self = this;
    fetch('?xhrRequestType=logout')
        .then(function (response) {
            return self.updateToolbar()
        });
}

Authorization.prototype.getRequestParams = function () {
    var params = '';

    params += '&login=';
    params += this.login.value;
    params += '&password=';
    params += this.password.value;

    return params;
}

/*----------------Recovery password--------------*/
function RecoveryPassword() {
}

RecoveryPassword.prototype.init = function () {
    this.dialog = mdc.dialog.MDCDialog.attachTo(document.querySelector('#mdc-dialog-password-recovery'));
    this.email = new mdc.textField.MDCTextField(document.querySelector('#email-recovery'));
    this.sendButton = new mdc.ripple.MDCRipple(document.querySelector('#do_recovery'));
    this.validateAccept();

    var self = this;
    this.sendButton.listen('click', function (event) {
        self.doRecovery();
    })

    this.email.listen('input', function () {
        self.validateAccept();
    })
}

RecoveryPassword.prototype.open = function () {
    this.dialog.show();
}

RecoveryPassword.prototype.doRecovery = function () {
    const snackbar = new mdc.snackbar.MDCSnackbar(document.querySelector('#info-snack'));

    const dataSuccessAuth = {
        message: 'Success',
        actionText: 'Password recovery link sent to e-mail',
        timeout: 2000,
        actionHandler: function () {
        }
    };

    var self = this;
    fetch('?xhrRequestType=password-recovery' + this.getRequestParams())
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
            self.dialog.destroy();
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

RecoveryPassword.prototype.getRequestParams = function () {
    var params = '';
    params += '&email=';
    params += this.email.value;

    return params;
}

RecoveryPassword.prototype.validateAccept = function () {
    this.sendButton.root_.disabled = !this.email.value;
}

/*------------------------Basket-----------------------------*/
function Basket() {
}

Basket.prototype.init = function () {
    this.addToBasketButton = document.querySelectorAll('.add-to-basket');
    var self = this;
    this.addToBasketButton.forEach(function (selector) {
        selector.addEventListener('click', function (event) {
            self.addToBasket(event.target.dataset.id)
        })
    })

    this.updateEvent();
}

Basket.prototype.updateEvent = function () {
    this.addCountButtons = document.querySelectorAll('#basket .add-count-product');
    this.removeCountButtons = document.querySelectorAll('#basket .remove-count-product');
    this.deleteProductButtons = document.querySelectorAll('#basket .delete-product');
    var self = this;
    this.addCountButtons.forEach(function (selector) {
        selector.addEventListener('click', function (event) {
            self.addCountToBasket(event.target.dataset.id, event.target.dataset.count)
        })
    });

    this.removeCountButtons.forEach(function (selector) {
        selector.addEventListener('click', function (event) {
            self.removeCountToBasket(event.target.dataset.id, event.target.dataset.count)
        })
    })

    this.deleteProductButtons.forEach(function (selector) {
        selector.addEventListener('click', function (event) {
            self.deleteProductFromBasket(event.target.dataset.id)
        })
    })
}

Basket.prototype.addCountToBasket = function (id, count) {
    const products = Array.from(this.addCountButtons).map(function (selector) {
        const selectorProductId = selector.dataset.id;
        return {productId: selectorProductId, amount: selectorProductId === id ? +count + 1 : selector.dataset.count}
    });
    this.updateBasketProducts(products);
}

Basket.prototype.removeCountToBasket = function (id, count) {
    const products = Array.from(this.removeCountButtons).map(function (selector) {
        const selectorProductId = selector.dataset.id;
        return {productId: selectorProductId, amount: selectorProductId === id ? +count - 1 : selector.dataset.count}
    });
    this.updateBasketProducts(products);
}

Basket.prototype.deleteProductFromBasket = function (id) {
    const products = Array.from(this.removeCountButtons).filter(function (selector) {
        return selector.dataset.id !== id
    })
        .map(function (selector) {
            return {productId: selector.dataset.id, amount: selector.dataset.count}
        });

    this.updateBasketProducts(products);
}

Basket.prototype.updateBasketProducts = function (products) {
    var self = this;
    fetch('?xhrRequestType=update-basket', {
        method: 'POST',
        headers: {
            'Accept': 'application/json, application/xml, text/plain, text/html, *.*',
            'Content-Type': 'application/json; charset=utf-8'
        },
        body: JSON.stringify({products: products})
    })
        .then(function () {
            self.updateBasket();
            self.updateTopBasket();
        })
}

Basket.prototype.addToBasket = function (id) {
    const snackbar = new mdc.snackbar.MDCSnackbar(document.querySelector('#info-snack'));

    const dataSuccessAuth = {
        message: 'Success',
        actionText: 'Added to basket',
        timeout: 2000,
        actionHandler: function () {
        }
    };

    var self = this;
    fetch('?xhrRequestType=add-to-basket&id=' + id)
        .then(function (response) {
            if (!response.ok) {
                var json = response.json();
                return json.then(function (err) {
                    throw err
                });
            }
        })
        .then(function () {
            self.updateTopBasket();
            snackbar.show(dataSuccessAuth);
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

Basket.prototype.updateBasket = function () {
    var self = this;
    fetch('?xhrRequestType=get-basket-view')
        .then(function (response) {
            return response.text()
        })
        .then(function (html) {
            document.getElementById('wrap-basket').innerHTML = html;
            self.updateEvent();
        });
}

Basket.prototype.updateTopBasket = function () {
    fetch('?xhrRequestType=get-top-basket-view')
        .then(function (response) {
            return response.text()
        })
        .then(function (html) {
            document.getElementById('top-basket').innerHTML = html;
        });
}

/*----------------------Send message------------------------------*/
function SendMessage(){
}

SendMessage.prototype.init = function () {
    this.name = new mdc.textField.MDCTextField(document.getElementById('name-send-message'));
    this.email = new mdc.textField.MDCTextField(document.getElementById('email-send-message'));
    this.messageSendMessage = new mdc.textField.MDCTextField(document.getElementById('message-send-message'));
    this.buttonSend = new mdc.ripple.MDCRipple(document.querySelector('#do_send_message'));
    this.buttonSend.listen('click', this.send.bind(this));
    this.buttonSend.root_.disabled = true;

    this.name.listen('input', this.validateSend.bind(this));
    this.messageSendMessage.listen('input', this.validateSend.bind(this));
    this.email.listen('input', this.validateSend.bind(this));
}

SendMessage.prototype.send = function (callback) {
    const snackbar = new mdc.snackbar.MDCSnackbar(document.querySelector('#info-snack'));

    const dataSuccessAuth = {
        message: 'Success',
        actionText: 'Your message was successfully sent',
        timeout: 2000,
        actionHandler: function () {
        }
    };

    var self = this;
    fetch('?xhrRequestType=send-message-response' + this.getRequestParams())
        .then(function (response) {
            if (!response.ok) {
                var json = response.json();
                return json.then(function (err) {
                    throw err
                });
            }
        })
        .then(function () {
            self.resetForm();
            self.name.valid = true;
            self.email.valid = true;
            self.messageSendMessage.valid = true;
            snackbar.show(dataSuccessAuth);
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

SendMessage.prototype.validateSend = function () {
    if (this.email.value && this.name.value) {
        this.buttonSend.root_.disabled = false;
    } else {
        this.buttonSend.root_.disabled = true;
    }
};

SendMessage.prototype.resetForm = function () {
    this.email.value = null;
    this.name.value = null;
    this.messageSendMessage.value = null;
    this.buttonSend.root_.disabled = true;
};

SendMessage.prototype.getRequestParams = function () {
    var params = '';
    params += '&name=';
    params += this.name.value;
    params += '&email=';
    params += this.email.value;
    params += '&message=';
    params += this.messageSendMessage.value;

    return params;
}


/*-------------------------Search---------------------------------*/
function Search(){}

Search.prototype.init= function () {
    this.search = new mdc.textField.MDCTextField(document.getElementById('search-string'));
    this.searchShowButton = new mdc.ripple.MDCRipple(document.querySelector('.search-icon'));
    this.searchBlock = document.querySelector('#search-overlay');
    this.searchOverlay = document.querySelector('#search-overlay .overlay');
    this.searchShowButton.listen('click', this.showOverlaySearch.bind(this));
    this.searchOverlay.addEventListener('click', this.hideOverlaySearch.bind(this));
    this.search.listen('keydown', this.goToSearchPage.bind(this));
}

Search.prototype.showOverlaySearch= function () {
    this.searchBlock.style.display = "block";
    document.body.style.overflow = 'hidden'
}

Search.prototype.hideOverlaySearch= function () {
    this.searchBlock.style.display = "none";
    document.body.style.overflow = 'auto'
}

Search.prototype.goToSearchPage= function ($event) {
    if($event.keyCode === 13) {
        window.location.href = '/search?search-string='+this.search.value;
    }
}