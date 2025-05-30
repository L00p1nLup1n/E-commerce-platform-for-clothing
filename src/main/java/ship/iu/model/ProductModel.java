package ship.iu.model;

import java.io.Serializable;
import java.util.Objects;

public class ProductModel implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;
    private String categoryname;
    private String name;
    private String image;
    private int status; // 0: inactive, 1: active
    private double price;   
    private String description;
    private int quantity;
    private int reviewcount;
    private double avgRating;

    public ProductModel() {
    }

    public ProductModel(int id, String categoryname, String name, String image, int status, double price, String description, int quantity, int reviewcount, double avgRating) {
        this.id = id;
        this.categoryname = categoryname;
        this.name = name;
        this.image = image;
        this.status = status;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.reviewcount = reviewcount > 0 ? reviewcount : 0;
        this.avgRating = avgRating >= 0 ? avgRating : 0.0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    } 
    
    public int getReviewcount() {
        return reviewcount;
    }

    public void setReviewcount(int reviewcount) {
        this.reviewcount = reviewcount;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public double getAvgRating() {
        return avgRating;
    }

    public void setAvgRating(double avgRating) {

        this.avgRating = avgRating;
    }

    public void incrementQuantity() {
        this.quantity++;
    }

    public void decrementQuantity() {
        if (this.quantity > 0) {
            this.quantity--;
        }
    }

    public double getSubtotal() {
        return this.price * this.quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ProductModel product = (ProductModel) o;
        return id == product.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, categoryname, name, image, status, price, description, quantity, reviewcount, avgRating);
    }
}
