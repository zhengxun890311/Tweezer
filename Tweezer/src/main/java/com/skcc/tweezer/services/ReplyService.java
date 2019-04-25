package com.skcc.tweezer.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skcc.tweezer.models.Reply;
import com.skcc.tweezer.repositories.ReplyRepo;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyRepo rR;
	
	public Reply createReply(Reply reply) {
		return rR.save(reply);
	}
	
	public List<Object[]> getReplies(Long id){
		return rR.getReplies(id);
	}
}
