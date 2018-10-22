package com.etc.RentMarket.entity;

import java.io.Serializable;

  


public class Ad implements Serializable {
	private static final long serialVersionUID = 1L;

	
	private int adId;

	private String adContent;
	
	
	private String adPicture;


	private String adProductor;
	
	
	private String adBeginDate;

	
	private String adEndDate;


	private int adDay;
	
	
	private String adState;
	
	
	

	public Ad(String adContent, String adPicture, String adProductor, int adDay, String adState,int adId) {
		super();
		this.adId = adId;
		this.adContent = adContent;
		this.adPicture = adPicture;
		this.adProductor = adProductor;
		this.adDay = adDay;
		this.adState = adState;
	}

	public Ad() {
	}

	

	public int getAdId() {
		return adId;
	}

	public void setAdId(int adId) {
		this.adId = adId;
	}

	public String getAdContent() {
		return adContent;
	}

	public void setAdContent(String adContent) {
		this.adContent = adContent;
	}

	public String getAdPicture() {
		return adPicture;
	}

	public void setAdPicture(String adPicture) {
		this.adPicture = adPicture;
	}

	public String getAdProductor() {
		return adProductor;
	}

	public void setAdProductor(String adProductor) {
		this.adProductor = adProductor;
	}

	public String getAdBeginDate() {
		return adBeginDate;
	}

	public void setAdBeginDate(String adBeginDate) {
		this.adBeginDate = adBeginDate;
	}

	public String getAdEndDate() {
		return adEndDate;
	}

	public void setAdEndDate(String adEndDate) {
		this.adEndDate = adEndDate;
	}

	public int getAdDay() {
		return adDay;
	}

	public void setAdDay(int adDay) {
		this.adDay = adDay;
	}

	public String getAdState() {
		return adState;
	}

	public void setAdState(String adState) {
		this.adState = adState;
	}

	

	
	public Ad(int adId, String adContent, String adPicture, String adProductor, String adBeginDate, String adEndDate,
			int adDay, String adState) {
		super();
		this.adId = adId;
		this.adContent = adContent;
		this.adPicture = adPicture;
		this.adProductor = adProductor;
		this.adBeginDate = adBeginDate;
		this.adEndDate = adEndDate;
		this.adDay = adDay;
		this.adState = adState;
	}

	

	public Ad(String adContent, String adPicture, String adProductor, int adDay, String adState) {
		super();
		this.adContent = adContent;
		this.adPicture = adPicture;
		this.adProductor = adProductor;
		this.adDay = adDay;
		this.adState = adState;
	}

	@Override
	public String toString() {
		return "Ad [adId=" + adId + ", adContent=" + adContent + ", adPicture=" + adPicture + ", adProductor="
				+ adProductor + ", adBeginDate=" + adBeginDate + ", adEndDate=" + adEndDate + ", adDay=" + adDay
				+ ", adState=" + adState + "]";
	}

	

	

	
	

}