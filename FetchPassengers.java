package com.avengers.bus.services;

import com.avengers.bus.entityModels.UserPassengers;

public interface FetchPassengers {
	public String getPassengersList();

	public void addeditedpassengers(UserPassengers userpass);

	public void deleteUserpassengers(UserPassengers userpass);

	public void addUserpassengers(UserPassengers userpass);

}
