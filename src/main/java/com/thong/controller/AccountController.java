package com.thong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thong.dao.AccountDAO;
import com.thong.entity.Account;
import com.thong.service.SessionService;

@Controller
public class AccountController {
	@Autowired
	AccountDAO dao;
	@Autowired
	SessionService session;
	
	@GetMapping("/account/login")
	public String login() {
		return "user/account/login";
	}
	@PostMapping("/account/login1")
	public String login(Model model,
			@RequestParam("username") String username,
			@RequestParam("password") String password) {
		try {
			Account user = dao.getOne(username);
			if(!user.getPassword().equals(password)) {
				model.addAttribute("message", "Invalid password");
			} else {
//				if(this.checkRole(user)) {
//					return "/admin/index";
//				}else {
//					return "/home/index";
//				}
				
				String uri = session.get("security-uri");
				if(uri != null) {
					return "redirect:" + uri;
				} else {
					model.addAttribute("message", "Login successfylly");
					if(this.checkRole(user)) {
						return "redirect:/admin/index";
					}else {
						return "redirect:/home";
					}
				}
			}
		} catch (Exception e) {
			model.addAttribute("message", "Invalid username");
		}
		return "user/account/login";
	}
	private boolean checkRole(Account user) {
		if (user.isAdmin()) {
			return true;
		}
		return false;
	}
}
