package com.sns.like.model;

import com.sns.user.model.User;

public class LikeView {
	private Like like;
	private User user;
	
	public Like getLike() {
		return like;
	}
	public void setLike(Like like) {
		this.like = like;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
