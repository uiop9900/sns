package com.sns.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.dao.CommentDAO;
import com.sns.comment.model.Comment;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int userId, String content, int postId) {
		return commentDAO.insertComment(userId, content, postId);
	}
	
	public List<Comment> getCommetListByPostId(int postId) {
		return commentDAO.selectCommetListByPostId(postId);
	}
}
