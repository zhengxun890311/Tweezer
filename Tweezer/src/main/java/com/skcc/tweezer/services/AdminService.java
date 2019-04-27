package com.skcc.tweezer.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.tweezer.models.User;
import com.skcc.tweezer.repositories.AdminRepository;

@Service
public class AdminService {
	@Autowired
	private AdminRepository adminRepository;
	
	public int checkUserName(String usrname) {
		return adminRepository.checkUserName(usrname);
	}
	
	public List<User> findAllUsers(){
		return adminRepository.findAllUsers();
	}
}