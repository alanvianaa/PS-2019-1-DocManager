package controller;

import javax.inject.Named;

@Named
public class HelloController{

	public String showHello() {
		return "Bem Vindo ao sistema";
	}
}