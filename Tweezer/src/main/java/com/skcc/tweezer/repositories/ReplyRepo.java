package com.skcc.tweezer.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.skcc.tweezer.models.Reply;

@Repository
public interface ReplyRepo extends CrudRepository<Reply, Long>{

}
