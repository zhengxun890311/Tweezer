package com.skcc.tweezer.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.skcc.tweezer.models.Reply;
import com.skcc.tweezer.models.Tweet;
import com.skcc.tweezer.services.ReplyService;
import com.skcc.tweezer.services.TweetService;

@RestController
public class AjaxCtrl {
	@Autowired
	private ReplyService rS;
	@Autowired
	private TweetService tS;
	@Autowired
	private MessageSource mS;
	
	@GetMapping("/viewReplies/{id}")
	public List<Object[]> viewReplies(@PathVariable("id") Long id, Model model) {
		
		
		List<Object[]> replies = rS.getReplies(id);
		
		return replies;
	}
	
}
