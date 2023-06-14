package com.avengers.bus.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.avengers.bus.dao.ListsDao;
import com.avengers.bus.entityModels.User;
import com.avengers.bus.entityModels.UserTickets;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class FetchUser {

	private ListsDao ldao;

	@Autowired
	public FetchUser(ListsDao listdao) {
		super();
		this.ldao = listdao;
	}

	public String getUserList() {
		List<User> services = ldao.UserList(3);
		ObjectMapper om = new ObjectMapper();

		try {
			// Convert the list to JSON
			String json = om.writeValueAsString(services);
			System.out.println(json);
			return json;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Transactional
	public void add(User user) {
		// TODO Auto-generated method stub
		ldao.updateUser(user);

	}
	
	public String getTicketList() {
		List<UserTickets> services = ldao.ticketList();
		ObjectMapper om = new ObjectMapper();

		try {
			// Convert the list to JSON
			String json = om.writeValueAsString(services);
			System.out.println(json);
			return json;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
