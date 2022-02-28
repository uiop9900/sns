package com.sns.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.comment.model.Comment;
import com.sns.comment.model.CommentView;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("userId") int userId, 
			@Param("content") String content, 
			@Param("postId") int postId); 
	
	public List<Comment> selectCommetListByPostId(int postId);
	
}
