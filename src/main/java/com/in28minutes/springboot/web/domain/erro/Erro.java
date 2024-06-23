package com.in28minutes.springboot.web.domain.erro;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.EqualsAndHashCode;
import lombok.Getter;

@Table(name = "erro")
@Entity(name = "erro")
@Getter
@EqualsAndHashCode(of = "nome")
public class Erro {
	
	public Erro() {
	}
	
	@NotNull
	@Id
    private Long id;
	
	@NotNull
	@Column(length = 10000)
	private String valor;
	
	private LocalDate dataRegistro;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public LocalDate getDataRegistro() {
		return dataRegistro;
	}

	public void setDataRegistro(LocalDate dataRegistro) {
		this.dataRegistro = dataRegistro;
	}

}
