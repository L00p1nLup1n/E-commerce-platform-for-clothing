function removeProduct(path, productId) {
    let form = document.createElement("form");
    form.method = "POST";
    form.action = path; // Adjust the action path if needed

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
