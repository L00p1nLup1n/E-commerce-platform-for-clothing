package ship.iu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ship.iu.controller.DBconnectionSQL;
import ship.iu.dao.ICategoryDao;
import ship.iu.model.CategoryModel;

public class CategoryDaoImpl extends DBconnectionSQL implements ICategoryDao {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	private static final Map<Integer, String> idToNameMap = new HashMap<>();
    private static final Map<String, Integer> nameToIdMap = new HashMap<>();

	@Override
	public List<CategoryModel> findAll() {
		String sql = "SELECT * FROM categories";
		List<CategoryModel> list = new ArrayList<>();
		try {
			conn = super.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				CategoryModel category = new CategoryModel();
				category.setCategoryid(rs.getInt("productid"));
				category.setCategoryname(rs.getString("productname"));
				category.setImages(rs.getString("images"));
				category.setStatus(rs.getInt("status"));
				category.setPrice(rs.getInt("price"));
				category.setDesc(rs.getString("description"));
				list.add(category);
			}
			conn.close();
			ps.close();
			rs.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public CategoryModel findById(int id) {
		String sql = "SELECT * FROM product WHERE productid =?";
		try {
			conn = super.getConn();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			CategoryModel category = new CategoryModel();
			while (rs.next()) {
				category.setCategoryid(rs.getInt("productid"));
				category.setCategoryname(rs.getString("productname"));
				category.setImages(rs.getString("images"));
				category.setStatus(rs.getInt("status"));
				category.setPrice(rs.getInt("price"));
				category.setDesc(rs.getString("description"));
			}
			conn.close();
			ps.close();
			rs.close();
			return category;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public CategoryModel findByname(String name) {
		String sql = "SELECT * FROM product WHERE productname =?";
		try {
			conn = super.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			CategoryModel category = new CategoryModel();
			while (rs.next()) {
				category.setCategoryid(rs.getInt("productid"));
				category.setCategoryname(rs.getString("productname"));
				category.setImages(rs.getString("images"));
				category.setStatus(rs.getInt("status"));
				category.setPrice(rs.getInt("price"));
				category.setDesc(rs.getString("description"));
			}
			conn.close();
			ps.close();
			rs.close();
			return category;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void insert(CategoryModel category) {
		String sql = "INSERT INTO product(productname, images, status, price, description) VALUES(?,?,?,?,?)";
		try {
			new DBconnectionSQL();
			conn = super.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, category.getCategoryname());
			ps.setString(2, category.getImages());
			ps.setInt(3, category.getStatus());
			ps.setInt(4, category.getPrice());
			ps.setString(5, category.getDesc());
			ps.executeUpdate();
			conn.close();
			ps.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(CategoryModel category) {
		String sql = "UPDATE product SET productname = ? ,images = ? , status = ?, price = ?, description = ? WHERE productid = ?";
		try {
			new DBconnectionSQL();
			conn = super.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, category.getCategoryname());
			ps.setString(2, category.getImages());
			ps.setInt(3, category.getStatus());
			ps.setInt(4, category.getPrice());
			ps.setString(5, category.getDesc());
			ps.setInt(6, category.getCategoryid());
			ps.executeUpdate();
			conn.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void delete(int id) {
		String sql = "DELETE FROM product WHERE productid=?";
		try {
			conn = super.getConn();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			conn.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateStatus(int id, int status) {
		String sql = "update product set status=? where productid=? ";
		try {
			conn = super.getConn();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, status);
			ps.setInt(2, id);
			rs = ps.executeQuery();
			conn.close();
			ps.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	 public void loadCategories() {
        String sql = "SELECT categoryid, categoryname FROM categories;";
        try (Connection conn = super.getConn();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("categoryid");
                String name = rs.getString("categoryname");
                idToNameMap.put(id, name);
                nameToIdMap.put(name.toLowerCase(), id);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	public Map<String, Integer> getCategoryNametoIdMap() {
		return Collections.unmodifiableMap(nameToIdMap);
	}


	public Map<Integer, String> getCategoryIdtoNameMap() {
		return Collections.unmodifiableMap(idToNameMap);
	}


}
