package ship.iu.Services.Implement;
import ship.iu.Services.IReviewService;
import ship.iu.dao.IReviewDao;
import ship.iu.dao.impl.ReviewDaoImpl;
import ship.iu.model.ReviewModel;
import java.util.List;
public class ReviewServiceImpl implements IReviewService {
    private IReviewDao reviewDao = new ReviewDaoImpl();
    @Override
    public void addReview(ReviewModel review) {
        reviewDao.addReview(review);
    }

    @Override
    public void deleteReview(ReviewModel review) {
        reviewDao.deleteReview(review);

    }

    @Override
    public void editReview(ReviewModel review) {
        reviewDao.editReview(review);
    }

    @Override
    public List<ReviewModel> getReviewsByProductId(int productId) {
        return reviewDao.getReviewsByProductId(productId);
    }

}
