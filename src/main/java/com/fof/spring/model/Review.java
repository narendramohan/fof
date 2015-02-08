package com.fof.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "reviews")
public class Review implements Serializable {
	@Id
	@GeneratedValue
	@Column(name = "reviewid")
	int reviewId;
	
	@Column(name = "productid")
	int productId;
	
	@Column(name = "title")
	String title;
	
	@Column(name = "description")
	String description;
	
	@Column(name = "overallrating")
	int overAllRating;
	
	@Column(name = "valueformoneyrating")
	int valueForMoneyRating;
	
	@Column(name = "sevicesrating")
	int sevicesRating;
	
	@Column(name = "reviewsByperson")
	String reviewsByperson;
	
	String productName;
		
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getOverAllRating() {
		return overAllRating;
	}

	public void setOverAllRating(int overAllRating) {
		this.overAllRating = overAllRating;
	}

	public int getValueForMoneyRating() {
		return valueForMoneyRating;
	}

	public void setValueForMoneyRating(int valueForMoneyRating) {
		this.valueForMoneyRating = valueForMoneyRating;
	}

	public int getSevicesRating() {
		return sevicesRating;
	}

	public void setSevicesRating(int sevicesRating) {
		this.sevicesRating = sevicesRating;
	}

	public String getReviewsByperson() {
		return reviewsByperson;
	}

	public void setReviewsByperson(String reviewsByperson) {
		this.reviewsByperson = reviewsByperson;
	}
	
}
