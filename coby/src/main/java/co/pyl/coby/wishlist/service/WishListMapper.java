package co.pyl.coby.wishlist.service;

import java.util.List;
import java.util.Map;

import co.pyl.coby.user.vo.UserVO;
import co.pyl.coby.wishlist.vo.WishListVO;

public interface WishListMapper {
	public List<Map<String, String>> selectWishList(UserVO vo);
	
	public int deleteWishList(WishListVO vo);
	
	//prNo로 지움
	public int deleteWishList2(WishListVO vo);
	
	public int insertWishList(WishListVO vo);
	
	public int updateUser(UserVO vo);
	
}
