package com.spring.coupon.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.coupon.TestValidator;
import com.spring.coupon.domain.WriteDTO;
import com.spring.coupon.service.BoardService;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
@RequestMapping("/coupon")
public class BoardController {
private BoardService boardService;
	
	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	

	public BoardController() {
		System.out.println("BoardController()");
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", boardService.list());
		return "coupon/list";
	}
	
	@RequestMapping("/write")
	public String write(Model model) {
		return "coupon/write";
	}
	
	@RequestMapping("/writeOk")
	public String writeOk(@ModelAttribute("w") @Valid WriteDTO dto, Model model,
			BindingResult result) {  
		System.out.println("writeOk(): " + dto.getCid() + ":" + dto.getName());
		
		System.out.print("validate 후 "); showErrors(result);
		
		String page = "coupon/writeOk";
		
		if(result.hasErrors()) { 
			page = "coupon/write";  
		}
		model.addAttribute("result", boardService.write(dto));
		
		return page;
	}
	
	@GetMapping("/view")
	public String view(int cid, Model model) {
		model.addAttribute("list", boardService.viewByCid(cid));
		return "coupon/view";
	}
	
	@RequestMapping("/update")
	public String update(int cid, Model model) {
		model.addAttribute("list", boardService.selectByCid(cid));		
		return "coupon/update";
	}

	@PostMapping("/updateOk")
	public String updateOk(@ModelAttribute("w") @Valid WriteDTO dto, Model model,
			BindingResult result) {
		System.out.println("updateOk(): " + dto.getCid() + ":" + dto.getName());
		
		System.out.print("validate 후 "); showErrors(result);
		
		String page = "coupon/updateOk";
		
		if(result.hasErrors()) { 
			page = "coupon/update";
		}
		
		model.addAttribute("result", boardService.update(dto));
		
		return page;
	}

	@GetMapping("/deleteOk")
	public String deleteOk(int cid, Model model) {
		model.addAttribute("result", boardService.deleteByCid(cid));
		return "coupon/deleteOk";
	}
	
	public void showErrors(Errors errors) {
		if(errors.hasErrors()) {
			System.out.println("에러 개수 : " + errors.getErrorCount());
			System.out.println("\t[field]\t|[code]");
			List<FieldError> errList = errors.getFieldErrors();
			for(FieldError err : errList) {
				System.out.println("\t" + err.getField() + "\t|" + err.getCode());
			}
		} else {
			System.out.println("에러 없음");
		}
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new TestValidator());
	}
}