package com.avengers.bus.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.avengers.bus.dao.ListsDao;
import com.avengers.bus.entityModels.User;
import com.avengers.bus.services.FetchUser;

@RestController
public class ProfileController {

	ListsDao ldao;

	@Autowired
	public ProfileController(ListsDao listdao) {
		ldao = listdao;
	}

	@RequestMapping(value = "/UserList", method = RequestMethod.GET)
	public String UserDetailsController() {
		System.out.println("im working...");
		FetchUser fl = new FetchUser(ldao);
		String userJson = fl.getUserList();
		return userJson;

	}

	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String Userupdate(@RequestBody User user) {
		System.out.println("updatingggg...");
		System.out.println(user.getUser_id());
		System.out.println(user.getFull_name());
		// System.out.println(user.getMobile());
		FetchUser f1 = new FetchUser(ldao);
		f1.add(user);
		// ldao.updateUser(user);
		return "Userdashboard";

	}
	
	
	@RequestMapping(value = "/TicketList", method = RequestMethod.GET)
	public String TicketDetailsController() {
		System.out.println("im working...");
		FetchUser fl = new FetchUser(ldao);
		String userJson = fl.getTicketList();
		return userJson;

	}
	
	

}
