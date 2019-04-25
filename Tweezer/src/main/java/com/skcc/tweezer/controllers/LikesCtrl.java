package com.skcc.tweezer.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.skcc.tweezer.models.Like;
import com.skcc.tweezer.models.Tweet;
import com.skcc.tweezer.services.LikeService;
import com.skcc.tweezer.services.TweetService;

@Controller
public class LikesCtrl {
	@Autowired
	private LikeService lS;
	private TweetService tS;
	
	@PostMapping("/like")
	public String like(@ModelAttribute("likeObj") Like like) {
		System.out.println(like.getTweet().getId());
		System.out.println(like.getUser().getId());
		lS.createLike(like);
		return "redirect:/users/" + like.getTweet().getUser().getId();
	}

}
