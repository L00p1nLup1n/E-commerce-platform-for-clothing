function validateReviewForm(event) {
  event.preventDefault();
  const form = event.target;

  const ratingInput = form.querySelector("input[name='rating']:checked");
  if (!ratingInput) {
    alert("Please select a rating.");
    return false;
  }

  const formData = new FormData(form);
  console.log(
    "Form data before submission:",
    Object.fromEntries(formData.entries())
  );

  const params = new URLSearchParams(formData);

  fetch(form.getAttribute("action"), {
    method: "POST",
    body: params,
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
  })
    .then((response) => response.text())
    .then((data) => {
      updateReviewSection(data);
      alert("Review submitted successfully!");
    })
    .catch((error) => {
      alert("Error: " + error);
    });

  return false;
}
