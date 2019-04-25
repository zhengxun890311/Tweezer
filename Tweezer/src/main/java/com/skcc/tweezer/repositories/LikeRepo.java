package com.skcc.tweezer.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.skcc.tweezer.models.Like;

@Repository
public interface LikeRepo extends CrudRepository<Like, Long>{

}
