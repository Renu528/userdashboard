package com.avengers.bus.dao;

import java.util.List;

import com.avengers.bus.entityModels.UserPassengers;
import com.avengers.bus.entityModels.UserPassengersId;

public interface UserPassengersDao {

	public List<UserPassengers> getAllUserPassengers(int userId);

	public void updateUserPassengers(UserPassengersId userpass);

	public void deleteUserPassengers(UserPassengersId userpass);

	public void persist(UserPassengers userpass);
}
