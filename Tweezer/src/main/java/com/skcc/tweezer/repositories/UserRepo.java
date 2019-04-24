package com.skcc.tweezer.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.skcc.tweezer.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long>{
	List<User> findAll();
	
	User findByEmail(String email);
	
	@Query(value="select users.id, users.user_photo_path, users.first_name, users.last_name, users.username, tweets.text, tweets.created_at, tweets.photo_path, tweets.video_path from friendships join tweets on friendships.following_id = tweets.user_id join users on friendships.following_id = users.id where friendships.user_id=?1 order by tweets.created_at desc", nativeQuery=true)
	List<Object[]> getFollowingTweets(Long id);
	
	@Transactional
	@Modifying
	@Query("update User u set u.firstName=?2, u.lastName=?3, u.birthday=?4,u.userPhotoPath=?5 where u.id=?1")
	void updateUser(Long id, String firstName, String lastName, Date birthday,String userPhotoPath);
	
	@Transactional
	@Modifying
	@Query(value="insert into friendships(user_id, following_id) values (?1, ?2)", nativeQuery=true)
	void followUser(Long userId, Long followingId);
	
	@Transactional
	@Modifying
	@Query(value="delete from friendships where user_id=?1 and following_id=?2", nativeQuery=true)
	void unfollowUser(Long userId, Long unfollowId);

	// finds accounts that the user is not following
	@Query(value="select users.id, users.first_name, users.last_name, users.username, users.user_photo_path from users where users.id not in (select following_id from friendships where user_id=?1) and users.id !=?1", nativeQuery=true)
	List<Object[]> getWhoToFollow(Long id);
}
