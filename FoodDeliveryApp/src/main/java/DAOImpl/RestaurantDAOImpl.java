package DAOImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DAO.RestaurantDAO;
import model.Restaurant;


public class RestaurantDAOImpl implements RestaurantDAO{
	Connection con;
	private PreparedStatement pstmt;
	private String url = "jdbc:mysql://localhost:3306/tapfoods";
	private String username = "root";
	private String password = "Zaynish@123";
	public RestaurantDAOImpl() {
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
	
	private Statement stmt;
	private ResultSet resultset;
	//Array list to store the all the user 
	ArrayList<Restaurant> restaurantList = new ArrayList<Restaurant>();
	
	private static final String SELECT_ALL = "select * from `restaurant`";
	
	public ArrayList<Restaurant> getALLRestaurant() {
		try {
			stmt = con.createStatement();
			resultset = stmt.executeQuery(SELECT_ALL);
			
			while(resultset.next())
			{
				restaurantList.add(new Restaurant(resultset.getInt("restaurantid"),
				resultset.getString("restaurantname"),
				resultset.getInt("deliverytime"),
				resultset.getString("cusinetype"),
				resultset.getString("address"),
				resultset.getFloat("ratings"),
				resultset.getBoolean("isactive"),
				resultset.getString("imgpath")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return restaurantList;

	}
	
}
