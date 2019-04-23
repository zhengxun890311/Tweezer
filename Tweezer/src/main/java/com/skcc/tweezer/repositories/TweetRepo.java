package com.skcc.tweezer.repositories;

import org.springframework.data.repository.CrudRepository;

import com.skcc.tweezer.models.Tweet;

public interface TweetRepo extends CrudRepository<Tweet,Long> {

}
