package co.nullception.udongmarket.deal.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.deal.service.DealService;
import co.nullception.udongmarket.deal.serviceimpl.DealServiceImpl;
import co.nullception.udongmarket.deal.vo.DealVO;

public class DealDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 글 삭제하기
		DealService dealDao = new DealServiceImpl();
		DealVO vo = new DealVO();
		
		vo.setBoardId(Integer.valueOf(request.getParameter("boardId")));
		int cnt = dealDao.dealDelete(vo);
		
		String returnPage = null;
		if (cnt != 0) {
			returnPage = "dealList.do";
		} else {
			request.setAttribute("message", "게시글 삭제 실패");
			returnPage = "deal/dealError";
		}
		return returnPage;
	}

}
