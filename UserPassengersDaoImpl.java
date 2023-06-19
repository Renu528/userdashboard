package com.avengers.bus.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.avengers.bus.entityModels.UserPassengers;
import com.avengers.bus.entityModels.UserPassengersId;

@Repository
@Transactional
public class UserPassengersDaoImpl implements UserPassengersDao {
	@PersistenceContext
	EntityManager em;

	public void persist(UserPassengers userpass) {
		em.persist(userpass);
	}

	@Override
	public List<UserPassengers> getAllUserPassengers(int userId) {
		// TODO Auto-generated method stub
		return em.createQuery("Select up From UserPassengers up where up.user_id=" + userId).getResultList();
	}

	@Transactional
	public void updateUserPassengers(UserPassengersId userpass) {
		em.merge(userpass);

	}

	@Transactional
	public void deleteUserPassengers(UserPassengersId userpass) {
		UserPassengers pass1 = em.find(UserPassengers.class, userpass);
		System.out.print(pass1);
		if (pass1 != null) {
			em.remove(pass1);
		}

	}
}
