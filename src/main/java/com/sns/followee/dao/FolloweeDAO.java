package com.sns.followee.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.followee.model.Followee;

@Repository
public interface FolloweeDAO {
	
	public Followee selectFollowee(
			@Param("userId") int userId, 
			@Param("followerId") int followerId);
	
	public void insertFollowee(
			@Param("userId") int userId, 
			@Param("followerId") int followerId);
	
	public void deleteFollowee(
			@Param("userId") int userId, 
			@Param("followerId") int followerId);
}
