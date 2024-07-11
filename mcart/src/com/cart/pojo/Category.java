package com.cart.pojo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name= "Cart_Category")   
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int categoryId;
	@Column
	private String categoryTitle;
	@Column
	private String categoryDesc;
	
	@OneToMany(mappedBy = "category",cascade=CascadeType.ALL)
	private List<Product> product = new ArrayList<>();
	
	public Category(String categoryTitle, String categoryDesc, List<Product> product) {
		super();
		this.categoryTitle = categoryTitle;
		this.categoryDesc = categoryDesc;
		this.product = product;
	}
	

	public Category(int categoryId, String categoryTitle, String categoryDesc) {
		super();
		this.categoryId = categoryId;
		this.categoryTitle = categoryTitle;
		this.categoryDesc = categoryDesc;
	}

	public Category(String categoryTitle, String categoryDesc) {
		super();
		this.categoryTitle = categoryTitle;
		this.categoryDesc = categoryDesc;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public String getCategoryDesc() {
		return categoryDesc;
	}

	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
	
	
	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDesc="
				+ categoryDesc + "]";
	}

	public Category() {
		super();
	}
	
	
	
}
