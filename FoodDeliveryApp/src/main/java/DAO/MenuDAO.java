package DAO;

import java.util.List;

import model.Menu;

public interface MenuDAO {
    // Other methods...

    // Method to add a menu item
    void addMenuItem(Menu menu);
    List<Menu> getAllMenuItems();
}
