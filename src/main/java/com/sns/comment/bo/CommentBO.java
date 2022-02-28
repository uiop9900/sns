package com.sns.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.dao.CommentDAO;
import com.sns.comment.model.Comment;
import com.sns.comment.model.CommentView;
import com.sns.user.dao.UserDAO;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	
	public int addComment(int userId, String content, int postId) {
		return commentDAO.insertComment(userId, content, postId);
	}
	
	public List<Comment> getCommetListByPostId(int postId) {
		return commentDAO.selectCommetListByPostId(postId);
	}
	
	//bo에서 가공한다.
	public List<CommentView> generateCommentListByPostId(int postId) {
		
		List<CommentView> commentViewList = new ArrayList<>();
	
		List<Comment> commentList = commentDAO.selectCommetListByPostId(postId);
		//commentList
		return null;
	}
}
