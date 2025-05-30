package ship.iu.dao;
import java.util.List;
import ship.iu.model.ReviewModel;

public interface IReviewDao {

    void addReview(ReviewModel review);
    void deleteReview(ReviewModel review);
    void editReview(ReviewModel review);
    List<ReviewModel> getReviewsByProductId(int productId);

}
