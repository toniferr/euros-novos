package com.toni.ferreiro.models.daoInterface;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.toni.ferreiro.models.entity.Usuario;

public interface UsuarioDaoInterface  extends CrudRepository<Usuario, Long>{

	public Usuario findByUsername(String username);
	
	public List<Usuario> findAll();
	
}
