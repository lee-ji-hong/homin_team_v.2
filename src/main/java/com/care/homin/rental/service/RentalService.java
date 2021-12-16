package com.care.homin.rental.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.homin.membership.dao.IMemberDAO;
import com.care.homin.rental.dao.RentalDAO;
import com.care.homin.rental.dto.RentalDTO;
import com.care.homin.rental.dto.orderDTO;

@Service
public class RentalService {
	@Autowired RentalDAO dao;
	
	
	public ArrayList<RentalDTO> selectCategory(String category) {
		return dao.selectCategory(category);
	}

	public RentalDTO selectProduct(String prodNo) {
		dao.productUpHit(prodNo);
		return dao.selectProduct(prodNo);
	}
	
	@Autowired IMemberDAO mDao;
	public void info(Model model, String id, String prodNo) {
		model.addAttribute("productInfo",dao.selectProduct(prodNo));
		model.addAttribute("memberInfo",mDao.memberProc(id));
		model.addAttribute("memberPostcode",mDao.selectPost(id));
	}
	
	public String selectProductImg(String productName){
		return dao.selectProductImg(productName);
	}

	public void orderHistory(orderDTO dto) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String order_date = sdf.format(cal.getTime());
		dto.setOrder_date(order_date);
		dao.orderHistoryProc(dto);
	}

	public void selectOrderHistory(String no, Model model) {
		orderDTO dto = dao.selectOrderHistory(no);
		model.addAttribute("orderHistory",dto);
		model.addAttribute("productImg",dao.selectProductImg(dto.getProductName()));
		model.addAttribute("classification", dao.selectClassification(dto.getProductName()));
	}
	public String selectClassification(String productName) {
		return dao.selectClassification(productName);
	}

	public ArrayList<RentalDTO> selectTopViews() {
		return dao.selectTopViews();
	}

	public void upOrderCount(String no) {
		dao.upOrderCount(no);
	}

	public ArrayList<RentalDTO> selectOrderCount() {
		return dao.selectOrderCount();
	}

	public void cancleOrder(String uid) {
		dao.cancleOrder(uid);
	}

	public void deleteProduct(String no) {
		RentalDTO dto = dao.selectProduct(no);
		String fileName = dao.selectProductImg(dto.getProduct_name());
		File deleteFile = new File("C:\\java_folder\\product\\"+fileName);
		deleteFile.delete();
		dao.deleteProduct(no);
		
	}

	public String productInsert(MultipartHttpServletRequest multi) {
		RentalDTO check = dao.selectProduct(multi.getParameter("product_no"));
		if(check == null) {
			RentalDTO product = new RentalDTO();
			MultipartFile file = multi.getFile("product_filename");
			String originFileName = file.getOriginalFilename();
			product.setProduct_no(multi.getParameter("product_no"));
			product.setClassification(multi.getParameter("classification"));
			product.setProduct_name(multi.getParameter("product_name"));
			product.setProduct_filename(originFileName);
			product.setPrice(multi.getParameter("price"));
			product.setHit(0);
			product.setOrderCount(0);
			
			File save = new File("C:\\java_folder\\product\\"+originFileName);
			try {
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			dao.productInsert(product);
			return "t";
		}else {
			return "f";
		}
	}
	
	// 아직 미완
	public void productModify(MultipartHttpServletRequest product) {
		RentalDTO check = dao.selectProduct(product.getParameter("product_no"));
		if(check != null) {
			RentalDTO pr = new RentalDTO();
			MultipartFile file = product.getFile("product_filename");
			String originFileName = file.getOriginalFilename();
			
			pr.setProduct_no(product.getParameter("product_no"));
			// 카테고리 변경시 이미지 경로 수정
			pr.setClassification(product.getParameter("classification"));
			pr.setProduct_name(product.getParameter("product_name"));
			pr.setPrice(product.getParameter("price"));
			dao.productModify(pr);
			if(file.isEmpty() == false) {
				// 파일경로 수정후 기존파일삭제 새로운파일 업로드
				pr.setProduct_filename(originFileName);
			}
		}else {
			
		}
		
	}

	public void categorySales(Model model) {
		// 카테고리별 판매량
		ArrayList<orderDTO> dryer = dao.categorySales("dryer");
		ArrayList<orderDTO> aircleaner = dao.categorySales("aircleaner");
		ArrayList<orderDTO> microwave = dao.categorySales("microwave");
		ArrayList<orderDTO> refrigerator = dao.categorySales("refrigerator");
		ArrayList<orderDTO> washmachine = dao.categorySales("washmachine");
		ArrayList<orderDTO> waterpurifier = dao.categorySales("waterpurifier");
		
		model.addAttribute("dryer",dryer.size());
		model.addAttribute("aircleaner",aircleaner.size());
		model.addAttribute("microwave",microwave.size());
		model.addAttribute("refrigerator",refrigerator.size());
		model.addAttribute("washmachine",washmachine.size());
		model.addAttribute("waterpurifier",waterpurifier.size());
		
		// 카테고리별 매출
		int dryPrice = 0;		int airPrice = 0; 
		int microPrice = 0; 	int refriPrice = 0; 
		int washPrice = 0; 		int waterPrice = 0; 
		
		for(orderDTO d : dryer) {
			dryPrice += Integer.parseInt(d.getAmount());
		}for(orderDTO a : aircleaner) {
			airPrice += Integer.parseInt(a.getAmount());
		}for(orderDTO m : microwave) {
			microPrice += Integer.parseInt(m.getAmount());
		}for(orderDTO r : refrigerator) {
			refriPrice += Integer.parseInt(r.getAmount());
		}for(orderDTO wash : washmachine) {
			washPrice += Integer.parseInt(wash.getAmount());
		}for(orderDTO water : waterpurifier) {
			waterPrice += Integer.parseInt(water.getAmount());
		}
		
		model.addAttribute("dryPrice",dryPrice);
		model.addAttribute("airPrice",airPrice);
		model.addAttribute("microPrice",microPrice);
		model.addAttribute("refriPrice",refriPrice);
		model.addAttribute("washPrice",washPrice);
		model.addAttribute("waterPrice",waterPrice);
	}

	public void salesByYear(Model model) {
		// TODO Auto-generated method stub
		
	}

	public void productPrice(Model model) {
		ArrayList<RentalDTO> dryerPrice = dao.productPrice("dryer");
		ArrayList<RentalDTO> airPrice = dao.productPrice("aircleaner");
		ArrayList<RentalDTO> microPrice = dao.productPrice("microwave");
		ArrayList<RentalDTO> refriPrice = dao.productPrice("refrigerator");
		ArrayList<RentalDTO> washPrice = dao.productPrice("washmachine");
		ArrayList<RentalDTO> waterPrice = dao.productPrice("waterpurifier");
		for(RentalDTO a : airPrice) {
			System.out.println(a.getOrderCount());
		}
		model.addAttribute("dryPr",dryerPrice);
		model.addAttribute("airPr",airPrice);
		model.addAttribute("microPr",microPrice);
		model.addAttribute("refriPr",refriPrice);
		model.addAttribute("washPr",washPrice);
		model.addAttribute("waterPr",waterPrice);
		
	}
}
