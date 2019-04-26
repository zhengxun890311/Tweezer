package com.skcc.tweezer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.skcc.tweezer.models.Like;
import com.skcc.tweezer.services.LikeService;
import com.skcc.tweezer.services.TweetService;

@Controller
public class LikesCtrl {
	@Autowired
	private LikeService lS;
	private TweetService tS;
	
	// like on a user's page
	@PostMapping("/like")
	public String like(@ModelAttribute("likeObj") Like like) {
		lS.createLike(like);
		return "redirect:/users/" + like.getTweet().getUser().getId();
	}
	
	// like on the home page
	@PostMapping("/homeLike")
	public String homeLike(@ModelAttribute("likeObj") Like like) {
		lS.createLike(like);
		return "redirect:/home";
	}
	
	// unlike on a user's page
	@PostMapping("/unlike")
	public String unlike(@ModelAttribute("unlikeObj") Like like, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		System.out.println("userId: " + userId + "****** tweetId: " + like.getTweet().getId());
		lS.unlike(userId, like.getTweet().getId());
		return "redirect:/users/" + like.getTweet().getUser().getId();
	}
	
	// unlike on the home page
	@PostMapping("/homeUnlike")
	public String homeUnlike(@ModelAttribute("unlikeObj") Like like, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		lS.unlike(userId, like.getId());
		return "redirect:/home";
	}
}
