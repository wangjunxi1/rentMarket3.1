package com.etc.RentMarket.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * The persistent class for the orderdetail database table.
 * 
 */
  
public class Orderdetail implements Serializable {
	private static final long serialVersionUID = 1L;

	
	private int did;

	private String goodName;

	private int goodNumber;


	private int orderId;

	private String goodImg;
	private double rentPrice;
	private String  rentDate;
	private int goodState;

	public Orderdetail() {
	}

	public int getGoodState() {
		return goodState;
	}

	public void setGoodState(int goodState) {
		this.goodState = goodState;
	}

	public int getDid() {
		return this.did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public String getGoodName() {
		return this.goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public int getGoodNumber() {
		return this.goodNumber;
	}

	public void setGoodNumber(int goodNumber) {
		this.goodNumber = goodNumber;
	}


	public int getOrderId() {
		return this.orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getRentDate() {
		return this.rentDate;
	}

	public void setRentDate(String rentDate) {
		this.rentDate = rentDate;
	}

	public Orderdetail(int did, String goodName, int goodNumber, int orderId, String  rentDate, int goodState) {
		super();
		this.did = did;
		this.goodName = goodName;
		this.goodNumber = goodNumber;
		this.orderId = orderId;
		this.rentDate = rentDate;
		this.goodState = goodState;
	}
	
	

	public Orderdetail(String goodName, int goodNumber, int orderId, String goodImg, double rentPrice,
			String rentDate) {
		super();
		this.goodName = goodName;
		this.goodNumber = goodNumber;
		this.orderId = orderId;
		this.goodImg = goodImg;
		this.rentPrice = rentPrice;
		this.rentDate = rentDate;
	}

	public String getGoodImg() {
		return goodImg;
	}

	public void setGoodImg(String goodImg) {
		this.goodImg = goodImg;
	}

	public double getRentPrice() {
		return rentPrice;
	}

	public void setRentPrice(double rentPrice) {
		this.rentPrice = rentPrice;
	}

	@Override
	public String toString() {
		return "Orderdetail [did=" + did + ", goodName=" + goodName + ", goodNumber=" + goodNumber + ", orderId="
				+ orderId + ", goodImg=" + goodImg + ", rentPrice=" + rentPrice + ", rentDate=" + rentDate
				+ ", goodState=" + goodState + "]";
	}
	

}