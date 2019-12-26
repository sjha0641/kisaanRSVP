package com.rsvp.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.rsvp.entity.Bidder;
import com.rsvp.entity.DetailsBidder;
import com.rsvp.entity.Login;

@Repository
public class BidderRepository {
	
	@PersistenceContext
	EntityManager entityManager;
	
	public void addBidder(Bidder bidder,DetailsBidder detailsbidder,Login login) {
		bidder.setLogin(login);
		bidder.setDetailsBidder(detailsbidder);
		entityManager.merge(bidder);
	}
}
