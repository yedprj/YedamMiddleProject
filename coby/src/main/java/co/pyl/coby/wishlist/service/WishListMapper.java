package co.pyl.coby.wishlist.service;

import java.util.List;
import java.util.Map;

import co.pyl.coby.user.vo.UserVO;

public interface WishListMapper {
	public List<Map<String, String>> selectWishList(UserVO vo);
	
	
}
