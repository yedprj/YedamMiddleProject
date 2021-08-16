package co.pyl.coby.purchase.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
}
