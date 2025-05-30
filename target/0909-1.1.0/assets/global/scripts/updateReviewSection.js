function updateReviewSection() {
    const reviewSection = document.getElementById('reviews');
    if (!reviews) return;

    const reviewCount = parseInt(document.querySelector('.product-rating'), 10);
    const reviews = document.querySelectorAll('.review');

    reviews.forEach((review, index) => {
        if (index < reviewCount) {
            review.style.display = 'block';
        } else {
            review.style.display = 'none';
        }
    });

    // Update the visibility of the "Show More" button
    const showMoreButton = document.getElementById('showMoreReviews');
    if (reviewCount < reviews.length) {
        showMoreButton.style.display = 'block';
    } else {
        showMoreButton.style.display = 'none';
    }
}
