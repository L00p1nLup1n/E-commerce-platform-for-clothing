document.querySelectorAll("#categoryList a").forEach(item => {
    item.addEventListener("click", function(event) {
        event.preventDefault();
        let category = this.getAttribute("data-category");
        console.log("Current category fetched: ", category);
        let html = "";
        items.forEach((item) => {
            const [id, name, qty, price] = item.split(",");
            const subtotal = parseFloat(price) * parseInt(qty, 10);
            html += `
            <li style="display: flex; justify-content: space-around; align-items: center;">
            <a href="${contextPath}/products?productid=${id}">${name}</a>
            <div>Quantity: ${qty}</div>
            <div>Price: ${subtotal.toLocaleString("en-US", { minimumFractionDigits: 1, maximumFractionDigits: 3 })}$</div>
            </li>
        `;
        });
        scroller.innerHTML = html;
    });
});
