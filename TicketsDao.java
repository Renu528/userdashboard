package com.avengers.bus.dao;

import java.util.List;

import com.avengers.bus.entityModels.UserTickets;

public interface TicketsDao {

	public List<UserTickets> ticketList();

	public List<UserTickets> futureTicketList();

	public List<UserTickets> pastTicketList();

}
