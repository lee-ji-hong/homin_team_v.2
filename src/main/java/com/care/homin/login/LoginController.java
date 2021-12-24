package com.care.homin.login;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.login.service.LoginServiceImpl;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.login.config.KakaoConfig;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired private LoginServiceImpl loginSvc;
	
	@RequestMapping("/login")
	public String login(){
		return "login/loginForm";
	}
	
	@ResponseBody
	@RequestMapping("idPwCheck")
	public HashMap<String, String> idPwCheck(LoginDTO loginDto, @RequestBody HashMap<String, String> map) {
//		logger.warn("map : " + map.get("id"));
//		logger.warn("map : " + map.get("pw"));
		
		loginDto.setId(map.get("id"));
		loginDto.setPw(map.get("pw"));
//		logger.warn("loginDto : " + loginDto.getId());
//		logger.warn("loginDto : " + loginDto.getPw());
		
		MemberDTO chk = loginSvc.loginProc(loginDto);
		if (chk == null)
			map.put("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		else
			map.put("msg", "");
		return map;
	}
	
	@RequestMapping("/loginProc")
	public String loginProc(LoginDTO loginDto, HttpSession session, Model model) {
//		logger.warn("id : "+loginDto.getId());
//		logger.warn("pw : "+loginDto.getPw());
		MemberDTO mb = loginSvc.loginProc(loginDto);
		if (mb == null) 
			return "login/loginForm";
		
		session.setAttribute("id", mb.getId());
		session.setAttribute("nickname", mb.getNickname());
		model.addAttribute("formpath", "home");
		return "index";
	}
	
	@Autowired KakaoConfig kakao;
	@RequestMapping("/kakaoLogin")
	public String kakaoLogin(String code, HttpSession session) {
		logger.warn("code : " + code);
		
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		session.setAttribute("nickname", userInfo.get("nickname"));
		session.setAttribute("id", userInfo.get("email"));
		session.setAttribute("access_Token", access_Token);
		
		// 카카오계정 db저장
		loginSvc.insertKakaoId((String)userInfo.get("email"));
		
		return "login/loginForm";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req, Model model) {
		String access_Token = (String) req.getSession().getAttribute("access_Token");
		kakao.logout(access_Token);
		
		req.getSession().invalidate();
		model.addAttribute("formpath", "home");
		return "index";
	}
	
	@RequestMapping("/idsearch")
	public String idsearch() {
		return "login/idsearchForm";
	}
	
	@RequestMapping("/pwsearch")
	public String pwsearch() {
		return "login/pwsearchForm";
	}
	
	@RequestMapping("/changePW")
	public String changePW() {
		return "login/changepwForm";
	}
	
	@RequestMapping("/idsearchResult")
	public String idsearchResult() {
		return "login/idsearchResultForm";
	}
	
	@RequestMapping("/pwChange")
	public String pwChange(LoginDTO dto, Model model) {
		String msg = loginSvc.changePw(dto);
		if(msg.equals("t")) {
			model.addAttribute("msg", "변경완료.");
			return "forward:index?formpath=login";
		}else {
			model.addAttribute("msg", "문제발생.");
			return "forward:index?formpath=login";
		}
	}
	
	@RequestMapping("/memberCheck")
	public String memberCheck(String id, String email, Model model) {
		String check = loginSvc.memberCheck(id, email);
		if(check.equals("t")) {
			model.addAttribute("idcheck", id);
			return "forward:index?formpath=changePW";
		}else {
			model.addAttribute("msg", "회원정보가 없습니다.");
			return "forward:index?formpath=login";
		}
	}
	
	@RequestMapping("/idsearchProc")
	public String idsearchProc(MemberDTO checkMember, Model model) {
		String searchId = loginSvc.checkMember(checkMember);
		if(searchId.equals("f")) {
			model.addAttribute("msg","등록된 정보가 없습니다.");
			return "forward:index?formpath=idsearch";
		}else {
			model.addAttribute("searchId",searchId);
			return "forward:index?formpath=idsearchResult";
		}
	}
	
	
}
