package co.nullception.udongmarket.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.faq.service.FaqService;
import co.nullception.udongmarket.faq.serviceImpl.FaqServiceImpl;
import co.nullception.udongmarket.faq.vo.FaqVO;

public class FAQCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
	
		// faq 게시글 목록 가져오기
		FaqService faqDao = new FaqServiceImpl();
		List<FaqVO> list = new ArrayList<>();
	
	
		list = faqDao.faqSelectList();
		
		request.setAttribute("list", list);	
	
		 
		return "admin/faq";
	}

}
