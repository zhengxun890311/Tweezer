package com.skcc.tweezer.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.tweezer.models.Tweet;
import com.skcc.tweezer.repositories.TweetRepo;

@Service
public class TweetService {
	@Autowired
	private TweetRepo tweetRepo;
	
	public Tweet createTweet(Tweet tweet) {
		return tweetRepo.save(tweet);
	}
}
