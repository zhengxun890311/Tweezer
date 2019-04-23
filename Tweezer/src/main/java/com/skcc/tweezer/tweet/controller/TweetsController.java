package com.skcc.tweezer.tweet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TweetsController {
	
	@RequestMapping("/home1")
	public String home(HttpSession session) {
		System.out.println(session.getAttribute("userId"));
		return "/home.jsp";
	}
}
