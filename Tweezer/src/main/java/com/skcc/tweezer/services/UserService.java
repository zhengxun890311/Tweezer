package com.skcc.tweezer.services;

import java.util.Date;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.tweezer.models.Friendship;
import com.skcc.tweezer.models.User;
import com.skcc.tweezer.repositories.FriendshipRepo;
import com.skcc.tweezer.repositories.UserRepo;

@Service
public class UserService {
	@Autowired
	private UserRepo uR;
	private FriendshipRepo fR;
	
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
//	public void saveFriend(Friendship fr) {
//		fR.save(fr);
//	}
//	public void saveFriendship(User user, User follower) {
//		System.out.println(user.getId() + "*****" + follower.getId());
//		Friendship fr = new Friendship(follower, user);
//		fr.setId((long)1);
//		fR.save(fr);
//	}
	public void updateUser(Long id, String firstName, String lastName, Date birthday) {
		uR.updateUser(id, firstName, lastName, birthday);
	}
	
	public void followUser(Long userId, Long followingId) {
		uR.followUser(userId, followingId);
	}

}
