package ship.iu.Services;

import java.util.List;

import ship.iu.model.ProductModel;

public interface IProductService {
    List<ProductModel> randomSelectionDisplay();
    List<ProductModel> getNewArrivals();
    ProductModel findProductById(int productId);
    void addProduct(ProductModel product);
    void deleteProduct(int productId);
    void updateProduct(ProductModel product);
    List<ProductModel> searchProducts(String keyword);
    List<ProductModel> findProductsByCategory(int categoryId);
    List<ProductModel> findAllProducts();
}
