package com.toni.ferreiro.controllers;

import java.security.Principal;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public String listar(Model model, Authentication authentication, HttpServletRequest request, Locale locale) {
		return "inicio";
	}
	
	@GetMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model, Principal principal,
			RedirectAttributes flash) {
		if (principal != null) {
			flash.addFlashAttribute("info", "La sesión ya está iniciada");
			return "redirect:/";
		}
		if (error != null) {
			model.addAttribute("danger", "Error en el login");
		}
		if (logout != null) {
			model.addAttribute("success", "Sesion cerrada con éxito");
		}
		return "login";
	}
}
