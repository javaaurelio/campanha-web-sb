package com.in28minutes.springboot.web.domain.configparam;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ConfigParamRepository extends JpaRepository<ConfigParam, String> {
//    Page<Evento> findAllByAtivoTrue(Pageable paginacao);
	ConfigParam findAllByNome(String nome);
}
