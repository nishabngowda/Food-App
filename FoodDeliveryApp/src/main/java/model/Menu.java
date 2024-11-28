package model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Menu {
	private int menuid; 
	private int restaurantId;
	private String itemname;
	private float price; 
	private String description;
	private String imgpath;
	private boolean isavailable;

	public Menu() {
		super();
	}

	public Menu(int menuid, int restaurantId, String itemname, float price, String description, String imgpath,
			boolean isavailable) {
		super();
		this.menuid = menuid;
		this.restaurantId = restaurantId;
		this.itemname = itemname;
		this.price = price;
		this.description = description;
		this.imgpath = imgpath;
		this.isavailable = isavailable;
	}

	public int getMenuid() {
		return menuid;
	}

	public void setMenuid(int menuid) {
		this.menuid = menuid;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public boolean isIsavailable() {
		return isavailable;
	}

	public void setIsavailable(boolean isavailable) {
		this.isavailable = isavailable;
	}
	public void setPrice(double price) {
	    this.price = (float) price;
	}
	
	

}