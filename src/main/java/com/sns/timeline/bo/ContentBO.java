package com.sns.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.model.CommentView;
import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;
import com.sns.timeline.model.ContentView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class ContentBO {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	

	//@Autowired private LikeBO likeBO;
	// 객체가공할때 ->generate, get/ 다른패키지의 bo,dao부를수있다.
	public List<ContentView> generateContentViewList(Integer userId) { // 로그인되지않아도 타임라인은 볼 수 있으므로 userId는 Integer이다.
		
		List<ContentView> contentViewList = new ArrayList<>();
		
		List<Post> postList = postBO.getPostList();
		for (Post post: postList) { //글 개수만큼 post하나씩 꺼낸다: 향상된 for문
			ContentView content = new ContentView();// 각 칸에 다른 글이 들어가야 하기때문에 post개수만큼 새로 생성한다.
			// 글정보
			content.setPost(post);
			
			//글마다 다른 글쓴이 정보
			User user = userBO.getUserById(post.getUserId());
			content.setUser(user);//포스트를 쓴 user정보
			
			//댓글 - 따로 commentView만든
			List<CommentView> commentList = commentBO.generateCommentViewListByPostId(post.getId());
			content.setCommentList(commentList);
			
			
			contentViewList.add(content);
		}

		return contentViewList;
		
		}
	
	

		//반복문을 돌려서 글 리스트(postId)를 가지고 오고 
		//postId를 통해 comment를 가지고오고
		// 그 가져온 comment를 contentview에 넣고 가져온다?^^...
	}
//}
