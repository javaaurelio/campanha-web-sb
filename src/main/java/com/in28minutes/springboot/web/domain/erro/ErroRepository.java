package com.in28minutes.springboot.web.domain.erro;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ErroRepository extends JpaRepository<Erro, Long> {
	Erro findAllByValor(String valor);
}
