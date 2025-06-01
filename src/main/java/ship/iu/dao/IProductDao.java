package ship.iu.dao;
import java.util.List;
import ship.iu.model.ProductModel;

public interface IProductDao {
    List<ProductModel> randomSelectionDisplay();
    List<ProductModel> getNewArrivals();
    List<ProductModel> findProductsByCategory(int categoryId);
    List<ProductModel> findAllProducts();
    ProductModel findProductById(int productId);
    void addProduct(ProductModel product);
    void deleteProduct(int productId);
    void updateProduct(ProductModel product);
    List<ProductModel> searchProducts(String keyword);
}
