package controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import datos.DT_capType;
import entidades.fichas_tecnicas.Tbl_capType;
import util.Util;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class CapController {
	
	@GetMapping("/fichas/capsType")
	public String showCaps(HttpServletRequest req, HttpServletResponse res, Model model) {
		
		DT_capType dtc = new DT_capType();
		JSONObject response = dtc.getCountries(req.getCookies());
		Tbl_capType[] caps = null;
		
		if(response.getInt("status") == 200) {
			caps = (Tbl_capType[]) response.get("caps");
			String[] cookies = (String[]) response.get("cookies");
			Util.setTokenCookies(req, res, cookies);
		}
		
		model.addAttribute("pass", 1);
		model.addAttribute("caps", caps);
		
		return "/fichas/capsType.jsp";
	}

	@PostMapping("/saveCap")
	public RedirectView saveCap(HttpServletRequest req, HttpServletResponse res, RedirectAttributes redir){

		RedirectView rv = new RedirectView(req.getContextPath() + "/fichas/capsType");
		Tbl_capType cap = new Tbl_capType();
		DT_capType dtc = new DT_capType();
		
		cap.setName(req.getParameter("name"));

		JSONObject response = dtc.saveCap(cap, req.getCookies());

		if(response.getInt("status") == 200 || response.getInt("status") == 201){
			redir.addFlashAttribute("msg", 1);
			redir.addFlashAttribute("type", "success");
			redir.addFlashAttribute("cont", "¡Registro creado correctamente!");

		}else if(response.getInt("status") == 401 || response.getInt("status") == 0){
			rv = new RedirectView(req.getContextPath() + "/login");
			redir.addFlashAttribute("error", 1);
			redir.addFlashAttribute("type", "info");
			redir.addFlashAttribute("msg", "¡Debe Iniciar Sesión!");

		}else if(response.getInt("status") == 400){
			redir.addFlashAttribute("msg", 1);
			redir.addFlashAttribute("type", "warning");
			redir.addFlashAttribute("cont", "¡El sombrero especificado ya existe!");
		}

		return rv;
	}

	@GetMapping("/deleteCap")
	public RedirectView deleteCap(HttpServletRequest req, HttpServletResponse res, RedirectAttributes redir) {
		RedirectView rv = new RedirectView(req.getContextPath() + "/fichas/capsType");
		int id;
		try{
			id = Integer.parseInt(req.getParameter("id"));
		}catch(NumberFormatException e){
			return rv;
		}


		DT_capType dtc = new DT_capType();
		JSONObject response = dtc.deleteCap(id, req.getCookies());

		if(response.getInt("status") == 200 || response.getInt("status") == 204) {
			redir.addFlashAttribute("msg", 1);
			redir.addFlashAttribute("type", "success");
			redir.addFlashAttribute("cont", "¡Registro eliminado correctamente!");

		}else if(response.getInt("status") == 401 || response.getInt("status") == 0) {
			rv = new RedirectView(req.getContextPath() + "/login");
			redir.addFlashAttribute("error", 1);
			redir.addFlashAttribute("type", "info");
			redir.addFlashAttribute("cont", "¡Debe iniciar sesión!");
		}else if(response.getInt("status") == 500) {
			redir.addFlashAttribute("msg", 1);
			redir.addFlashAttribute("type", "danger");
			redir.addFlashAttribute("cont", "¡Ha ocurrido un error en el servidor y falló el proceso!");
		}


		return rv;
	}
}
