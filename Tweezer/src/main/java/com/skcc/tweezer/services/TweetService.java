package com.skcc.tweezer.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.tweezer.models.Tweet;
import com.skcc.tweezer.models.User;
import com.skcc.tweezer.repositories.TweetRepo;

@Service
public class TweetService {
	@Autowired
	private TweetRepo tR;
	
	public Tweet createTweet(Tweet tweet) {
		return tR.save(tweet);
	}
	
	public Tweet findTweet(Long id) {
		return tR.findById(id).get();
	}
	
	public List<Tweet> findUserTweets(User u){
		return tR.findByUserOrderByCreatedAtDesc(u);
	}

}
