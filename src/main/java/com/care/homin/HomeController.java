package com.care.homin;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.homin.rental.dto.RentalDTO;
import com.care.homin.rental.service.RentalService;


@Controller
public class HomeController {
	@Autowired RentalService service;
	
	@RequestMapping(value = "/")
	public String index(Model model) {
		model.addAttribute("formpath", "home");
		return "index";
	}
	
	@RequestMapping(value = "/index")
	public String index(Model model,@RequestParam String formpath, HttpServletRequest request, HttpServletResponse res) {
		model.addAttribute("formpath", formpath);
		return "index";
	}
	
	@RequestMapping(value = "/home")
	public void home(Model model) {
		model.addAttribute("orderCount",service.selectOrderCount());
		model.addAttribute("top",service.selectTopViews()); 
	}
	
	@RequestMapping(value = "/servicecenter")
	public String serviceCenter(Model model,@RequestParam String list) {
		model.addAttribute("list", list);
		return "/servicecenter/servicecenterForm";
	}
	@RequestMapping(value = "/board")
	public String board() {
		return "/board/boardForm";
	}
	@RequestMapping(value = "/write")
	public String write(Model model, String product_img, String category, String order_no) {
		model.addAttribute("category",category);
		model.addAttribute("product_img",product_img);
		model.addAttribute("order_no",order_no);
		return "/board/writeForm";
	}
	@RequestMapping(value = "/view")
	public String view() {
		return "board/viewForm";
	}
	@RequestMapping(value = "/modify")
	public String modify() {
		return "board/boardModifyForm";
	}
	@RequestMapping("/mypage")
	public String mypage(Model model, HttpServletRequest request, String category) {
		model.addAttribute("category", category);
		Cookie[] ck = request.getCookies();
		if(ck != null) {
			ArrayList<RentalDTO> prod = new ArrayList<RentalDTO>();
			for(int i = 0; i < ck.length; i++) {
				if(ck[i].getName().equals("JSESSIONID") == false) {
					if(ck[i] != null) {
						RentalDTO product = service.selectProduct(ck[i].getName());
						prod.add(product);
					}
				}
				if(ck.length>4) {
					break;
				}
			}
			model.addAttribute("prod",prod);
		}
		return "mypage/mypageForm";
	}
	
	@RequestMapping(value = "/rental")
	public String rental(Model model,@RequestParam String category) {
		model.addAttribute("product",service.selectCategory(category));
		model.addAttribute("category", category);
		return "/rental/rentalForm";
	}
	
	@RequestMapping(value = "/product")
	public String product(Model model,@RequestParam String prodNo, String category, HttpServletResponse res) {
		model.addAttribute("product",service.selectProduct(prodNo));
		model.addAttribute("category",category);

		Cookie cookie = new Cookie(prodNo,prodNo);
		cookie.setMaxAge(60*60*24); // 24시간
		res.addCookie(cookie);

		return "/rental/productForm";
	}
}
