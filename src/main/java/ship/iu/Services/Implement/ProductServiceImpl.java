package ship.iu.Services.Implement;

import ship.iu.Services.IProductService;
import ship.iu.dao.IProductDao;
import ship.iu.dao.impl.ProductDaoImpl;
import ship.iu.model.ProductModel;

import java.util.List;

public class ProductServiceImpl implements IProductService{
    IProductDao dao = new ProductDaoImpl();

    @Override
    public ProductModel findProductById(int productId) {
        return dao.findProductById(productId);
    }

    @Override
    public void addProduct(ProductModel product) {
        dao.addProduct(product);
    }

    @Override
    public void deleteProduct(int productId) {
        dao.deleteProduct(productId);
    }

    @Override
    public void updateProduct(ProductModel product) {
        dao.updateProduct(product);
    }

    @Override
    public List<ProductModel> searchProducts(String keyword) {
        return dao.searchProducts(keyword);
    }

    @Override
    public List<ProductModel> findProductsByCategory(int categoryId) {
        return dao.findProductsByCategory(categoryId);
    }

    @Override
    public List<ProductModel> findAllProducts() {
        return dao.findAllProducts();
    }

}
