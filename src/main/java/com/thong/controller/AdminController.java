package com.thong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thong.entity.Account;
import com.thong.dao.AccountDAO;

@Controller
public class AdminController {
	@Autowired
	AccountDAO dao;
	@RequestMapping("/admin/index")
	public String index(Model model) {
		Account item = new Account();
		model.addAttribute("item", item);
		List<Account> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/admin/index";
	}
	
	@ModelAttribute("activates")
	public Map<Boolean, String> getActivate(){
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, "Active");
		map.put(false, "Unactive");
		return map;
	}
	
	@ModelAttribute("admins")
	public Map<Boolean, String> getAdmin(){
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, "Admin");
		map.put(false, "User");
		return map;
	}
	
	@RequestMapping("/account/edit/{username}")
	public String edit(Model model, @PathVariable("username") String username) {		
		Account item = dao.findById(username).get();
		model.addAttribute("item", item);
		List<Account> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/admin/index";
	}
	
	@RequestMapping("/account/update")
	public String update(Account item) {
		dao.save(item);
		return "redirect:/account/edit/" + item.getUsername();
	}
	
	@RequestMapping("/account/delete/{username}")
	public String delete(@PathVariable("username") String username) {
		dao.deleteById(username);
		return "redirect:/admin/index";
	}	
}
