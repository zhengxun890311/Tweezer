package com.skcc.tweezer.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.skcc.tweezer.models.Tweet;
import com.skcc.tweezer.models.User;

@Repository
public interface TweetRepo extends CrudRepository<Tweet,Long> {
	
	List<Tweet> findByUserOrderByCreatedAtDesc(User u);

}
