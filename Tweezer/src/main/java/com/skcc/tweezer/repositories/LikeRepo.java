package com.skcc.tweezer.repositories;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.skcc.tweezer.models.Like;

@Repository
public interface LikeRepo extends CrudRepository<Like, Long>{

	@Transactional
	@Modifying
	@Query(value="delete from likes where user_id=?1 and tweet_id=?2", nativeQuery=true)
	void unlike(Long userId, Long tweetId);
	
	
}
