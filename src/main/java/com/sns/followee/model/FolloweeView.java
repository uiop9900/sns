package com.sns.followee.model;

import com.sns.user.model.User;

public class FolloweeView {

	private Followee followee;
	private User user;
	
	
	public Followee getFollowee() {
		return followee;
	}
	public void setFollowee(Followee followee) {
		this.followee = followee;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
