package com.in28minutes.springboot.web.domain.erro;

import com.in28minutes.springboot.web.domain.configparam.ConfigParam;

import jakarta.validation.constraints.NotBlank;

public record DadosCadastroErro(@NotBlank String valor) {
	
}
