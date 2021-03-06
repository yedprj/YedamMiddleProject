package co.pyl.coby.wishlist.service;

import java.util.List;
import java.util.Map;

import co.pyl.coby.user.vo.UserVO;
import co.pyl.coby.wishlist.vo.WishListVO;

public interface WishListService {
	public List<Map<String, String>> selectWishList(UserVO vo);
	
	//wNo로 지움
	public int deleteWishList(WishListVO vo);
	
	//prNo로 지움
	public int deleteWishList2(WishListVO vo);
	
	public int insertWishList(WishListVO vo);
	
	public int updateUser(UserVO vo);
	
	//위시리스트에 이미 있는지 조회
	public WishListVO wishListConfirm(WishListVO vo);
}
