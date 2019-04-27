package com.skcc.tweezer.repositories;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.skcc.tweezer.models.User;
public interface AdminRepository extends CrudRepository<User,Long>{
	
	@Query(value="select count(*) from users where username=?1", nativeQuery=true)
	int checkUserName(String usrname);
	
	@Query(value="select * from users",nativeQuery=true)
	List<User> findAllUsers();
}
