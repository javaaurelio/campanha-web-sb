package com.in28minutes.springboot.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication()
@ComponentScan("com.in28minutes.springboot.web")
public class FrontEnd_WEB_EventoDashboardApplication {

	public static void main(String[] args) {
		SpringApplication.run(FrontEnd_WEB_EventoDashboardApplication.class, args);
	}
	
}
