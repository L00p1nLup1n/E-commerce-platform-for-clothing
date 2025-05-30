package ship.iu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ship.iu.controller.DBconnectionSQL;
import ship.iu.dao.IReviewDao;
import ship.iu.model.ReviewModel;

public class ReviewDaoImpl extends DBconnectionSQL implements IReviewDao {
    @Override
    public void addReview(ReviewModel review) {
        String sql = "INSERT INTO review (productid, userid, comment, rating, review_date) VALUES (?, ?, ?, ?, NOW())";
        try (Connection conn = super.getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, review.getproductId());
            ps.setInt(2, review.getUserId());
            ps.setString(3, review.getComment());
            ps.setInt(4, review.getRating());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteReview(ReviewModel review) {
        String sql = "DELETE FROM review WHERE reviewid = ?";
        try (Connection conn = super.getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, review.getId());
                ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    public void editReview(ReviewModel review) {
        String sql = "UPDATE review SET comment = ?, rating = ? WHERE reviewid = ?";

        try (Connection conn = super.getConn();
            PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, review.getComment());
                ps.setInt(2, review.getRating());
                ps.setInt(3, review.getId());
                ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    public List<ReviewModel> getReviewsByProductId(int productId) {
        String sql = "SELECT r.reviewid, r.productid, u.id AS userid, u.username, r.rating, r.comment, r.review_date FROM review r JOIN users u ON r.userid = u.id WHERE r.productid = ?;";
        List<ReviewModel> reviews = new ArrayList<>();
        try (Connection conn = super.getConn();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    reviews.add(new ReviewModel(
                        rs.getInt("reviewid"),
                        rs.getInt("productid"),
                        rs.getInt("userid"),
                        rs.getString("username"),
                        rs.getInt("rating"),
                        rs.getString("comment"),
                        rs.getDate("review_date")
                    ));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reviews;
    }
    
}
