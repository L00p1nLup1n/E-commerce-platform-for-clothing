window.onload = function() {
    const params = new URLSearchParams(window.location.search);
    if (params.get('error') === 'empty') {
        alert('Checkout failed because your cart is empty');
    }
};