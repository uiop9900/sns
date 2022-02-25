package com.sns.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.common.FileManagerService;
import com.sns.user.dao.UserDAO;
import com.sns.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private FileManagerService fileManager;
	
	public List<User> getUserList(){
		return userDAO.selectUserList();
	}
	
	public boolean existUserId(String loginId) {
		return userDAO.existUserId(loginId);
	}
	
	public User getUserByLoginId(String loginId) {
		return userDAO.selectUserByLoginId(loginId);
	}
	
	
	public int addUser(String loginId, String password, String name, String email) {
		return userDAO.insertUser(loginId, password, name, email);
	}
	
	public User getUserByLoginIdPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdPassword(loginId, password);
	}
	
	
	public void updateProfileIntroduceByLoginId(String loginId, String introduce, MultipartFile file) {
		String imagePath = null;
		
		if (file != null) {
			//TODO: fileManagerService  file -> imagePath
			imagePath = fileManager.savefile(loginId, file);
		}
		
		//dao
		userDAO.updateProfileIntroduceByLoginId(loginId, introduce, imagePath);
	}
	
	
}
