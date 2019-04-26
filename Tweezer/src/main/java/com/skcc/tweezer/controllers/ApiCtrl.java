package com.skcc.tweezer.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.client.RestTemplate;

import com.skcc.tweezer.models.Like;
import com.skcc.tweezer.models.Reply;
import com.skcc.tweezer.models.Tweet;
import com.skcc.tweezer.models.User;
import com.skcc.tweezer.services.UserService;

@Controller
public class ApiCtrl {
	
	@Autowired
	private UserService uS;
	private RestTemplate rT;

    
    @GetMapping("/news")
    public String moments(Model model, HttpSession session) {
    	
    	Long userId = (Long) session.getAttribute("userId");
    	if (userId==null) {
    		return "redirect:/";
    	} else {
//		final String uri = "https://content.guardianapis.com/search?q=technology&api-key=c0f4afff-8d9c-4006-8a44-b778650d8e0f";

    	// API for most recent news on Guardian
		final String uri = "https://content.guardianapis.com/search?api-key=c0f4afff-8d9c-4006-8a44-b778650d8e0f";
		RestTemplate restTemplate = new RestTemplate();
		Object news = restTemplate.getForObject(uri,  Object.class);
		model.addAttribute("news", news);
		
		final String uri2 = "https://content.guardianapis.com/sections?api-key=c0f4afff-8d9c-4006-8a44-b778650d8e0f";
		RestTemplate restTemplate2 = new RestTemplate();
		Object trends = restTemplate2.getForObject(uri2,  Object.class);
		model.addAttribute("trends", trends);
		
		User u = uS.findUserById(userId);
		model.addAttribute("user", u);
		model.addAttribute("loggedUser", uS.findUserById(userId));
		model.addAttribute("whoToFollow", uS.getWhoToFollow(userId));
		
    	return "moments.jsp";
    	}
    }
    
    @GetMapping("/test")
    public String home(@ModelAttribute("tweetObj") Tweet tweet, Model model, @ModelAttribute("replyObj") Reply reply, @ModelAttribute("followUserObj") User followUser, @ModelAttribute("likeObj") Like like, @ModelAttribute("unlikeObj") Like unlike, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	if (userId==null) {
    		return "redirect:/";
    	}else {

    		final String uri = "https://content.guardianapis.com/sections?api-key=c0f4afff-8d9c-4006-8a44-b778650d8e0f";
    		RestTemplate restTemplate = new RestTemplate();
    		Object result = restTemplate.getForObject(uri,  Object.class);
    	
    		User u = uS.findUserById(userId);
    		model.addAttribute("user", u);
    		model.addAttribute("following", u.getUserFollowing());
    		model.addAttribute("loggedUser", uS.findUserById(userId));
    		model.addAttribute("followingTweets", uS.getFollowingTweets(userId));
    		model.addAttribute("whoToFollow", uS.getWhoToFollow(userId));
    		model.addAttribute("trends", result);
    		
    		List<Number> following = new ArrayList<Number>();
    		
    		String str = "";
    		
    		List<Object[]> res = uS.getFollowing(userId);
    		res.forEach(i -> {
    			following.add((Number) i[0]);
    		});
    		
    		System.out.println(following);
    		
    		for (int i=0; i<following.size(); i++) {
    			str += following.get(i);
    		}
    		
    		System.out.println(str);
    		
    		model.addAttribute("follow", following);
    		model.addAttribute("str", str);
    		
    		model.addAttribute("allTweets", uS.getAllTweets());
    		
    		return "api.jsp";    		   		
    	}
    }
    
}
