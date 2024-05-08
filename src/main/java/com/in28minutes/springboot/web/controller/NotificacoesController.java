package com.in28minutes.springboot.web.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.in28minutes.springboot.web.model.Emails;
import com.in28minutes.springboot.web.service.LoginService;

@RestController
@SessionAttributes("email")
public class NotificacoesController {
	
	@Autowired
	LoginService service;
	
	@RequestMapping(value="/getEmail", method = RequestMethod.GET)
	public List<Emails> logar(ModelMap model){
		
		Emails a = new Emails("fabio","Oi");
		Emails b = new Emails("Luana","Oi...");
		
//		sb.append(<a href="#" class="dropdown-item text-center">See all message</a>
		
		ArrayList<Emails> lista = new ArrayList();
		lista.add(a);
		lista.add(b);
		
		return lista;
	}

}
