package com.avengers.bus.entityModels;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "btrs_tickets")
public class UserTickets {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	String booking_id;
	String payment_id;
	int user_id;
	Date booking_date;
	Time booking_time;
	int route_id;
	int trip_id;
	int service_id;
	String payment_mode;
	int total_fare;
	String status;
	int no_of_seats_booked;

	public String getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(String booking_id) {
		this.booking_id = booking_id;
	}

	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}

	public Time getBooking_time() {
		return booking_time;
	}

	public void setBooking_time(Time booking_time) {
		this.booking_time = booking_time;
	}

	public int getRoute_id() {
		return route_id;
	}

	public void setRoute_id(int route_id) {
		this.route_id = route_id;
	}

	public int getTrip_id() {
		return trip_id;
	}

	public void setTrip_id(int trip_id) {
		this.trip_id = trip_id;
	}

	public int getService_id() {
		return service_id;
	}

	public void setService_id(int service_id) {
		this.service_id = service_id;
	}

	public String getPayment_mode() {
		return payment_mode;
	}

	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}

	public int getTotal_fare() {
		return total_fare;
	}

	public void setTotal_fare(int total_fare) {
		this.total_fare = total_fare;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getNo_of_seats_booked() {
		return no_of_seats_booked;
	}

	public void setNo_of_seats_booked(int no_of_seats_booked) {
		this.no_of_seats_booked = no_of_seats_booked;
	}

	@Override
	public String toString() {
		return "UserTickets [booking_id=" + booking_id + ", payment_id=" + payment_id + ", user_id=" + user_id
				+ ", booking_date=" + booking_date + ", booking_time=" + booking_time + ", route_id=" + route_id
				+ ", trip_id=" + trip_id + ", service_id=" + service_id + ", payment_mode=" + payment_mode
				+ ", total_fare=" + total_fare + ", status=" + status + ", no_of_seats_booked=" + no_of_seats_booked
				+ "]";
	}

}
