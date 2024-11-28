package DAOImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DAO.UserDAO;
import model.User;

public class UserDAOImpl implements UserDAO{
	
	 private static final String SELECT_ON_USER = "select * from `user` where `email` = ?";
	 private static final String INSERT_USER = "insert into `user`(`username`, `email`, `phonenumber`, `password`, `address`)" + "values(?,?,?,?,?)";

	
	//here inside the constructor i'm establishing a connection with the database
	Connection con;
	private PreparedStatement pstmt;
	private ResultSet resultSet;
	private String url = "jdbc:mysql://localhost:3306/tapfoods";
	private String username = "root";
	private String password = "Zaynish@123";
	public UserDAOImpl() {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	        throw new RuntimeException("MySQL Driver not found.", e); // Stop if driver not found
	    }
	    try {
	        con = DriverManager.getConnection(url, username, password);
	        if (con == null) {
	            throw new SQLException("Connection is null!");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new RuntimeException("Failed to establish database connection.", e); // Stop if connection fails
	    }
	}

	@Override
	public User getUser(String email) {// string email is a email is sent by user
	    User user = null; // Initialize user as null
	    try {
	        pstmt = con.prepareStatement(SELECT_ON_USER);
	        //setString() safely inserts the email into the SQL query, and the database checks if the provided email matches any stored in the user table.
	        pstmt.setString(1, email);
	        
	        resultSet = pstmt.executeQuery();
	        if (resultSet.next()) {
	            // Create a new User object and populate it with data from the ResultSet
	            user = new User();
	            user.setUserid(resultSet.getInt("userid")); // here in resultset i have all the column value of table getting by getInt table name column name userid by ussing set method im setting a value inside the user object in the sevlet
	            user.setUsername(resultSet.getString("username"));
	            user.setEmail(resultSet.getString("email"));
	            user.setPhonenumber(resultSet.getString("phonenumber"));
	            user.setPassword(resultSet.getString("password"));
	            user.setAddress(resultSet.getString("address"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }    
	    return user; // Return the user object (null if not found)
	}
	
	public boolean insertUser(User user) {
        try {
            pstmt = con.prepareStatement(INSERT_USER);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPhonenumber());
            pstmt.setString(4, user.getPassword());
            pstmt.setString(5, user.getAddress());

            int x = pstmt.executeUpdate();
            return x > 0; // return true if insertion was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // return false if insertion failed
    }
}
