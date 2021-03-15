package com.toni.ferreiro.models.daoInterface;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.toni.ferreiro.models.entity.Pais;

public interface PaisDaoInterface extends CrudRepository<Pais, Long> {
	
	public List<Pais> findAllByOrderByEnabledDescPuestoAscNombreAsc();
	
	@Query("select p from Pais p where p.enabled = 1 order by p.puesto, p.nombre asc")
	public List<Pais> findPaisesAElegirPorUsuario(Long id);
}
