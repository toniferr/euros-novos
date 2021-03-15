package com.toni.ferreiro.models.serviceInterface;

import java.util.List;

import com.toni.ferreiro.models.entity.Usuario;

public interface UsuarioServiceInterface {
	
	public List<Usuario> findUsuarios();
	
	public Usuario findUsuarioByUsername(String username);
	
	public Usuario findById(Long id);
	
	public void saveUsuario(Usuario usuario);

}
