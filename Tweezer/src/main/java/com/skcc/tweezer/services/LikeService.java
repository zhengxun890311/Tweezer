package com.skcc.tweezer.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.tweezer.models.Like;
import com.skcc.tweezer.repositories.LikeRepo;

@Service
public class LikeService {
	@Autowired
	private LikeRepo lR;
	
	public void createLike(Like like) {
		lR.save(like);
	}
	
	public void unlike(Long userId, Long tweetId) {
		lR.unlike(userId, tweetId);
	}
}
