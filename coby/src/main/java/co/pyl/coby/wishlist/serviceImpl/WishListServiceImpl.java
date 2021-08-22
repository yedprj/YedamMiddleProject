package co.pyl.coby.wishlist.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.pyl.coby.common.DataSource;
import co.pyl.coby.user.vo.UserVO;
import co.pyl.coby.wishlist.service.WishListMapper;
import co.pyl.coby.wishlist.service.WishListService;
import co.pyl.coby.wishlist.vo.WishListVO;

public class WishListServiceImpl implements WishListService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private WishListMapper map = sqlSession.getMapper(WishListMapper.class);
	
	
	@Override
	public List<Map<String, String>> selectWishList(UserVO vo) {
		return map.selectWishList(vo);
	}
	
	public int deleteWishList(WishListVO vo) {
		return map.deleteWishList(vo);
	}

	@Override
	public int updateUser(UserVO vo) {
		// TODO Auto-generated method stub
		return map.updateUser(vo);
	}

	@Override
	public int insertWishList(WishListVO vo) {
		// TODO Auto-generated method stub
		return map.insertWishList(vo);
	}

	@Override
	public int deleteWishList2(WishListVO vo) {
		// TODO Auto-generated method stub
		return map.deleteWishList2(vo);
	}

}
