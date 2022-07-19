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
		HttpSession session = request.getSession(); // 서버가 만들어 놓은 세션 가져옴. 서버정보는 request통해서 가져옴.
		String sessionNickName = (String) session.getAttribute("nick"); //세션 닉네임
		
		// faq 게시글 목록 가져오기
		FaqService faqDao = new FaqServiceImpl();
		List<FaqVO> list = new ArrayList<>();
		FaqVO vo = new FaqVO();
		vo.setNickname(sessionNickName); //세션 닉네임 get
		System.out.println("vo.getNickname(faqsessionnick) : " + vo.getNickname());
		
		list = faqDao.faqSelectList();
		request.setAttribute("list", list);
		return "admin/faq";
	}

}
