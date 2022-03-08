package com.sns.followee.bo;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.followee.dao.FolloweeDAO;
import com.sns.followee.model.Followee;
import com.sns.followee.model.FolloweeView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class FolloweeBO {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FolloweeDAO followeeDAO;
	
	@Autowired
	private UserBO userBO;
	
	public Followee getFollowee(int userId, int followerId) {
		return followeeDAO.selectFollowee(userId, followerId);
	}
	
	
	public List<Followee> getFollowerListByUserId(int userId){
		return followeeDAO.selectFollowerListByUserId(userId);
	}

	public List<Followee> getFolloweeListByUserId(int userId){
		return followeeDAO.selectFolloweeListByUserId(userId);
	}
	
	
	public void addFollowee(int userId, int followerId) {
		followeeDAO.insertFollowee(userId, followerId);
	}
	
	public void deleteFollowee(int userId, int followerId) {
		followeeDAO.deleteFollowee(userId, followerId);
	}
	
	public String generateFollowee(int userId, int followerId) {
		Followee followee = getFollowee(userId, followerId);
		
		if (followee == null) { //없다
			followeeDAO.insertFollowee(userId, followerId);
			return "insert";
		}
		
		if (followee != null) { //있음
			followeeDAO.deleteFollowee(userId, followerId);
			return "delete";
		}
		
		return "error";
	}
	
	
	
	public List<FolloweeView> generateFolloweeList(int userId) {
		List<FolloweeView> followeeUserList = new ArrayList<>();
		
		List<Followee> followeeList = getFolloweeListByUserId(userId);
		
		for (Followee followee : followeeList) {
			FolloweeView followeeview = new FolloweeView();
			// 팔로위 정보
			followeeview.setFollowee(followee);
			
			User user = userBO.getUserById(followee.getUserId());
			followeeview.setUser(user);
			
			followeeUserList.add(followeeview);
		}
		return followeeUserList;
	}
	
	
	public List<FolloweeView> generateFollowerList(int userId) {
		List<FolloweeView> followerUserList = new ArrayList<>();
		
		List<Followee> followerList = getFollowerListByUserId(userId);
		
		for (Followee follower : followerList) {
			FolloweeView followerview = new FolloweeView();
			// 팔로위 정보
			followerview.setFollowee(follower);
			
			User user = userBO.getUserById(follower.getFollowerId());
			followerview.setUser(user);
			
			followerUserList.add(followerview);
		}
		return followerUserList;
	}
}
