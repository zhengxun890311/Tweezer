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
	
	@Transactional
	@Modifying
	@Query("update User u set u.firstName=?2, u.lastName=?3, u.birthday=?4 where u.id=?1")
	void updateUser(Long id, String firstName, String lastName, Date birthday);
	
	@Query(value="insert into friendships(user_id, follower_id) values (?1, ?2)", nativeQuery=true)
	void followUser(Long userId, Long followingId);
}
