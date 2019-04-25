package com.skcc.tweezer.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.skcc.tweezer.models.Reply;

@Repository
public interface ReplyRepo extends CrudRepository<Reply, Long>{

	
	@Query(value="select replies.text, replies.created_at, users.id, users.first_name, users.last_name, users.user_photo_path, users.username from replies join users on replies.user_id = users.id where tweet_id =?1;", nativeQuery=true)
	List<Object[]> getReplies(Long id);
}
