package com.in28minutes.springboot.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.in28minutes.springboot.web.controller.infra.ParametrosUtil;
import com.in28minutes.springboot.web.domain.configparam.ConfigParamRepository;
import com.in28minutes.springboot.web.service.LoginService;

@Controller
@SessionAttributes("email")
public class LoginController {
	
	@Autowired
	LoginService service;
	
	@Autowired
	ConfigParamRepository configParamRepository;
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String showLoginPage(ModelMap model){
		model.addAttribute("urlApi", ParametrosUtil.get("urlApi"));
		return "signin";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String showWelcomePage(ModelMap model, @RequestParam String username, @RequestParam String password){
		
		boolean isValidUser = service.validateUser(username, password);
		
		if (!isValidUser) {
			model.put("errorMessage", "Invalid Credentials");
			return "signin";
		}
		
		model.put("name", username);
		model.addAttribute("urlApi", ParametrosUtil.get("urlApi"));
		
		
		
		
		return "dashboard";
	}
	
	@RequestMapping(value="/sigini", method = RequestMethod.POST)
	public String logar(ModelMap model, @RequestParam String username, @RequestParam String password){
		
		boolean isValidUser = service.validateUser(username, password);
		
		if (!isValidUser) {
			model.put("errorMessage", "Invalid Credentials");
			return "signin";
		}
		
		model.put("nomeUsuario", "Fabio");
		model.put("perfilUsuario", "Admin");
		model.put("name", username);
		model.addAttribute("urlApi", ParametrosUtil.get("urlApi"));
		
		return "redirect:/dashboard";
	}

}
