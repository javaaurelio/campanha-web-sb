package com.in28minutes.springboot.web.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.in28minutes.springboot.web.controller.infra.ParametrosUtil;
import com.in28minutes.springboot.web.domain.configparam.ConfigParamRepository;
import com.in28minutes.springboot.web.service.LoginService;

@Controller
@SessionAttributes("email")
public class HomeController {
	
	@Autowired
	LoginService service;
	
	@Autowired
	ConfigParamRepository configParamRepository;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String root(Model model){
		model.addAttribute("data", LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
		model.addAttribute("urlApi", ParametrosUtil.get("urlApi"));
		return "signin";
	}
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String index(Model model){
		model.addAttribute("data", LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
		model.addAttribute("urlApi", ParametrosUtil.get("urlApi"));
		return "signin";
	}
	
	@RequestMapping(value="/dashboard", method = RequestMethod.GET)
	public String dashboard(Model model){
		model.addAttribute("data", LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
		
		model.addAttribute("nomeUsuario", "Fabio");
		model.addAttribute("perfilUsuario", "Admin");
		
		model.addAttribute("urlApi", ParametrosUtil.get("urlApi"));
		
		
		return "dashboard";
	}
	
}
