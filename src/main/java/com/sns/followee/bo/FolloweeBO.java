package com.sns.followee.bo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.followee.dao.FolloweeDAO;
import com.sns.followee.model.Followee;

@Service
public class FolloweeBO {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FolloweeDAO followeeDAO;
	
	public Followee getFollowee(int userId, int followerId) {
		return followeeDAO.selectFollowee(userId, followerId);
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
			followeeDAO.insertFollowee(userId, followerId);
			return "delete";
		}
		
		logger.error("[Followee] 팔로우가 실행되지 못했습니다. userId: {}, followerId:{}" + userId, followerId);
		return null;
	}
}
