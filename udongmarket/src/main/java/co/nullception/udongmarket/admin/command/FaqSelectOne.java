package co.nullception.udongmarket.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.faq.service.FaqService;
import co.nullception.udongmarket.faq.serviceImpl.FaqServiceImpl;
import co.nullception.udongmarket.faq.vo.FaqVO;

public class FaqSelectOne implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시글 상세 조회
		FaqService faqDao = new FaqServiceImpl();
		FaqVO vo = new FaqVO();
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		vo.setBoardId(boardId);

		System.out.println("FaqDetail은 실행됨...");
		System.out.println("boardID" + boardId);
		System.out.println("vo.getBoardId()" + vo.getBoardId());

		vo = faqDao.faqSelectOne(vo);
		request.setAttribute("vo", vo);

		return "admin/faqDetail";
	}

}
