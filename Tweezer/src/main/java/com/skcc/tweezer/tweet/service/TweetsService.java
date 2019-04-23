package com.skcc.tweezer.tweet.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skcc.tweezer.models.Tweet;
import com.skcc.tweezer.tweet.repository.TweetsRepository;

@Service
public class TweetsService {
	
	@Autowired
	private TweetsRepository tweetsRepository;
	
	public Tweet createTweet(Tweet tweet) {
		return tweetsRepository.save(tweet);
	}
}