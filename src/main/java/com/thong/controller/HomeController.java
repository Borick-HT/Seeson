package com.thong.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.thong.dao.ProductDAO;
import com.thong.entity.Product;
import com.thong.service.ShoppingCartService;


@Controller
public class HomeController {
	@Autowired
	ProductDAO dao;

	 @RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	    public String homePage(Model model,
				@RequestParam("p") Optional<Integer> p) {
			Pageable pageable = PageRequest.of(p.orElse(0), 6);
			Page<Product> page = dao.findAll(pageable);
			model.addAttribute("page", page);
			return "user/home/glasses";
	    }
	 
	 

		
	 
	 @RequestMapping(value = { "/sunglasses" }, method = RequestMethod.GET)
	    public String sunglassesPage(Model model,
				@RequestParam("p") Optional<Integer> p) {
			Pageable pageable = PageRequest.of(p.orElse(1), 7);
			Page<Product> page = dao.findAll(pageable);
			model.addAttribute("page", page);
	        return "user/home/sunglasses";
	    }
	 
	 
	
}
