function addToCart(event) {
  event.preventDefault();

  const form = event.target;
  const quantityInput = form.querySelector("input[name='quantity']").value;
  if (!quantityInput || isNaN(quantityInput) || parseInt(quantityInput, 10) <= 0) {
    alert('Please enter a valid quantity.');
    return false;
  }
  const formData = new FormData(form);
  formData.set('quantity', quantityInput);
  console.log("Form data before submission:", Object.fromEntries(formData.entries()));

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