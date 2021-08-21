package co.pyl.coby.purchase.vo;

import java.sql.Date;

public class PrCmtVO {
	private int prcmtNo;
	private String prcmtContent;
	private Date prcmtDate;
	private int prNo;
	private String userId;
	private String userNickname;
	private String userProfile;

	public int getPrcmtNo() {
		return prcmtNo;
	}

	public void setPrcmtNo(int prcmtNo) {
		this.prcmtNo = prcmtNo;
	}

	public String getPrcmtContent() {
		return prcmtContent;
	}

	public void setPrcmtContent(String prcmtContent) {
		this.prcmtContent = prcmtContent;
	}

	public Date getPrcmtDate() {
		return prcmtDate;
	}

	public void setPrcmtDate(Date prcmtDate) {
		this.prcmtDate = prcmtDate;
	}

	public int getPrNo() {
		return prNo;
	}

	public void setPrNo(int prNo) {
		this.prNo = prNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

}
