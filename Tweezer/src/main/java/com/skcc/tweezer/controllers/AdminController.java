package com.skcc.tweezer.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skcc.tweezer.models.User;
import com.skcc.tweezer.services.AdminService;
import com.skcc.tweezer.services.UserService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@RequestMapping("/admin")
	public String admin(@ModelAttribute("userObj") User user, Model model, ModelMap modelMap) {
		List<User> userList = adminService.findAllUsers();
		model.addAttribute("userList", userList);
		return "/admin.jsp";
	}
}
