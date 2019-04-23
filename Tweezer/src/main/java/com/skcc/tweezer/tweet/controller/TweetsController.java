package com.skcc.tweezer.tweet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skcc.tweezer.models.Tweet;
import com.skcc.tweezer.models.User;
import com.skcc.tweezer.tweet.service.TweetsService;

@Controller
public class TweetsController {
	
	@Autowired
	private TweetsService tweetsService;
	
	@RequestMapping("/home1")
	public String home(HttpSession session,@ModelAttribute("tweetObj") Tweet tweet) {
		System.out.println(session.getAttribute("userId"));
		return "/home.jsp";
	}
	
	@PostMapping("/createTweet")
	public String createTweet(HttpSession session,@ModelAttribute("tweetObj") Tweet tweet) {
		//System.out.println(session.getAttribute("userId"));
		System.out.println(tweet.getText());
		System.out.println(tweet.getText());
		System.out.println(tweet.getText());
		User newUser = new User();
		newUser.setId((Long)session.getAttribute("userId"));
		tweet.setUser(newUser);
		tweetsService.createTweet(tweet);
		return "/home.jsp";
	}
}
