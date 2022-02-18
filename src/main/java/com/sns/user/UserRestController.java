package com.sns.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
		
	//http:/localhost/user
	@RequestMapping("/user")
	public List<User> userTest() {
		
		List<User> userList = userBO.getUserList();
		
		return userList;
	}
}
