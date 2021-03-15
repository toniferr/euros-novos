package com.toni.ferreiro.models.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toni.ferreiro.models.daoInterface.UsuarioDaoInterface;
import com.toni.ferreiro.models.entity.Usuario;
import com.toni.ferreiro.models.serviceInterface.UsuarioServiceInterface;

@Service
public class UsuarioServiceImpl implements UsuarioServiceInterface {
	
	@Autowired
	private UsuarioDaoInterface usuarioDao;

	@Override
	public List<Usuario> findUsuarios() {
		return usuarioDao.findAll();
	}

	@Override
	public Usuario findUsuarioByUsername(String username) {
		return usuarioDao.findByUsername(username);
	}

	@Override
	public Usuario findById(Long id) {
		return usuarioDao.findById(id).orElse(null);
	}
	
	@Override
	public void saveUsuario(Usuario usuario) {
		usuarioDao.save(usuario);
	}
	
	
}
