package com.sns.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.common.FileManagerService;
import com.sns.post.dao.PostDAO;
import com.sns.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private FileManagerService fileManager;
	
	@Autowired
	private PostDAO postDAO;
	
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
}
