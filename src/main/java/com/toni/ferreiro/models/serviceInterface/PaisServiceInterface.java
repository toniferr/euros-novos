package com.toni.ferreiro.models.serviceInterface;

import java.util.List;

import com.toni.ferreiro.models.entity.Pais;

public interface PaisServiceInterface {
	
	public Pais findById(Long id);
	
	public List<Pais> findAll();
	
	public void savePais(Pais pais);

	List<Pais> findPaisesAElegir(Long id);

}
