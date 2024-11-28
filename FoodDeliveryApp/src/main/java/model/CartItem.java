package model;

public class CartItem {
    private int menuId;
    private String itemName;
    private double price;
    private int quantity;

    public CartItem(int menuId, String itemName, double price, int quantity) {
        this.menuId = menuId;
        this.itemName = itemName;
        this.price = price;
        this.quantity = quantity;
    }

    public int getMenuId() {
        return menuId;
    }

    public String getItemName() {
        return itemName;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSubtotal() {
        return price * quantity;
    }

    // New method added
    public double getItemTotal() {
        return getSubtotal(); // This calls the existing getSubtotal method
    }
}
