package com.skcc.tweezer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.client.RestTemplate;

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
    
    
}
