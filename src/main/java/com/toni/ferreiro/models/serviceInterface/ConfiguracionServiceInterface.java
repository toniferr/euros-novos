package com.toni.ferreiro.models.serviceInterface;

import java.util.List;

import javax.validation.Valid;

import com.toni.ferreiro.models.entity.Configuracion;

public interface ConfiguracionServiceInterface {

	public Configuracion findConfiguracionByCodigo(String codigo);

	public List<Configuracion> findAll();

	public Configuracion findById(Long id);

	public void saveConfiguracion(@Valid Configuracion configuracion);

}
