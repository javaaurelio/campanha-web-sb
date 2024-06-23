package com.in28minutes.springboot.web.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
public class PainelVotacaoController {
	
	@Autowired
	LoginService service;
	
	@Autowired
	ConfigParamRepository configParamRepository;
	
	@RequestMapping(value="/painelvotacao", method = RequestMethod.GET)
	public String campanha(ModelMap model, @RequestParam("l") String layout){
        model.addAttribute("data", LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
		
        model.addAttribute("urlApi", ParametrosUtil.get("urlApi"));
		model.addAttribute("layout", layout);
		model.addAttribute("nomeUsuario", "Fabio");
		model.addAttribute("perfilUsuario", "Admin");
		return "layoutpainelvotacao-"+layout;
	}
	
}
