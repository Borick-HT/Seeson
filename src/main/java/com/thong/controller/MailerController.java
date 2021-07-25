package com.thong.controller;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thong.config.MailInfo;
import com.thong.service.MailerService;


@Controller
public class MailerController {
	@Autowired
	MailerService mailer;

	@ResponseBody
	@RequestMapping("/mailer/demo1")
	public String demo1(Model model) {
		try {
			mailer.send("thonghhps11306@fpt.edu.vn", "Subject..hi NGOC TRINH", "Body...hi NGOC TRINH");
			return "OK";
		} catch (MessagingException e) {
			return e.getMessage();
		}
	}

	// lab7.2
	@ResponseBody
	@RequestMapping("/mailer/demo")
	public String demo(Model model) {
		// 1. mail người nhận
		mailer.queue("thonghhps11306@fpt.edu.vn", "Subject..hi NGOC TRINH", "Body...hi NGOC TRINH");
		return "Mail của bạn sẽ được gửi đi trong giây lát";
	}

	// lab7.3
	
	@RequestMapping("/mailer/demo3")
	public String demo3(Model model) {
		// 1. mail người nhận
		//mailer.queue("caophucthinh24@gmail.com", "Subject..hi NGOC TRINH", "Body...hi NGOC TRINH");
		MailInfo mailinfo = new MailInfo();
		model.addAttribute("mailinfo", mailinfo);
		return "mail/mail";
	}
	
	//@ResponseBody
	@RequestMapping("/mailer/send")
	public String send(Model model, MailInfo mailinfo) {
		// 1. mail người nhận
		mailer.queue(mailinfo.getTo(), mailinfo.getSubject(), mailinfo.getBody());
		model.addAttribute("mail", mailinfo);
		return "mail/send";
	}
	

}
