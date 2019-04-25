package com.skcc.tweezer.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.skcc.tweezer.models.Tweet;

@Repository
public interface TweetRepo extends CrudRepository<Tweet,Long> {
	

}
