package com.sns.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.like.model.Like;
import com.sns.like.model.LikeView;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public int selectLikesByPostId(int postId);
	
	public int getLikesByPostIdUserId(
			@Param("userId") int userId, 
			@Param("postId") int PostId);

	public List<Like> selectLikeListByPostId(int postId);
	
	public void deleteLikeByPostIdUserId(
			@Param("userId") int userId, 
			@Param("postId") int postId);
}
