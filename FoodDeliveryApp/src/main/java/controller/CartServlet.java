package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartItem;
import model.Menu; // Import the Menu model

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("add".equals(action)) {
            addToCart(request, response);
        } else if ("remove".equals(action)) {
            removeFromCart(request, response);
        } else {
            response.sendRedirect("cart.jsp"); // Redirect if no action
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to cart.jsp for GET requests without action
        response.sendRedirect("cart.jsp");
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String menuIdStr = request.getParameter("menuId");
        String quantityStr = request.getParameter("quantity");

        int menuId = Integer.parseInt(menuIdStr);
        int quantity = Integer.parseInt(quantityStr);

        // Fetch item details from the database
        Menu menuItem = getMenuItemById(menuId);
        if (menuItem == null) {
        	System.out.println("Menu item is null");
            // Handle item not found (e.g., redirect or show error message)
            response.sendRedirect("cart.jsp"); // Redirect for simplicity
            return;
        }

        String itemName = menuItem.getItemname();
        double price = menuItem.getPrice();

        // Retrieve or initialize the cart
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Check if the item already exists in the cart
        boolean itemExists = false;
        for (CartItem item : cart) {
            if (item.getMenuId() == menuId) {
                // Update the quantity of the existing item
                item.setQuantity(item.getQuantity() + quantity);
                itemExists = true;
                break;
            }
        }

        // If the item does not exist in the cart, add a new item
        if (!itemExists) {
            CartItem newItem = new CartItem(menuId, itemName, price, quantity);
            cart.add(newItem);
        }

        // Update the session with the new or updated cart
        session.setAttribute("cart", cart);

        // Redirect to the cart page
        response.sendRedirect("cart.jsp");
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get the menuId parameter from the request
        String menuIdStr = request.getParameter("menuId");

        // Check if menuIdStr is valid
        if (menuIdStr != null) {
            int menuId = Integer.parseInt(menuIdStr);

            // Retrieve the cart from session
            HttpSession session = request.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

            // Check if the cart exists
            if (cart != null) {
                // Remove the item from the cart based on menuId
                cart.removeIf(item -> item.getMenuId() == menuId);
                
                // Update session with the modified cart
                session.setAttribute("cart", cart);
            }
        }

        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }

    private Menu getMenuItemById(int menuId) {
        Menu menuItem = null;
        String url = "jdbc:mysql://localhost:3306/tapfoods";
        String username = "root";
        String password = "Zaynish@123";

        String sql = "SELECT * FROM menu WHERE menuid = ?";
        
        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, menuId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                menuItem = new Menu();
                menuItem.setMenuid(rs.getInt("menuid"));
                menuItem.setItemname(rs.getString("itemname"));
                menuItem.setPrice((float) rs.getDouble("price"));
                menuItem.setDescription(rs.getString("description"));
                menuItem.setImgpath(rs.getString("imgpath"));
                menuItem.setIsavailable(rs.getInt("isavailable") == 1);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
        
        return menuItem;
    }
}
