package co.pyl.coby.wishlist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WishListVO {
	private int wNo;
	private int prNo;
	private String userId;
	
	@Override
	public String toString() {
		return "WishListVO [wNo=" + wNo + ", prNo=" + prNo + ", userId=" + userId + "]";
	}
	
	
}
