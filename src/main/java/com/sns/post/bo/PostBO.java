package com.sns.post.bo;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.comment.bo.CommentBO;
import com.sns.common.FileManagerService;
import com.sns.like.bo.LikeBO;
import com.sns.post.dao.PostDAO;
import com.sns.post.model.Post;

@Service
public class PostBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FileManagerService fileManager;
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public int addPost(int userId, String content, MultipartFile file, String loginId) {
		String imagePath = null;
		
		if (file != null) {
			//fileManager를 통해 imaPath 저장
			imagePath = fileManager.savefile(loginId, file);
		}
		return postDAO.insertPost(userId, content, imagePath); //이제는 file이 아니라 경로값 들어간다.
	}
	
	public List<Post> getPostList(){
		return postDAO.selectPostList();
	}
	
	public List<Post> getPostListByUserId(int userId) {
		return postDAO.selectPostListByUserId(userId);
	}
	
	public Post getPostById(int postId) {
		return postDAO.selectPostById(postId);
	}
	
	public int deletePostByPostIdUserId(int postId, int userId) {
		return postDAO.deletePostByPostIdUserId(postId, userId);
	}
	
	public void generateDeletePostByPostIdUserId(int postId) {

		// postId로 select를 먼저 한다.
		Post post = getPostById(postId);
		
		// 이미지가 있으면 이미지 삭제
		if (post.getImagePath() != null) {
			try {
				fileManager.deleteFile(post.getImagePath());
			} catch (IOException e) {
				logger.error("[delete post] 이미지 삭제 실패 postId:{}", post.getId());
			}
		}

		//글 삭제 byPostIdUserId
		int count = deletePostByPostIdUserId(postId, post.getUserId());
		
		if (count == 0) {
			logger.error("[delete post] post 삭제 실패 postId: {}", post.getId());
		}
		
		// 댓글들 삭제 byPostId
		commentBO.deleteCommentsByPostId(post.getId());
		
		// 좋아요 삭제 byPostId
		likeBO.removeLikeByPostId(post.getId());
		
	}
}
