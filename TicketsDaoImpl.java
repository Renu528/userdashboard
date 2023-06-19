package com.avengers.bus.dao;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.avengers.bus.entityModels.UserTickets;

@Repository
@Transactional
public class TicketsDaoImpl implements TicketsDao {

	@PersistenceContext
	private EntityManager em;

	public void persist(UserTickets userTickets) {
		em.persist(userTickets);
	}

	@Override
	public List<UserTickets> ticketList() {
		System.out.println("this is tickets");
		Query query = em.createQuery("select t from UserTickets t ", UserTickets.class);
		return query.getResultList();
	}

	@Override
	public List<UserTickets> pastTicketList() {
		System.out.println("this is pasttickets");
		LocalDate currentDate = LocalDate.now();
		Date sqlDate = Date.valueOf(currentDate);
		Query query = em.createQuery("select t from UserTickets t where t.booking_date < :sqlDate", UserTickets.class);
		query.setParameter("sqlDate", sqlDate);
		return query.getResultList();
	}

	@Override
	public List<UserTickets> futureTicketList() {
		System.out.println("this is tickets");
		LocalDate currentDate = LocalDate.now();
		Date sqlDate1 = Date.valueOf(currentDate);
		Query query = em.createQuery("select t from UserTickets t where t.booking_date > :sqlDate", UserTickets.class);
		query.setParameter("sqlDate", sqlDate1);
		return query.getResultList();
	}

}
