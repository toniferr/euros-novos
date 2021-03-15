package com.toni.ferreiro.models.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;

@Entity
@Table
public class Usuario implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(length = 30, unique = true)
	@NotEmpty
	private String username;

	@Column(length = 60)
	@NotEmpty
	private String password;

	@Column(length = 30)
	@NotEmpty
	private String nombre;

	@Column(length = 60)
	@NotEmpty
	private String apellidos;

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "usuario_id")
	private List<Role> roles;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "usuario_pais", joinColumns = @JoinColumn(name = "usuario_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "pais_id", referencedColumnName = "id"))
	@OrderBy("nombre ASC")
	private Set<Pais> paises;

	@Transient
	private Integer puntos;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public Set<Pais> getPaises() {
		return paises;
	}

	public void setPaises(Set<Pais> paises) {
		this.paises = paises;
	}

	public Integer getPuntos() {
		int puntos = 0;
		for (Pais pais : paises) {
			puntos += (pais.getPuesto());
			if (pais.getPuesto() == 1) {
				puntos -= 3;
			}
		}
		if (paises.isEmpty()) {
			puntos += 30;
		}
		if (paises.size()==1) {
			puntos += 20;
		}
		if (paises.size()==2) {
			puntos += 10;
		}
		if (puntos < 0) {
			return 0;
		} else {
			return puntos;
		}
	}

	public void setPuntos(Integer puntos) {
		this.puntos = puntos;
	}

}
