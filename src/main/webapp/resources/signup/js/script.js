const submitBtn = document.querySelector('.submit-btn'),
    phone = document.querySelector('#phone'),
    password = document.querySelector('#user-password'),
    passwordConfirm = document.querySelector('#user-password-confirm'),
    email = document.querySelector('#mail'),
    errorDisplayers = document.getElementsByClassName('error'),
    inputFields = document.querySelectorAll('input'),
    cardContainer = document.querySelector('.card-container'),
    outroOverlay = document.querySelector('.outro-overlay')

let count = 2

function onValidation(current, messageString, booleanTest) {
    let message = current
    message.textContent = messageString
    booleanTest != 0 ? ++count : count
}

