package com.toni.ferreiro.controllers;

import java.net.MalformedURLException;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
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

import com.toni.ferreiro.models.entity.Pais;
import com.toni.ferreiro.models.serviceInterface.PaisServiceInterface;
import com.toni.ferreiro.models.serviceInterface.UploadFileServiceInterface;

@Secured({"ROLE_USER","ROLE_ADMIN"})
@Controller
@RequestMapping("/pais")
public class PaisController {

	@Autowired
	private PaisServiceInterface paisService;
	
	@Autowired
	private UploadFileServiceInterface uploadFileService;
	
	private final Logger log = LoggerFactory.getLogger(getClass());
	
    @GetMapping(value="/listarCanciones")
	public String listarCanciones(Model model){
    	log.info("Se obtiene toda la información de todos los países");
		model.addAttribute("paises",paisService.findAll());
		return "pais/listar";
	}
    
	@Secured({"ROLE_USER","ROLE_ADMIN"}) //se podria dejar un solo rol entre llaves
	@GetMapping(value = "/upload/{filename:.+}")
	public ResponseEntity<Resource> verFoto(@PathVariable String filename) {
		Resource recurso = null;
		try {
			recurso = uploadFileService.load(filename);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + recurso.getFilename() + "\"")
				.body(recurso);
	}
	
	@GetMapping("/ver/{id}")
	public String ver(@PathVariable(value="id") Long id, Model model, RedirectAttributes flash) {
		Pais pais = paisService.findById(id);
		
		if (pais == null) {
			flash.addAttribute("danger", "El pais no existe");
			return "redirect:/pais/listarCanciones";
		}
		model.addAttribute("pais",pais);
		
		return "pais/form";
	}
	
	@PostMapping("/modificar")
	public String guardar(@Valid Pais pais, BindingResult result, Model model, RedirectAttributes flash
			) {
		
		if (result.hasErrors()) {
			model.addAttribute("pais",pais);
			return "pais/form";
		}
		
		paisService.savePais(pais);
		flash.addFlashAttribute("success","Pais modificado con éxito");
		return "redirect:/pais/listarCanciones";
	}
}
