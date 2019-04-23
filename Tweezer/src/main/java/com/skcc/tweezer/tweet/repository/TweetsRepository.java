package com.skcc.tweezer.tweet.repository;

import org.springframework.data.repository.CrudRepository;

import com.skcc.tweezer.models.Tweet;

public interface TweetsRepository extends CrudRepository<Tweet,Long> {
	
}