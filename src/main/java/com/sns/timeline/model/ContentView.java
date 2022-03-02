package com.sns.timeline.model;

import java.util.List;

import com.sns.comment.model.CommentView;
import com.sns.like.model.LikeView;
import com.sns.post.model.Post;
import com.sns.user.model.User;

//타임라인 카드 하나 - 화면에 뿌리기 위한 용도
public class ContentView {
	private Post post; //post 객체전체를 다 가지고 온다.
	private	List<CommentView> commentList;
	private User user; // user에 대한 정보도 담아온다.

	private int likeCount; // 좋아요의 개수
	private boolean filledLike; //내가 좋아요를 눌렀는지에 대한 여부
	//private List<LikeView> likeList;
	
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<CommentView> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentView> commentList) {
		this.commentList = commentList;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public boolean isFilledLike() {
		return filledLike;
	}
	public void setFilledLike(boolean filledLike) {
		this.filledLike = filledLike;
	}
	
	
	
}
