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

	
	private Date rentDate;
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

	public Date getRentDate() {
		return this.rentDate;
	}

	public void setRentDate(Date rentDate) {
		this.rentDate = rentDate;
	}

	public Orderdetail(int did, String goodName, int goodNumber, int orderId, Date rentDate, int goodState) {
		super();
		this.did = did;
		this.goodName = goodName;
		this.goodNumber = goodNumber;
		this.orderId = orderId;
		this.rentDate = rentDate;
		this.goodState = goodState;
	}

	@Override
	public String toString() {
		return "Orderdetail [did=" + did + ", goodName=" + goodName + ", goodNumber=" + goodNumber + ", orderId="
				+ orderId + ", rentDate=" + rentDate + ", goodState=" + goodState + "]";
	}

}