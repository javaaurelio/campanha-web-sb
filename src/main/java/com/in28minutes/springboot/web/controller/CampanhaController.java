package com.in28minutes.springboot.web.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
public class CampanhaController {
	
	@Autowired
	LoginService service;

	@Autowired
	ConfigParamRepository configParamRepository;
	
	@RequestMapping(value="/campanha", method = RequestMethod.GET)
	public String campanha(ModelMap model){
        model.addAttribute("data", LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
		model.addAttribute("urlApi", ParametrosUtil.get("urlApi"));
		model.addAttribute("nomeUsuario", "Fabio");
		model.addAttribute("perfilUsuario", "Admin");
		
		return "campanha";
	}
	@RequestMapping(value="/dashboardevento", method = RequestMethod.GET)
	public String dashboarEvento(ModelMap model){
		model.addAttribute("data", LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
		
		model.addAttribute("nomeUsuario", "Fabio");
		model.addAttribute("perfilUsuario", "Admin");
		model.addAttribute("tituloDashboard", "Campanha_A");
		model.addAttribute("dataInicio", "01/06/2024");
		model.addAttribute("dataFim", "20/06/2024");
		model.addAttribute("urlApi", ParametrosUtil.get("urlApi"));
		
		return "dashboardgraficos";
	}
}
