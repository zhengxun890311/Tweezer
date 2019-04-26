package com.skcc.tweezer.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.skcc.tweezer.models.Reply;
import com.skcc.tweezer.models.Tweet;

@Repository
public interface ReplyRepo extends CrudRepository<Reply, Long>{


	@Query(value="SELECT users.user_photo_path, users.id, users.first_name, users.last_name, users.username, replies.text, replies.created_at "
			+ "FROM replies JOIN users ON replies.user_id = users.id "
			+ "WHERE tweet_id = ?1", nativeQuery=true)
	List<Object[]> getReplies(Long id);
	
//	@Query("SELECT r FROM Reply r WHERE r.tweet = ?1")
//	List<Reply> getRepliesFromATweet(Tweet t);
}
