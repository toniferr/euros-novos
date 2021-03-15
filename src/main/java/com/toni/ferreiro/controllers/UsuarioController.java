package com.toni.ferreiro.controllers;

import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.toni.ferreiro.models.entity.Pais;
import com.toni.ferreiro.models.entity.Usuario;
import com.toni.ferreiro.models.serviceInterface.ConfiguracionServiceInterface;
import com.toni.ferreiro.models.serviceInterface.PaisServiceInterface;
import com.toni.ferreiro.models.serviceInterface.UsuarioServiceInterface;
import com.toni.ferreiro.utils.Constante;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

	@Autowired
	private UsuarioServiceInterface usuarioService;
	
	@Autowired
	private PaisServiceInterface paisService;
	
	@Autowired
	private ConfiguracionServiceInterface configuracionService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	private final Logger log = LoggerFactory.getLogger(getClass());

    @GetMapping(value="/listarClasificacion")
	public String listarCanciones(Model model){
    	log.info("Se obtiene la clasificación de usuarios");
    	List<Usuario> usuarios = usuarioService.findUsuarios().stream().sorted(Comparator.comparing(Usuario::getPuntos)).collect(Collectors.toList());
		model.addAttribute("usuarios",usuarios);
    	model.addAttribute("muestraApuesta", Boolean.valueOf(configuracionService.findConfiguracionByCodigo(Constante.MUESTRA_APUESTA).getValor()));
		return "usuario/clasificacion";
	}
    
    @GetMapping(value="/listarMiApuesta")
	public String listarMisApuestas(Model model, Authentication authentication){
    	log.info("Se carga la vista para que el usuario pueda apostar");
    	
    	Usuario usuario = usuarioService.findUsuarioByUsername(authentication.getName());
    	model.addAttribute("usuario",usuario);
    	model.addAttribute("permiteApostar", Boolean.valueOf(configuracionService.findConfiguracionByCodigo(Constante.PERMITE_APOSTAR).getValor()));
    	model.addAttribute("paisesElegir",paisService.findPaisesAElegir(usuario.getId()));
		return "usuario/apuesta";
	}
    
    @RequestMapping(value="/apostar")
	public String apostar(@RequestParam(value="paisSustituido") Long paisSustituido, @RequestParam(value="usuarioId") Long usuarioId,
			@RequestParam(value="paisASustituir") Long paisASustituir, Model model, RedirectAttributes flash){
    	log.info("Se realiza la apuesta con el pais seleccionado");
    	
    	Pais paisNuevo= paisService.findById(paisASustituir);
    	Usuario usuario= usuarioService.findById(usuarioId);
    	Set<Pais> paisesApuestaFinal = new HashSet<>();
    	if (paisSustituido != null) {
    		if (usuario.getPaises().size()>0) {
	    		for (Pais pais: usuario.getPaises()) {
	    			if (pais.getId()==paisSustituido) {
	    				paisesApuestaFinal.add(paisNuevo);
	    			}else {
	    				paisesApuestaFinal.add(pais);
	    			}
	    		}
    		}
    	} else {
    		paisesApuestaFinal = usuario.getPaises();
    		paisesApuestaFinal.add(paisNuevo);
    	}
    	usuario.setPaises(paisesApuestaFinal);
    	usuarioService.saveUsuario(usuario);
    	
    	flash.addFlashAttribute("success", "Se guardó la apuesta correctamente. Los países aparecen ordenados alfabéticamente.");
    	return "redirect:listarMiApuesta";
	}
    
	@GetMapping("/ver/{username}")
	public String ver(@PathVariable(value="username") String username, Model model, RedirectAttributes flash) {
		Usuario usuario= usuarioService.findUsuarioByUsername(username);
		
		if (usuario == null) {
			flash.addAttribute("danger", "El usuario no existe");
			return "redirect:/";
		}
		model.addAttribute("usuario",usuario);
		
		return "usuario/form";
	}
	
	@PostMapping("/modificar")
	public String guardar(@Valid Usuario usuario, BindingResult result, Model model, RedirectAttributes flash, SessionStatus status
			) {
		
		if (result.hasErrors()) {
			model.addAttribute("usuario",usuario);
			return "usuario/form";
		}
		
		Usuario usuarioOriginal = usuarioService.findById(usuario.getId());
		usuarioOriginal.setNombre(usuario.getNombre());
		usuarioOriginal.setApellidos(usuario.getApellidos());
		usuarioOriginal.setUsername(usuario.getUsername());
		usuarioOriginal.setPassword(passwordEncoder.encode(usuario.getPassword()));
		usuarioService.saveUsuario(usuarioOriginal);
		flash.addFlashAttribute("success","Usuario modificado con éxito");
		return "redirect:/";
	}
}
