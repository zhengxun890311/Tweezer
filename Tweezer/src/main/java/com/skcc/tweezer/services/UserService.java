package com.skcc.tweezer.services;

import java.util.Date;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.tweezer.models.User;
import com.skcc.tweezer.repositories.UserRepo;

@Service
public class UserService {
	@Autowired
	private UserRepo uR;
	
	// register user and hash password
	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		return uR.save(user);
	}
	
	// find user by email
	public User findByEmail(String email) {
		return uR.findByEmail(email);
	}
	
	// find user by id
	public User findUserById(Long id) {
		Optional<User> opt = uR.findById(id);
		if (opt.isPresent()) {
			return opt.get();
		} else {
			return null;
		}
	}
	
	// authenticate user
	public boolean authenticateUser(String email, String password) {
		// first find user by email
		User user = uR.findByEmail(email);
		if (user==null) {
			return false;
		} else {
			if(BCrypt.checkpw(password,  user.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	public void updateUser(Long id, String firstName, String lastName, Date birthday) {
		uR.updateUser(id, firstName, lastName, birthday);
	}
	
<<<<<<< Upstream, based on master
	public void followUser(Long userId, Long followingId) {
		uR.followUser(userId, followingId);
=======
	public void followUser(User user, User following) {
		uR.followUser(user, following);
>>>>>>> 4053f79 follow user feature
	}
}
