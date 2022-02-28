package com.sns.timeline.model;

import java.util.List;

import com.sns.comment.model.Comment;
import com.sns.post.model.Post;
import com.sns.user.model.User;

//타임라인 카드 하나
public class ContentView {
	private Post post; //post 객체전체를 다 가지고 온다.
	private	List<Comment> commentList;
	private User user; // user에 대한 정보도 담아온다.
	//private List<Like> likeList;
	
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
