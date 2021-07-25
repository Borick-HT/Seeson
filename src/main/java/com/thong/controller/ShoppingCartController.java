package com.thong.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.thong.dao.AccountDAO;
import com.thong.dao.OrderDAO;
import com.thong.dao.ProductDAO;
import com.thong.entity.Account;
import com.thong.entity.Item;
import com.thong.entity.Order;
import com.thong.entity.OrderDetail;
import com.thong.service.SessionService;
import com.thong.service.ShoppingCartService;


@Controller
public class ShoppingCartController {
	@Autowired
	ShoppingCartService cart; // 1. tiêm Spring Bean đã viết ở bài trước
	@Autowired
	SessionService session;
	
	AccountDAO accountDao;
	OrderDAO oderDao;
	ProductDAO productDao;
	//2. xem giỏ hàng
	 @RequestMapping("/cart/view")
	public String view(Model model) {
		model.addAttribute("cart", cart);
		return "user/cart/view"; //3. view lên trang giỏ hảng index
	}
		
	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/cart/view"; // hiển thị giỏ hàng
	}
	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/cart/view";
	}
	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") Integer id, 
	@RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		return "redirect:/cart/view";
	}
	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart/view";
	}
	
	@RequestMapping("/cart/checkout")
	public String checkout() {
		String username= session.get("username");
		Account currentAcc=null;
		if(accountDao.findById(username).isPresent()) {
			currentAcc =accountDao.findById(username).get();
			Order ord=new Order();
			ord.setAccount(currentAcc);
			ord.setCreateDate(new Date());
			ord.setAddress("123");
			List<OrderDetail> details=new ArrayList<>();
			for(Item item:cart.getItems()) {
				OrderDetail od= new OrderDetail();
				od.setOrder(ord);
				productDao.findById(item.getId()).ifPresent(p->{
					od.setProduct(p);
				});
				od.setPrice(item.getPrice());
				od.setQuantity(item.getQty());
				details.add(od);
			}
			ord.setOrderDetails(details);
			oderDao.save(ord);
			cart.clear();
		}
	return "redirect:/cart/view";

	}
	
	
	
}
