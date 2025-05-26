function addToCart(event) {
  event.preventDefault();

  const form = event.target;
  const formData = new FormData(form);
  const params = new URLSearchParams(formData);

  fetch(form.getAttribute("action"), {
    method: 'POST',
    body: params,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  })
  .then(response => response.text())
  .then(data => {
    updateCartPreview(data);
    alert('Added to cart!');
  })
  .catch(error => {
    alert('Error: ' + error);
  });

  return false;
}