package com.sns.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.dao.CommentDAO;
import com.sns.comment.model.Comment;
import com.sns.comment.model.CommentView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	
	public int addComment(int userId, String content, int postId) {
		return commentDAO.insertComment(userId, content, postId);
	}
	
	public List<Comment> getCommetListByPostId(int postId) {
		return commentDAO.selectCommetListByPostId(postId);
	}
	
	//bo에서 가공한다.
	public List<CommentView> generateCommentViewListByPostId(int postId) { //post별 comment와 user의 정보
		
		List<CommentView> resultList = new ArrayList<>();
		List<Comment> commentList = getCommetListByPostId(postId);

		for (Comment comment : commentList) { //list에 있는 comment 하나하나를 꺼낸다.
			//commentView 객체 생성
			CommentView commentView = new CommentView(); 
			
			// 객체에 comment 1개 담음 - 댓글
			commentView.setComment(comment);
			
			// 댓글을 쓴 유저의 정보를 가져온 - 댓글쓴이
			User user = userBO.getUserById(comment.getUserId());
			commentView.setUser(user);
			
			// 리스트에 담는다.
			resultList.add(commentView);
			
		}
		return resultList;
	}
	
	public void deleteCommentsByPostId(int postId) {
		commentDAO.deleteCommentsByPostId(postId);
	}
}
