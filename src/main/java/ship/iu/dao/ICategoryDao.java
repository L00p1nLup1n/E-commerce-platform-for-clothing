package ship.iu.dao;

import java.util.List;

import ship.iu.model.CategoryModel;

public interface ICategoryDao {
 void loadCategories();
 List<CategoryModel> findAll();
 CategoryModel findById(int id);
 CategoryModel findByname(String name);
 String getCategoryNameById(int categoryid);
 Integer getCategoryIdByName(String categoryname);
 void insert(CategoryModel category);
 void update(CategoryModel category);
 void delete(int id);
 void updateStatus(int id, int status);
}
