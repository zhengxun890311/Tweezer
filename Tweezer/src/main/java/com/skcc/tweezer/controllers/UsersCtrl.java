package com.skcc.tweezer.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skcc.tweezer.models.User;
import com.skcc.tweezer.services.UserService;
import com.skcc.tweezer.validators.UserValidator;


@Controller
public class UsersCtrl {
	@Autowired
	private UserService uS;

	@Autowired
	private UserValidator uV;
	
	@Autowired
	private MessageSource mS;
	
	@GetMapping("/")
	public String index(@ModelAttribute("user") User user) {
		return "loginreg.jsp";
	}
	
    @PostMapping("/registration")
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
    	uV.validate(user,  result);
    	if (result.hasErrors()) {
    		return "loginreg.jsp";
    	} else {
    		User u = uS.registerUser(user);
    		session.setAttribute("userId",  u.getId());
    		return "redirect:/home";
    	}
    }
    
    @PostMapping("/login")
    public String loginUser(@ModelAttribute("user") User user, @RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
    	boolean isAuthenticated = uS.authenticateUser(email, password);
    	if (isAuthenticated) {
    		User u = uS.findByEmail(email);
    		session.setAttribute("userId", u.getId());
    		return "redirect:/home";
    	} else {
    		model.addAttribute("error", "invalid credentials");
    		return "loginreg.jsp";
    	}
    }
    
    @GetMapping("/home")
    public String home(Model model, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", uS.findUserById(userId));
    	return "profile.jsp";
    }
    
    @GetMapping("/editUser")
    public String editUser(@ModelAttribute("user") User user, Model model, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", uS.findUserById(userId));
    	return "editUser.jsp";
    }
    
    @PostMapping("/editUser")
    public String updateUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, RedirectAttributes redirectAttributes) {
    	List<String> messages = new ArrayList<String>();
    	if (result.hasErrors()) {
			for (Object object: result.getAllErrors()) {
				if (object instanceof FieldError) {
					FieldError fieldError = (FieldError) object;
					String error = mS.getMessage(fieldError, null);
					messages.add(error);
				}
			}
			redirectAttributes.addFlashAttribute("messages", messages);
			return "redirect:/editUser";
    	} else {
    		uS.updateUser(user.getId(), user.getFirstName(), user.getLastName(), user.getBirthday());
    		return "redirect:/home";
    	}
    }
    
    @GetMapping("/users/{id}")
    public String show(Model model, @PathVariable("id") Long id) {
    	model.addAttribute("user", uS.findUserById(id));
    	return "";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
}