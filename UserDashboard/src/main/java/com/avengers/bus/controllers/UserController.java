package com.avengers.bus.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

	@RequestMapping(value = "/dash", method = RequestMethod.GET)
	public String getDashboard(Model model) {
		System.out.print("User DashBoard");
		return ("Userdashboard");

	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getDash(Model model) {
		System.out.print("User DashBoard");
		return ("dash1");

	}

}