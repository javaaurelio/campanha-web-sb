package com.in28minutes.springboot.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.in28minutes.springboot.web.domain.configparam.ConfigParam;
import com.in28minutes.springboot.web.domain.configparam.ConfigParamRepository;
import com.in28minutes.springboot.web.domain.configparam.DadosCadastroConfigParam;

import jakarta.validation.Valid;

@Controller()
@SessionAttributes("email")
@RequestMapping("config")
public class ConfigParamController {

	@Autowired
	ConfigParamRepository configParamRepository;

	@PostMapping
	@Transactional
	public String cadastrar(@RequestBody @Valid DadosCadastroConfigParam param, ModelMap model) {
		try {
			configParamRepository.save(new ConfigParam(param));
			
			List<DadosCadastroConfigParam> lista = configParamRepository.findAll().stream()
					.map(DadosCadastroConfigParam::new).toList();
			ArrayList<String> listaParametro =  new ArrayList<String>();
			for (DadosCadastroConfigParam dadosCadastroConfigParam : lista) {
				listaParametro.add("<br>"+dadosCadastroConfigParam.parametro() + ":" + dadosCadastroConfigParam.valor() + " <br>");
			} 
			model.addAttribute("paramentros", listaParametro.toString());
			return "ok";
		} catch (Exception e) {
			return "erro";
		}
	}

	@DeleteMapping("/{nomeParam}")
	@Transactional
	public String delete(ModelMap model, @PathVariable String nomeParam) {
		try {
			configParamRepository.deleteById(nomeParam);
			return "ok";
		} catch (Exception e) {
			return "erro";
		}
	}

	@RequestMapping(method = RequestMethod.GET)
	public String buscarDados(ModelMap model) {
		List<DadosCadastroConfigParam> lista = configParamRepository.findAll().stream()
				.map(DadosCadastroConfigParam::new).toList();
		ArrayList<String> listaParametro =  new ArrayList<String>();
		for (DadosCadastroConfigParam dadosCadastroConfigParam : lista) {
			listaParametro.add("<br>"+dadosCadastroConfigParam.parametro() + ":" + dadosCadastroConfigParam.valor() + " <br>");
		} 
		model.addAttribute("paramentros", listaParametro.toString());
		return "ok";
	}

}
