package com.in28minutes.springboot.web.domain.configparam;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.EqualsAndHashCode;
import lombok.Getter;

@Table(name = "configparam")
@Entity(name = "configparam")
@Getter
@EqualsAndHashCode(of = "nome")
public class ConfigParam {
	
	public ConfigParam(DadosCadastroConfigParam cadastroConfigParam) {
		super();
		this.nome = cadastroConfigParam.parametro();
		this.valor = cadastroConfigParam.valor();
	}
	
	public ConfigParam() {
	}
	
	@NotNull
	@Id
    private String nome;
	@NotNull
	private String valor;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

}
