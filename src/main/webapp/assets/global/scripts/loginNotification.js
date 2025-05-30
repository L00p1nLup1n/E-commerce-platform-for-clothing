document.addEventListener('DOMContentLoaded', function() {
    var loginLink = document.querySelector('.login-noti');
    if (loginLink) {
        loginLink.addEventListener('click', function(event) {
            event.preventDefault();
            alert('Please log in to add items to your cart.');
            window.location.href = loginLink.href;
        });
    }
});