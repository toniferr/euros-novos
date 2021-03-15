package com.toni.ferreiro.controllers;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.toni.ferreiro.models.entity.Configuracion;
import com.toni.ferreiro.models.serviceInterface.ConfiguracionServiceInterface;

@Secured({"ROLE_USER","ROLE_ADMIN"})
@Controller
@RequestMapping("/configuracion")
public class ConfiguracionController {
	
	@Autowired
	private ConfiguracionServiceInterface configuracionService;
	
	private final Logger log = LoggerFactory.getLogger(getClass());
	
    @GetMapping(value="/listar")
	public String listar(Model model){
    	log.info("Se obtiene toda la información de todas las configuracion");
		model.addAttribute("configuraciones",configuracionService.findAll());
		return "configuracion/listar";
	}
    
	@GetMapping("/ver/{id}")
	public String ver(@PathVariable(value="id") Long id, Model model, RedirectAttributes flash) {
		Configuracion configuracion = configuracionService.findById(id);
		
		if (configuracion == null) {
			flash.addAttribute("danger", "La configuracion no existe");
			return "redirect:/configuracion/listar";
		}
		model.addAttribute("configuracion",configuracion);
		
		return "configuracion/form";
	}
	
	@PostMapping("/modificar")
	public String guardar(@Valid Configuracion configuracion, BindingResult result, Model model, RedirectAttributes flash, SessionStatus status
			) {
		
		if (result.hasErrors()) {
			model.addAttribute("configuracion",configuracion);
			return "configuracion/form";
		}
		
		configuracionService.saveConfiguracion(configuracion);
		flash.addFlashAttribute("success","Configuración modificada con éxito");
		return "redirect:/configuracion/listar";
	}

}
