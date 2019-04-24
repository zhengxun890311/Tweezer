package com.skcc.tweezer.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skcc.tweezer.models.Reply;
import com.skcc.tweezer.services.ReplyService;

@Controller
public class RepliesCtrl {
	
	@Autowired
	private ReplyService rS;
	private MessageSource mS;
	
	// usersctrl add modelattribute for replyobj
	// when user posts a reply on home page
	@PostMapping("/homeReply")
	public String homeReply(@Valid @ModelAttribute("replyObj") Reply reply, BindingResult result, RedirectAttributes redirectAttributes) {
		List<String> messages = new ArrayList<String>();
		if (result.hasErrors()) {
			for (Object object: result.getAllErrors()) {
				if (object instanceof FieldError) {
					FieldError fieldError = (FieldError) object;
					String error = mS.getMessage(fieldError, null);
					messages.add(error);
				}
				redirectAttributes.addFlashAttribute("messages", messages);
			}
		} else {
			rS.createReply(reply);
		}
		return "redirect:/home";
	}
	
	// when user posts a reply on an user's page
	@PostMapping("/userReply")
	public String userReply(@Valid @ModelAttribute("replyObj") Reply reply, BindingResult result, RedirectAttributes redirectAttributes) {
		List<String> messages = new ArrayList<String>();
		System.out.println(reply.getUser().getId());
		System.out.println(reply.getTweet().getId());
		if (result.hasErrors()) {
			for (Object object: result.getAllErrors()) {
				if (object instanceof FieldError) {
					FieldError fieldError = (FieldError) object;
					String error = mS.getMessage(fieldError, null);
					messages.add(error);
				}
				redirectAttributes.addFlashAttribute("messages", messages);
			}
		} else {
			rS.createReply(reply);
		}
		return "redirect:/users/" + reply.getTweet().getUser().getId();
	}
	
	
}
