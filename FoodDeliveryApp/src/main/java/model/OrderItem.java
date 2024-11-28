package model;

public class OrderItem {
    private int orderitemid;  // AI PK
    private int orderid;      // ID of the order this item belongs to
    private int menuid;       // ID of the menu item
    private int quantity;      // Quantity of the menu item ordered
    private double itemtotal;  // Total price for this order item

    // Getters and Setters
    public int getOrderitemid() {
        return orderitemid;
    }

    public void setOrderitemid(int orderitemid) {
        this.orderitemid = orderitemid;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getMenuid() {
        return menuid;
    }

    public void setMenuid(int menuid) {
        this.menuid = menuid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getItemtotal() {
        return itemtotal;
    }

    public void setItemtotal(double itemtotal) {
        this.itemtotal = itemtotal;
    }
}
