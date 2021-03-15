package com.toni.ferreiro.models.daoInterface;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.toni.ferreiro.models.entity.Configuracion;

public interface ConfiguracionDaoInterface extends CrudRepository<Configuracion, Long> {
	
	public Configuracion findByCodigo(String codigo);
	
	public List<Configuracion> findAll();

}
