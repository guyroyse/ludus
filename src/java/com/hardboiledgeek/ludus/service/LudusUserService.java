package com.hardboiledgeek.ludus.service;

import java.util.HashSet;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class LudusUserService {

	public static User getCurrentUser() {
		UserService userService = UserServiceFactory.getUserService();
		return userService.getCurrentUser();
	}
	
	public static String createLoginUrl(String returnUrl, String openIdUrl) {
		UserService userService = UserServiceFactory.getUserService();
		return userService.createLoginURL(returnUrl, null, openIdUrl, new HashSet<String>());
	}
	
	public static String createLogoutUrl(String returnUrl) {
		UserService userService = UserServiceFactory.getUserService();
		return userService.createLogoutURL(returnUrl);
	}
	
}
