package co.pyl.coby.applicate.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApplicateVO {
	private int apNo;
	private int prNo;
	private String userId;
	private int apPrice;
	private Date apDate;
	private String apPay;
	
	private String userNickname;
	private String userProfile;
	
	private String prTitle;
	
	private int bossPrice;
	private int dividedPrice;
}
