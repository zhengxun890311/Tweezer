package com.skcc.tweezer.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skcc.tweezer.models.Tweet;
import com.skcc.tweezer.models.User;
import com.skcc.tweezer.services.TweetService;

public class TweetsCtrl {
	
	@Autowired
	private TweetService tweetService;
	
	@RequestMapping("/home1")
	public String home(HttpSession session,@ModelAttribute("tweetObj") Tweet tweet) {
		System.out.println(session.getAttribute("userId"));
		return "/home.jsp";
	}
	
	@PostMapping("/createTweet")
	public String createTweet(HttpSession session,@Valid @ModelAttribute("tweetObj") Tweet tweet, BindingResult result) {
		//System.out.println(session.getAttribute("userId"));
		System.out.println(tweet.getText());
		System.out.println(tweet.getText());
		System.out.println(tweet.getText());
		User newUser = new User();
		newUser.setId((Long)session.getAttribute("userId"));
		tweet.setUser(newUser);
		tweetService.createTweet(tweet);
		return "/home.jsp";
	}
}
