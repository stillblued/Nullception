package co.nullception.udongmarket.deal.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.deal.service.DealService;
import co.nullception.udongmarket.deal.serviceimpl.DealServiceImpl;
import co.nullception.udongmarket.deal.vo.DealVO;

public class DealUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 글 수정하기
		DealService dealDao = new DealServiceImpl();
		DealVO vo = new DealVO();
		
		vo.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		vo = dealDao.dealSelect(vo);
		
		request.setAttribute("vo", vo);
		
		String returnPage = null;
		if (vo != null) { 
			returnPage = "deal/dealUpdate";
		} else {
			request.setAttribute("message", "게시글 수정 불가");
			returnPage = "deal/dealError";
		}

		return returnPage;
		
	}
}

