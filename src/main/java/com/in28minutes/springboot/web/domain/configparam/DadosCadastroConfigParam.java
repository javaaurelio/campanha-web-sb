package com.in28minutes.springboot.web.domain.configparam;

import jakarta.validation.constraints.NotBlank;

public record DadosCadastroConfigParam(
		
		
		@NotBlank
        String valor,
        
        @NotBlank
        String parametro

        ) {

	
	public DadosCadastroConfigParam(ConfigParam param) {
        this(param.getValor(), param.getNome());
    }
	
}
