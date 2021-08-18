package co.pyl.coby.purchase.vo;

import java.util.Date;

public class PurchaseVO {
	private int prNo;
	private String prCategory;
	private String prTitle;
	private int prMin;
	private int prMax;
	private Date prStartdate;
	private Date prEnddate;
	private int prPrice;
	private String prPhoto1;
	private String prPhoto2;
	private String prPhtro3;
	private String prContent;
	private String prPeople;
	private String userId;

	@Override
	public String toString() {
		return "PurchaseVO [prNo=" + prNo + ", prCategory=" + prCategory + ", prTitle=" + prTitle + ", prMin=" + prMin
				+ ", prMax=" + prMax + ", prStartdate=" + prStartdate + ", prEnddate=" + prEnddate + ", prPrice="
				+ prPrice + ", prPhoto1=" + prPhoto1 + ", prPhoto2=" + prPhoto2 + ", prPhtro3=" + prPhtro3
				+ ", prContent=" + prContent + ", prPeople=" + prPeople + ", userId=" + userId + "]";
	}

	public int getPrNo() {
		return prNo;
	}

	public void setPrNo(int prNo) {
		this.prNo = prNo;
	}

	public String getPrCategory() {
		return prCategory;
	}

	public void setPrCategory(String prCategory) {
		this.prCategory = prCategory;
	}

	public String getPrTitle() {
		return prTitle;
	}

	public void setPrTitle(String prTitle) {
		this.prTitle = prTitle;
	}

	public int getPrMin() {
		return prMin;
	}

	public void setPrMin(int prMin) {
		this.prMin = prMin;
	}

	public int getPrMax() {
		return prMax;
	}

	public void setPrMax(int prMax) {
		this.prMax = prMax;
	}

	public Date getPrStartdate() {
		return prStartdate;
	}

	public void setPrStartdate(Date prStartdate) {
		this.prStartdate = prStartdate;
	}

	public Date getPrEnddate() {
		return prEnddate;
	}

	public void setPrEnddate(Date prEnddate) {
		this.prEnddate = prEnddate;
	}

	public int getPrPrice() {
		return prPrice;
	}

	public void setPrPrice(int prPrice) {
		this.prPrice = prPrice;
	}

	public String getPrPhoto1() {
		return prPhoto1;
	}

	public void setPrPhoto1(String prPhoto1) {
		this.prPhoto1 = prPhoto1;
	}

	public String getPrPhoto2() {
		return prPhoto2;
	}

	public void setPrPhoto2(String prPhoto2) {
		this.prPhoto2 = prPhoto2;
	}

	public String getPrPhtro3() {
		return prPhtro3;
	}

	public void setPrPhtro3(String prPhtro3) {
		this.prPhtro3 = prPhtro3;
	}

	public String getPrContent() {
		return prContent;
	}

	public void setPrContent(String prContent) {
		this.prContent = prContent;
	}

	public String getPrPeople() {
		return prPeople;
	}

	public void setPrPeople(String prPeople) {
		this.prPeople = prPeople;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}