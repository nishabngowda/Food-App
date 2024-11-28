package DAOImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DAO.MenuDAO;
import model.Menu;


public class MenuDAOImpl implements MenuDAO {
	Connection con;
	private PreparedStatement pstmt;
	private ResultSet resultSet;
	private String url = "jdbc:mysql://localhost:3306/tapfoods";
	private String username = "root";
	private String password = "Zaynish@123";
	public MenuDAOImpl() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(url,username,password);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
    }

    public List<Menu> getMenuByRestaurantId(int restaurantId) {
        List<Menu> menuList = new ArrayList<>();
        String sql = "SELECT * FROM menu WHERE restaurantid = ?";
        
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, restaurantId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Menu menu = new Menu();
                menu.setMenuid(rs.getInt("menuid"));
                menu.setItemname(rs.getString("itemname"));
                menu.setPrice(rs.getFloat("price"));
                menu.setDescription(rs.getString("description"));
                menu.setImgpath(rs.getString("imgpath"));
                menu.setIsavailable(rs.getBoolean("isavailable"));
                menuList.add(menu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return menuList;
    }
    public void addMenuItem(Menu menu) {
        String sql = "INSERT INTO menu (restaurantid, itemname, price, description, imgpath, isavailable) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, menu.getRestaurantId());
            pstmt.setString(2, menu.getItemname());
            pstmt.setFloat(3, menu.getPrice());
            pstmt.setString(4, menu.getDescription());
            pstmt.setString(5, menu.getImgpath());
            pstmt.setBoolean(6, menu.isIsavailable());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Menu item added successfully.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public List<Menu> getAllMenuItems() {
        List<Menu> menuList = new ArrayList<>();
        String sql = "SELECT * FROM tapfoods.menu";

        try (PreparedStatement pstmt = con.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                // Create a Menu object for each row and add it to the list
                Menu menu = new Menu();
                menu.setMenuid(rs.getInt("menuid"));
                menu.setRestaurantId(rs.getInt("restaurantid"));
                menu.setItemname(rs.getString("itemname"));
                menu.setPrice(rs.getFloat("price"));
                menu.setDescription(rs.getString("description"));
                menu.setImgpath(rs.getString("imgpath"));
                menu.setIsavailable(rs.getBoolean("isavailable"));

                menuList.add(menu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }
    

}
