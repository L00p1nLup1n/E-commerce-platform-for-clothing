function removeProduct(path, productId) {
  if (
    !confirm("Are you sure you want to remove this product from your cart?")
  ) {
    return;
  }
  let form = document.createElement("form");
  form.method = "POST";
  form.action = path;

  let actionInput = document.createElement("input");
  actionInput.type = "hidden";
  actionInput.name = "action";
  actionInput.value = "remove";
  form.appendChild(actionInput);

  let productInput = document.createElement("input");
  productInput.type = "hidden";
  productInput.name = "productId";
  productInput.value = productId;
  form.appendChild(productInput);

  document.body.appendChild(form);
  form.submit();
}
