package com.sns.like.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.dao.LikeDAO;
import com.sns.like.model.Like;
import com.sns.like.model.LikeView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class LikeBO {

	@Autowired
	private UserBO userBO;
	
	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int postId, int userId) {
		return likeDAO.insertLike(postId, userId);
	}
	
	//개수만 가져온다
	public int getLikesByPostId(int postId) {
		return likeDAO.selectLikesByPostId(postId);
	}
	
	//user가 있나 찾는다.
	public boolean getLikesByPostIdUserId(int userId, int PostId) {
		int likeCount = likeDAO.getLikesByPostIdUserId(userId, PostId); 
		
		if (likeCount > 0) {
			return true;
		}
		// likeCount == 0 
		return false;
	}

	// like를 지운다.
	public void removeLikeByPostIdUserId(int userId, int postId) {
			likeDAO.deleteLikeByPostIdUserId(userId, postId);
	}
	
	//like를 지운다
	public void removeLikeByPostId(int postId) {
		likeDAO.deleteLikeByPostId(postId);
	}
	
	// like를 일전에 눌렀으면 삭제한다.
	public String generateLikeByUserIdPostId(int userId, int postId) {
		boolean likeCount = getLikesByPostIdUserId(userId, postId); //true -> 있다.
		
		if (likeCount == true) {
			likeDAO.deleteLikeByPostIdUserId(userId, postId);
			return "delete";
		} 
		//likeCount == false(0)
		likeDAO.insertLike(postId, userId);
		return "insert";
	}
	
	
	//likeList가져온다
	public List<Like> getLikeListByPosId(int postId) {
		return likeDAO.selectLikeListByPostId(postId);
	}
	

	
	
	// likeList에 like와 user정보
	public List<LikeView> getLikeViewListByPostId(int postId) {
		List<LikeView> likeViewList = new ArrayList<>();
		
		List<Like> likeList = getLikeListByPosId(postId);
		
		for (Like like : likeList) {
			LikeView likeView = new LikeView();
			//포스트별 like객체
			likeView.setLike(like);
			
			//포스트별 like한 user의 정보
			User user = userBO.getUserById(like.getUserId());
			likeView.setUser(user);
			
			likeViewList.add(likeView);
		}
		return likeViewList;
	}
}
