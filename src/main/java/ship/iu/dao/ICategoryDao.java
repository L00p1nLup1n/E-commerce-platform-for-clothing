package ship.iu.dao;

import java.util.List;
import java.util.Map;

import ship.iu.model.CategoryModel;

public interface ICategoryDao {
 void loadCategories();
 List<CategoryModel> findAll();
 CategoryModel findById(int id);
 CategoryModel findByname(String name);
 Map <String, Integer> getCategoryNametoIdMap();
 Map <Integer, String> getCategoryIdtoNameMap();
 void insert(CategoryModel category);
 void update(CategoryModel category);
 void delete(int id);
 void updateStatus(int id, int status);
}
