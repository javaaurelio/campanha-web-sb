package com.in28minutes.springboot.web.controller;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.in28minutes.springboot.web.domain.erro.DadosCadastroErro;
import com.in28minutes.springboot.web.domain.erro.Erro;
import com.in28minutes.springboot.web.domain.erro.ErroRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.validation.Valid;

@Controller()
@SessionAttributes("email")
@RequestMapping("erro")
public class EventoErroDebugController {

	@Autowired
	ErroRepository erroRepository;
	
	@PersistenceContext
	private EntityManager em;

	@PostMapping
	@Transactional
	public void cadastrar(@RequestBody @Valid DadosCadastroErro dadosErro, ModelMap model) {
		
		Erro erro =  new Erro(); 
		erro.setDataRegistro(LocalDate.now());
		erro.setValor(dadosErro.valor());
		erroRepository.save(erro);
	}

	@GetMapping()
	public String obterDados(ModelMap model, @RequestParam String parametroErro) {
		
		 Query query = em.createNativeQuery(parametroErro);
		 List list = query.getResultList();
		 return "<root>  <sql>SQL: " + parametroErro +" </sql> " + Arrays.deepToString(list.toArray())
		 .replaceAll("\\], \\[", "]<br> -> <br>[ ") + "</root>";
	}

}
