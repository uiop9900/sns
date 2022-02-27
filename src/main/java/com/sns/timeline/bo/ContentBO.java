package com.sns.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.model.Comment;
import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;

@Service
public class ContentBO {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	

	//@Autowired private LikeBO likeBO;
	// 객체가공할때 ->generate, get/ 다른패키지의 bo,dao부를수있다.
	public void List<ContentView> generateContentViewList(Integer userId) { // 로그인되지않아도 타임라인은 볼 수 있으므로 userId는 Integer이다.
		
		List<ContentView> contentView = new ArrayList<>();
		List<Comment> commentList = new ArrayList<>();
		
		// 포스트 리스트
		List<Post> postList = postBO.getPostList(); 
		for (int i = 1; i <= postList.size(); i++) { //post의 수가 postId이다.
			contentView.add((ContentView) commentBO.getCommetListByPostId(i)); // 전체 댓글이 들어가있다.
		}
		
		}
	
	

		//반복문을 돌려서 글 리스트(postId)를 가지고 오고 
		//postId를 통해 comment를 가지고오고
		// 그 가져온 comment를 contentview에 넣고 가져온다?^^...
	}
//}
