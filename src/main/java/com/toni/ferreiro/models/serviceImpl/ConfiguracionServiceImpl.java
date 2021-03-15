package com.toni.ferreiro.models.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toni.ferreiro.models.daoInterface.ConfiguracionDaoInterface;
import com.toni.ferreiro.models.entity.Configuracion;
import com.toni.ferreiro.models.serviceInterface.ConfiguracionServiceInterface;

@Service
public class ConfiguracionServiceImpl implements ConfiguracionServiceInterface {

	@Autowired
	private ConfiguracionDaoInterface configuracionDao;
	
	@Override
	public Configuracion findConfiguracionByCodigo(String codigo) {
		return configuracionDao.findByCodigo(codigo);
	}

	@Override
	public List<Configuracion> findAll() {
		return configuracionDao.findAll();
	}

	@Override
	public Configuracion findById(Long id) {
		return configuracionDao.findById(id).orElse(null);
	}

	@Override
	public void saveConfiguracion(Configuracion configuracion) {
		configuracionDao.save(configuracion);
	}
}
