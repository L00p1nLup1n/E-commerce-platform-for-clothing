package ship.iu.Services;

import java.util.List;

import ship.iu.model.ReviewModel;

public interface IReviewService {

    void deleteAllReviewFromProduct(int productId);
    void addReview(ReviewModel review);
    void deleteReview(ReviewModel review);
    void editReview(ReviewModel review);
    List<ReviewModel> getReviewsByProductId(int productId);

}
