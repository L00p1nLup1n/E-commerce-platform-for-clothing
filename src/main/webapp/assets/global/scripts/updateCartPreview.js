function updateCartPreview(data) {
  console.log("Received data:", data); // Debug log
  const [uniqueCount, totalPrice, itemsString] = data.split("|");
  const scroller = document.querySelector(".top-cart-content .scroller");
  if (uniqueCount !== undefined && totalPrice !== undefined) {
    document.getElementById("cart-count").textContent =
      uniqueCount + " item(s)";
    document.getElementById("cart-price").textContent =
      "$" + parseFloat(totalPrice).toFixed(2);
    if (!scroller) {
      console.warn("No .top-cart-content .scroller found");
      return;
    }

    if (itemsString && itemsString.trim() !== "") {
      const items = itemsString.split(";").filter(Boolean);
      console.log("Items:", items); // Debug log
      let html = "";
      items.forEach((item) => {
        const [name, qty, price] = item.split(",");
        const subtotal = parseFloat(price) * parseInt(qty, 10);
        html += `
        <li style="display: flex; justify-content: space-around; align-items: center;">
          <a href="shop-item.html">${name}</a>
          <div>Quant: ${qty}</div>
          <div>Price: ${subtotal.toFixed(2)}</div>
        </li>
      `;
      });
      scroller.innerHTML = html;
    } else {
      scroller.innerHTML = `
      <li>
        <span class="cart-content-count"></span>
        <strong>
          <a href="shop-item.html">No items in cart right now</a>
        </strong>
      </li>
    `;
    }
  }
}
