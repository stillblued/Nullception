package co.nullception.udongmarket.deal.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.comments.service.CommentsService;
import co.nullception.udongmarket.comments.serviceImpl.CommentsServiceImpl;
import co.nullception.udongmarket.comments.vo.CommentsVO;
import co.nullception.udongmarket.deal.service.DealService;
import co.nullception.udongmarket.deal.serviceimpl.DealServiceImpl;
import co.nullception.udongmarket.deal.vo.DealVO;

public class DealDetail implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		DealService dealDao = new DealServiceImpl();
		DealVO vo = new DealVO();
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		vo.setBoardId(boardId);
	
		vo = dealDao.dealSelect(vo);
	
		request.setAttribute("vo", vo);
		
		CommentsService coDao = new CommentsServiceImpl();
		List <CommentsVO> coList = new ArrayList<CommentsVO>(); 
		coList = coDao.commentList(boardId);
		request.setAttribute("coList", coList);
	
		
		return "deal/dealDetail";
	}

}
