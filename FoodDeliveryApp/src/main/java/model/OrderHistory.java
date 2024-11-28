package model;

import java.util.Date;

public class OrderHistory {
    private int orderHistoryId;    // Order history ID (Primary Key)
    private int orderId;           // Order ID (Foreign Key from orders table)
    private int userId;            // User ID (Foreign Key from users table)
    private Date orderDate;        // Date the order was placed
    private float totalAmount;     // Total amount for the order
    private String status;         // Order status (e.g., "Delivered", "Cancelled")

    // Constructor with parameters
    public OrderHistory(int orderHistoryId, int orderId, int userId, Date orderDate, float totalAmount, String status) {
        this.orderHistoryId = orderHistoryId;
        this.orderId = orderId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    // Default constructor
    public OrderHistory() {}

    // Getters and setters
    public int getOrderHistoryId() {
        return orderHistoryId;
    }

    public void setOrderHistoryId(int orderHistoryId) {
        this.orderHistoryId = orderHistoryId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderHistory [orderHistoryId=" + orderHistoryId + ", orderId=" + orderId + ", userId=" + userId
                + ", orderDate=" + orderDate + ", totalAmount=" + totalAmount + ", status=" + status + "]";
    }
}

