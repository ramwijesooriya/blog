// validation.js
function validateForm() {
    var usernameField = document.getElementById('username');
    var passwordField = document.getElementById('password');

    var username = usernameField.value;
    var password = passwordField.value;

    if (username.trim() === '' || password.trim() === '') {
        alert('Username and password are required.');
        return false;
    }

    return true;
}