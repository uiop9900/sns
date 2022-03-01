package com.sns.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.dao.LikeDAO;
import com.sns.user.model.User;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int postId, int userId) {
		return likeDAO.insertLike(postId, userId);
	}
	
	
	public int getLikesByPostId(int postId) {
		return likeDAO.selectLikesByPostId(postId);
	}
	
	//public List<Like> selectLikeListByPostId(int postId);
	
	//만약 수가 아니라 like한 리스트를 가지고 온다면?
//	public List<LikeView> selectLikeListByPostId(int postId) {
	//		List<LikeView> likeViewList = new ArrayList<>();
		
	//List<Like> likeList = selectLikeListByPostId(postId);
		
	//for(Like like : likeList) {
	//	LikeView likeView = new LikeView();
	//	likeView.set(like);
			
			//user - 위에서 user Autowired함
	//	USer user = User getUserById(like.getUserId);
	//	likeView.set(user);
	//	
	//	likeViewList.add(likeView);
			
	//}
		
	//	}
	
}
