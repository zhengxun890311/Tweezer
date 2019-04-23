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
	@Query("update User u where u.id=?1 set u.firstName=?2, u.lastName=?3, u.birthday=?4 ")
	void updateUser(Long id, String firstName, String lastName, Date birthday);
	
}
