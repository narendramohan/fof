package com.fof.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "productid")
	int productid;
	
	@Column(name = "productName")
	String productName;
	
	@Column(name = "productDescription")
	String productDescription;
	@Column(name="Manufacturer")
	String manufacturer;
	@Column(name="type")
	String type;
	
	
	@Column(name="originalprice")
	String originalprice;
	@Column(name="sellingprice")
	String sellingprice;
	@Column(name="guarantee")
	String guarantee;
	@Column(name="imageURL")
	String imageURL;
	
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOriginalprice() {
		return originalprice;
	}
	public void setOriginalprice(String originalprice) {
		this.originalprice = originalprice;
	}
	public String getSellingprice() {
		return sellingprice;
	}
	public void setSellingprice(String sellingprice) {
		this.sellingprice = sellingprice;
	}
	public String getGuarantee() {
		return guarantee;
	}
	public void setGuarantee(String guarantee) {
		this.guarantee = guarantee;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	
}
