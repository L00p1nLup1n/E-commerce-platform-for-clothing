package ship.iu.model;

import java.io.Serializable;
import java.util.Date;

public class ReviewModel implements Serializable {

    private static final long serialVersionUID = 1L;
    private int id;
    private int productId;
    private int userId;
    private String username;
    private int rating;
    private String comment;
    private Date reviewDate;

    public ReviewModel() {
    }
    //For creating a review without an ID (e.g., when adding a new review)
    public ReviewModel(int productId, int userId, String username, int rating, String comment, Date reviewDate) {
        this.productId = productId;
        this.userId = userId;
        this.username = username;
        this.rating = rating;
        this.comment = comment;
        this.reviewDate = reviewDate;
    }
    //For creating a review with an ID (e.g., when retrieving from the database)
    public ReviewModel(int id, int productId, int userId, String username, int rating, String comment, Date reviewDate) {
        this.id = id;
        this.productId = productId;
        this.userId = userId;
        this.username = username;
        this.rating = rating;
        this.comment = comment;
        this.reviewDate = reviewDate;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getproductId() {
        return productId;
    }
    public void setproductId(int productId) {
        this.productId = productId;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public int getRating() {
        return rating;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }
    public Date getReviewDate() {
        return reviewDate;
    }
    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }


}