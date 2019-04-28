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
		return "/home.jsp";
	}
	
	@PostMapping("/createTweet")
	public String createTweet(HttpSession session, 
			@Valid @ModelAttribute("tweetObj") Tweet tweet, 
			BindingResult result,
			HttpServletRequest request, Model model,
			@RequestParam(value = "myfile") MultipartFile image) {
			String path="";
			String random_file_name = UUID.randomUUID().toString().replaceAll("-", "");
			String url="";
			String fileName="";
			if(image.getSize()==0) {
				tweet.setPhoto_path(null);
				tweet.setVideo_path(null);
			}
			else {
				fileName= image.getOriginalFilename();
				String fileType = fileName.substring(fileName.length()-4, fileName.length()).toString();
				if(fileType.equals(".mp4")){
					path= request.getSession().getServletContext().getRealPath("/videos");
					File file = new File(path);
					if (!file.exists()) {
						file.mkdir();
					}
					try {
						image.transferTo(new File(path + "/" + random_file_name + "." + "mp4"));
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					url = "videos/" + random_file_name + "." + "mp4";
					tweet.setVideo_path(url);
					tweet.setPhoto_path(null);
				}
				else {
					path = request.getSession().getServletContext().getRealPath("/images");
					File file = new File(path);
					if (!file.exists()) {
						file.mkdir();
					}
					try {
						image.transferTo(new File(path + "/" + random_file_name + "." + "jpg"));
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					url = "images/" + random_file_name + "." + "jpg";
					tweet.setPhoto_path(url);
					tweet.setVideo_path(null);
				}
			}
			if(tweet.getText().equals("")) {
				tweet.setText("  ");
			}
			tweetService.createTweet(tweet);
			return "redirect:/home";
	}
}