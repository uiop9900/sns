package com.sns.timeline.model;

import com.sns.post.model.Post;
import com.sns.user.model.User;

public class UserContentView {

	private User user;
	private Post post;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
}
