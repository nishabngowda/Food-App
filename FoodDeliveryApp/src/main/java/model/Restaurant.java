package model;

public class Restaurant {
	private int restaurantid;
	private String restaurantname;
	private int deliverytime;
	private String cusinetype;
	private String address;
	private Float ratings;
	private boolean isactive;
	private String imgpath;
	
	public Restaurant() {
		super();
	}
	
	

	public Restaurant(int restaurantid, String restaurantname, int deliverytime, String cusinetype, String address,
			Float ratings, boolean isactive, String imgpath) {
		super();
		this.restaurantid = restaurantid;
		this.restaurantname = restaurantname;
		this.deliverytime = deliverytime;
		this.cusinetype = cusinetype;
		this.address = address;
		this.ratings = ratings;
		this.isactive = isactive;
		this.imgpath = imgpath;
	}

	public int getRestaurantid() {
		return restaurantid;
	}

	public void setRestaurantid(int restaurantid) {
		this.restaurantid = restaurantid;
	}

	public String getRestaurantname() {
		return restaurantname;
	}

	public void setRestaurantname(String restaurantname) {
		this.restaurantname = restaurantname;
	}

	public int getDeliverytime() {
		return deliverytime;
	}

	public void setDeliverytime(int deliverytime) {
		this.deliverytime = deliverytime;
	}

	public String getCusinetype() {
		return cusinetype;
	}

	public void setCusinetype(String cusinetype) {
		this.cusinetype = cusinetype;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Float getRatings() {
		return ratings;
	}

	public void setRatings(Float ratings) {
		this.ratings = ratings;
	}

	public boolean isIsactive() {
		return isactive;
	}

	public void setIsactive(boolean isactive) {
		this.isactive = isactive;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	
	
}
