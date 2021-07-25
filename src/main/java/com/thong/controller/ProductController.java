package com.thong.controller;

import java.io.File;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.thong.dao.ProductDAO;
import com.thong.entity.Product;
import com.thong.service.SessionService;
import com.thong.service.UploadService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO dao;
	UploadService uploadService;
	// hàm 1
//	@RequestMapping("/product/sort")
//	public String sort(Model model) {
//		List<Product> items = dao.findAll(); // truy vấn tất cả
//		model.addAttribute("items", items);
//		return "product/sort";
//	}
	
	
	// lab5.3
	
	@RequestMapping("/product/sort")
	public String sort(Model model, 
			@RequestParam("field") Optional<String> field) {
		Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
		model.addAttribute("field", field.orElse("price").toUpperCase());
		List<Product> items = dao.findAll(sort);
		model.addAttribute("items", items);
		return "product/sort";
	}
	
	// hàm 2
	
//	@RequestMapping("/product/page")
//	public String paginate(Model model) {
//		Pageable pageable = PageRequest.of(2, 5);
//		Page<Product> page = dao.findAll(pageable);
//		model.addAttribute("page", page);
//		return "product/page";
//	}
	
	@RequestMapping("/product/page")
	public String paginate(Model model,
			@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = dao.findAll(pageable);
		model.addAttribute("page", page);
		return "admin/product/page";
		//return "product/page2"; // giao dien dep
	}
	

	
	//lab6.1
	@RequestMapping("/product/search")
	public String search(Model model, 
			@RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max) {
		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		//List<Product> items = dao.findByPrice(minPrice, maxPrice); //lab6.1
		List<Product> items = dao.findByPriceBetween(minPrice, maxPrice); //lab6.4
		model.addAttribute("items", items);
		return "product/search";
	}

	
	
	//lab6.2
	
	@Autowired
	SessionService session;
	
	@RequestMapping("/product/search-and-page")
	public String searchAndPage(Model model, 
			@RequestParam("keywords") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		//Page<Product> page = dao.findByKeywords("%"+kwords+"%", pageable); //lab6.3
		Page<Product> page = dao.findAllByNameLike("%"+kwords+"%", pageable); //lab6.5
		model.addAttribute("page", page);
		return "product/search-and-page";
	}
	@RequestMapping("/product/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {		
		Product item = dao.findById(id).get();
		model.addAttribute("item", item);
		List<Product> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/admin/form";
	}
	
	@RequestMapping("/admin/product/create")
	public String form(Model model) {
		Product item = new Product();
		model.addAttribute("item", item);
		return "admin/admin/form";
	}
	
	
	@RequestMapping("/product/create")
	public String create(Product item) {		
		dao.save(item);
		return "redirect:/product/page";
	}
	
	@RequestMapping("/product/update")
	public String update(Product item) {
		dao.save(item);
		return "redirect:/product/edit/" + item.getId();
	}
	@RequestMapping("/admin/product/save/{c}")
	public String save(Product item, @RequestParam("photo_file") MultipartFile file, @PathVariable("c") boolean c) {
		File savedFile = uploadService.save(file, "img");
		item.setImage("img"+file.getOriginalFilename());
		dao.save(item);
		if(c) {
			return "redirect:/product/page";
		}
		return "redirect:/admin/product/create";
	}
	@RequestMapping("/admin/product/update/{c}")
	public String update(Product item, @RequestParam("photo_file") MultipartFile file, @PathVariable("c") boolean c) {
		if(file.getSize()==0) {
			Product oldItem = dao.findById(item.getId()).get();
			item.setImage(oldItem.getImage());
		}else {
			File savedFile = uploadService.save(file, "img");
			item.setImage("img"+file.getOriginalFilename());
		}
		dao.save(item);
		if(c) {
			return "redirect:/product/page";
		}
		return "redirect:/product/edit/" + item.getId();
	}
	@RequestMapping("/product/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		dao.deleteById(id);
		return "redirect:/product/page";
	}	
}

