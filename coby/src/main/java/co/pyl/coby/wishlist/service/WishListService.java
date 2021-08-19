package co.pyl.coby.wishlist.service;

import java.util.List;
import java.util.Map;

import co.pyl.coby.user.vo.UserVO;
import co.pyl.coby.wishlist.vo.WishListVO;

public interface WishListService {
	public List<Map<String, String>> selectWishList(UserVO vo);
	
	public int deleteWishList(WishListVO vo);
	
	
}
