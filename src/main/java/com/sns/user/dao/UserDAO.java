package com.sns.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.sns.user.model.User;

@Repository
public interface UserDAO {

	public List<User> selectUserList();
	
	public boolean existUserId(String loginId);
	
	public int insertUser(
			@Param("loginId") String loginId, 
			@Param("password") String password, 
			@Param("name") String name, 
			@Param("email") String email);
	
	public User selectUserByLoginIdPassword(
			@Param("loginId") String loginId, 
			@Param("password") String password);
	
	public User selectUserByLoginId(String loginId);
	
	public void updateProfileIntroduceByLoginId(
			@Param("loginId") String loginId, 
			@Param("introduce") String introduce, 
			@Param("profileImageUrl") String imagePath);
	
}
