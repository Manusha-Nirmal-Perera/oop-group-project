package com.company.modal;

public class Product {
	private int id;
	private String name;
	private String category;
	private Double price;
	private String image;
	
	
	public Product() {
	}

	
	public Product(String name, String category, Double price, String image) {
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;
	}


	public int getId() {
		return id;
	}

	public void setId(int cpid) {
		this.id = cpid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", category=" + category + ", price=" + price + ", image="
				+ image + "]";
	}
	
	
}
