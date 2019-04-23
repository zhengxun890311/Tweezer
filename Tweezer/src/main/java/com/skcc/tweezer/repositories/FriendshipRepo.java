package com.skcc.tweezer.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.skcc.tweezer.models.Friendship;

@Repository
public interface FriendshipRepo extends CrudRepository<Friendship, Long>{

}
