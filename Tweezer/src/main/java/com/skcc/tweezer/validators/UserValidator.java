package com.skcc.tweezer.validators;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.skcc.tweezer.models.User;
import com.skcc.tweezer.services.UserService;


@Component
public class UserValidator implements Validator {
	@Autowired
	private UserService userService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}
	
    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        int duEmail = userService.checkDuplicateEmail(user.getEmail());
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirmation", "Match");
        }
        if(duEmail>0) {
        	errors.rejectValue("email", "Match");
        }
    }
}

