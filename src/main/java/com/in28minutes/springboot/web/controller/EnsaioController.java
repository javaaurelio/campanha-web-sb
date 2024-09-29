package com.in28minutes.springboot.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.in28minutes.springboot.web.controller.infra.ParametrosUtil;
import com.in28minutes.springboot.web.domain.configparam.ConfigParamRepository;
import com.in28minutes.springboot.web.service.LoginService;

@Controller
@SessionAttributes("email")
public class EnsaioController {
	
	@Autowired
	LoginService service;
	
	@Autowired
	ConfigParamRepository configParamRepository;
	
	@RequestMapping(value="/ensaio", method = RequestMethod.GET)
	public String showLoginPage(ModelMap model){
		model.addAttribute("urlApi", ParametrosUtil.get("urlApi"));
		model.addAttribute("nomeUsuario", "Fabio");
		model.addAttribute("perfilUsuario", "Admin");
		return "cadastroensaio";
	}

}
