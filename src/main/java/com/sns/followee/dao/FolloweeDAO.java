package com.sns.followee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.followee.model.Followee;

@Repository
public interface FolloweeDAO {
	
	public Followee selectFollowee(
			@Param("userId") int userId, 
			@Param("followerId") int followerId);
	
	public List<Followee> selectFollowerListByUserId(int userId);
	
	public List<Followee> selectFolloweeListByUserId(@Param("followerId") int userId);
	
	public void insertFollowee(
			@Param("userId") int userId, 
			@Param("followerId") int followerId);
	
	public void deleteFollowee(
			@Param("userId") int userId, 
			@Param("followerId") int followerId);
}
