package com.toni.ferreiro.models.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toni.ferreiro.models.daoInterface.PaisDaoInterface;
import com.toni.ferreiro.models.entity.Pais;
import com.toni.ferreiro.models.serviceInterface.PaisServiceInterface;

@Service
public class PaisServiceImpl implements PaisServiceInterface {
	
	@Autowired
	private PaisDaoInterface paisDao;

	@Override
	public List<Pais> findAll() {
		return paisDao.findAllByOrderByEnabledDescPuestoAscNombreAsc();
	}

	@Override
	public Pais findById(Long id) {
		return paisDao.findById(id).orElse(null);
	}

	@Override
	public void savePais(Pais pais) {
		paisDao.save(pais);		
	}
	
	@Override
	public List<Pais> findPaisesAElegir(Long id){
		return paisDao.findPaisesAElegirPorUsuario(id);
	}
	
	
}
