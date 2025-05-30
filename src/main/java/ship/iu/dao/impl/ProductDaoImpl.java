package ship.iu.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import ship.iu.controller.DBconnectionSQL;
import ship.iu.dao.IProductDao;
import ship.iu.model.ProductModel;

public class ProductDaoImpl extends DBconnectionSQL implements IProductDao {
    // Implement methods from IProductDao interface here
    // For example:
    
    @Override
    public List<ProductModel> findProductsByCategory(int categoryId) {
        String sql = "SELECT p.productid, p.productname, p.image, p.status, p.price, p.description, p.quantity, p.reviewcount, p.avgRating, c.categoryname FROM product p JOIN categories c ON p.categoryid = c.categoryid WHERE p.categoryid = ?;";
        List<ProductModel> list = new ArrayList<>();
        try (Connection conn = super.getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoryId);   
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new ProductModel(rs.getInt("productid"), rs.getString("categoryname"), rs.getString("productname"), rs.getString("image"), rs.getInt("status"),
                            rs.getDouble("price"), rs.getString("description"), rs.getInt("quantity"), rs.getInt("reviewcount"), rs.getDouble("avgRating")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ProductModel> findAllProducts() {
		String sql = "SELECT p.productid, p.productname, p.image, p.status, p.price, p.description, p.quantity, p.reviewcount, p.avgRating, c.categoryname FROM product p JOIN categories c ON p.categoryid = c.categoryid;";
		List<ProductModel> list = new ArrayList<>();
		try (Connection conn = super.getConn();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				list.add(new ProductModel(rs.getInt("productid"),  rs.getString("categoryname"), rs.getString("productname"), rs.getString("image"), rs.getInt("status"),
						rs.getDouble("price"), rs.getString("description"), rs.getInt("quantity"), rs.getInt("reviewcount"), rs.getDouble("avgRating")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
    }

    @Override
    public ProductModel findProductById(int productId) {
        String sql = "SELECT p.productid, p.productname, p.image, p.status, p.price, p.description, p.quantity, p.reviewcount, p.avgRating, c.categoryname FROM product p JOIN categories c ON p.categoryid = c.categoryid WHERE productid = ?;";
        ProductModel productModel = null;
        try (Connection conn = super.getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    productModel = new ProductModel(rs.getInt("productid"), rs.getString("categoryname"), rs.getString("productname"), rs.getString("image"),
                            rs.getInt("status"), rs.getDouble("price"), rs.getString("description"),
                            rs.getInt("quantity"), rs.getInt("reviewcount"), rs.getDouble("avgRating"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productModel;
    }

    public void addProduct(ProductModel product) {
        String sql = "INSERT INTO product (productname, status, price, description, quantity) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = super.getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, product.getName());
            ps.setInt(2, product.getStatus());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getDescription());
            ps.setInt(5, product.getQuantity());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }   
    }

    public void deleteProduct(int productId) {
        String sql = "DELETE FROM product WHERE productid = ?";
        try (Connection conn = super.getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(ProductModel product) {
        String sql = "UPDATE product SET productname = ?, status = ?, price = ?, description = ?, quantity = ? WHERE productid = ?";
        try (Connection conn = super.getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, product.getName());
            ps.setInt(2, product.getStatus());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getDescription());
            ps.setInt(5, product.getQuantity());
            ps.setInt(6, product.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<ProductModel> searchProducts(String keyword) {
        String sql = "SELECT p.productid, p.productname, p.image, p.status, p.price, p.description, p.quantity, p.reviewcount, p.avgRating, c.categoryname FROM product p JOIN categories c ON p.categoryid = c.categoryid WHERE p.productname LIKE ?;";
        List<ProductModel> list = new ArrayList<>();
        try (Connection conn = super.getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new ProductModel(rs.getInt("productid"), rs.getString("categoryname"), rs.getString("productname"), rs.getString("image"), rs.getInt("status"),
                            rs.getDouble("price"), rs.getString("description"), rs.getInt("quantity"), rs.getInt("reviewcount"), rs.getDouble("avgRating")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
