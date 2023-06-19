package com.avengers.bus.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.avengers.bus.dao.UserPassengersDao;
import com.avengers.bus.entityModels.UserPassengers;
import com.avengers.bus.entityModels.UserPassengersId;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class FetchPassengersImpl implements FetchPassengers {

	@Autowired
	private UserPassengersDao updao;

	@Override
	public String getPassengersList() {
		List<UserPassengers> Userpassengers = updao.getAllUserPassengers(9);
		ObjectMapper om = new ObjectMapper();

		try {
			// Convert the list to JSON
			String json = om.writeValueAsString(Userpassengers);
			System.out.println(json);
			return json;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Transactional
	public void addeditedpassengers(UserPassengers userpass) {
		// TODO Auto-generated method stub
		UserPassengersId passengerId = new UserPassengersId(); // Create an instance of the composite key class
		passengerId.setUser_id(userpass.getUser_id()); // Set the user ID
		passengerId.setPassenger_name(userpass.getPassenger_name());
		passengerId.setAge(userpass.getAge());
		passengerId.setGender(userpass.getGender());
		updao.updateUserPassengers(passengerId);

	}

	@Override
	public void deleteUserpassengers(UserPassengers userpass) {
		// TODO Auto-generated method stub

		UserPassengersId passengerId = new UserPassengersId(); // Create an instance of the composite key class
		passengerId.setUser_id(userpass.getUser_id()); // Set the user ID
		passengerId.setPassenger_name(userpass.getPassenger_name());
		passengerId.setAge(userpass.getAge());
		passengerId.setGender(userpass.getGender());
		System.out.println("im in service class");
		updao.deleteUserPassengers(passengerId);

	}

	@Override
	public void addUserpassengers(UserPassengers userpass) {
		// TODO Auto-generated method stub
		updao.persist(userpass);

	}

}
