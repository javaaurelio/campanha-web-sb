package com.in28minutes.springboot.web.controller.infra;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import com.in28minutes.springboot.web.domain.configparam.ConfigParamRepository;

import jakarta.annotation.PostConstruct;

@Component
public class ParametrosUtil {
	
	private static final Logger LOG = LoggerFactory.getLogger(ParametrosUtil.class);
	
	@Autowired
	private ConfigParamRepository configParamRepository;
	
	private static ConfigParamRepository configParamRepositoryStatic;
	
	@Autowired
	private Environment environment;
	 
	private static Map<String, String> cache = new HashMap<String, String>();
	
	@PostConstruct
    public void init() {
		LOG.info("Environment: ", Arrays.asList(environment.getDefaultProfiles()));
		configParamRepositoryStatic = configParamRepository;
	}
	
	public static String get(String param) {
		
		String valor = cache.get(param);
		if (valor == null) {
			valor = configParamRepositoryStatic.findAllByNome(param).getValor();
			
			if ((valor == null || valor.contains("localhost")) && param.equals("urlApi")) {
				valor = "https://campanha-api-sb-3ce83a806918.herokuapp.com";
			}	

			cache.put(param, valor);
		}		 
		return cache.get(param);
	}
	
	public static void reset() {
		
		cache.clear();
	}

}
