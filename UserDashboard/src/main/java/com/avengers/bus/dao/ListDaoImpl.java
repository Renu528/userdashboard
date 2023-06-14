package com.avengers.bus.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.avengers.bus.entityModels.User;
import com.avengers.bus.entityModels.UserTickets;


@Repository
@Transactional
public class ListDaoImpl implements ListsDao {
	@PersistenceContext
	private EntityManager em;

	public void persist(User user) {
		em.persist(user);
	}

	@Override
	public List<User> UserList(int userId) {
		// TODO Auto-generated method stub
		Query query = em.createQuery("select u from User u WHERE u.id= :userId", User.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}

	public User findById(long id) {
		User user = (User) em.find(User.class, id);
		return user;
	}

	@Transactional
	public void updateUser(User user) {
		em.merge(user);
	}

	@Override
	public List<UserTickets> ticketList() {
		Query query = em.createQuery("select t from UserTickets t");
		return query.getResultList();
	}
}
