package co.nullception.udongmarket.deal.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.deal.service.DealService;
import co.nullception.udongmarket.deal.serviceimpl.DealServiceImpl;
import co.nullception.udongmarket.deal.vo.DealVO;

public class DealDetail implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 글 상세보기
		DealService dealDao = new DealServiceImpl();
		DealVO vo = new DealVO();
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		vo.setBoardId(boardId);
		
		vo = dealDao.dealSelect(vo);
		request.setAttribute("vo", vo);
		return "deal/dealDetail";
	}

}
