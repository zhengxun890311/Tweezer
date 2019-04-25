package com.skcc.tweezer.controllers;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.skcc.tweezer.models.Tweet;
import com.skcc.tweezer.services.TweetService;

@Controller
public class TweetsCtrl {
	
	@Autowired
	private TweetService tweetService;
	
	@RequestMapping("/home1")
	public String home(HttpSession session,@ModelAttribute("tweetObj") Tweet tweet) {
		System.out.println(session.getAttribute("userId"));
		return "/home.jsp";
	}
	
//	@PostMapping("/createTweet")
//	public String createTweet(HttpSession session,@Valid @ModelAttribute("tweetObj") Tweet tweet, BindingResult result) {
//		//System.out.println(session.getAttribute("userId"));
//		System.out.println(tweet.getText());
//		System.out.println(tweet.getText());
//		System.out.println(tweet.getText());
//		User newUser = new User();
//		newUser.setId((Long)session.getAttribute("userId"));
//		tweet.setUser(newUser);
//		tweetService.createTweet(tweet);
//		return "/home.jsp";
//	}
	
	@PostMapping("/createTweet")
	public String createTweet(HttpSession session, 
			@Valid @ModelAttribute("tweetObj") Tweet tweet, 
			BindingResult result,
			HttpServletRequest request, Model model,
			@RequestParam(value = "myfile") MultipartFile image) {
			String path = request.getSession().getServletContext().getRealPath("/images");
			File file = new File(path);
			if (!file.exists()) {
				file.mkdir();
			}
			String random_photo_name = UUID.randomUUID().toString().replaceAll("-", "");
			try {
				image.transferTo(new File(path + "/" + random_photo_name + "." + "jpg"));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			String url = "images/" + random_photo_name + "." + "jpg";
			System.out.println("database url is：" + url);
			if(tweet.getText().equals("")) {
				tweet.setText("  ");
			}
			if(image.getSize()==0) {
				tweet.setPhoto_path(null);
				System.out.println("11111111111");
				System.out.println("11111111111");
			}
			else {
				tweet.setPhoto_path(url);
			}
			tweetService.createTweet(tweet);
			return "redirect:/home";
	}
}
