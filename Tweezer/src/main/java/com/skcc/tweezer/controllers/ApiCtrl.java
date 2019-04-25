package com.skcc.tweezer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.skcc.tweezer.models.Reply;
import com.skcc.tweezer.models.Tweet;
import com.skcc.tweezer.models.User;
import com.skcc.tweezer.services.UserService;

@Controller
public class ApiCtrl {
	
	@Autowired
	private UserService uS;
	

    @GetMapping("/api")
    public String home(@ModelAttribute("tweetObj") Tweet tweet, Model model, @ModelAttribute("replyObj") Reply reply, @ModelAttribute("followUserObj") User followUser, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	if (userId==null) {
    		return "api.jsp";
    	}else {
    		User u = uS.findUserById(userId);
    		System.out.println(u.getUserPhotoPath());
    		model.addAttribute("user", u);
    		model.addAttribute("following", u.getUserFollowing());
    		model.addAttribute("loggedUser", uS.findUserById(userId));
    		model.addAttribute("followingTweets", uS.getFollowingTweets(userId));
    		model.addAttribute("whoToFollow", uS.getWhoToFollow(userId));
    		return "api.jsp";    		   		
    	}
    }
}
