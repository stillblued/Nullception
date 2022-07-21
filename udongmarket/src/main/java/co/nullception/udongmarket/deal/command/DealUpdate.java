package co.nullception.udongmarket.deal.command;

import java.io.IOException;
import java.io.PrintWriter;

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
		HttpSession session = request.getSession();
		
		String nickname = (String) session.getAttribute("nickname");
		vo.setNickname(nickname);
		vo.setDealDate(request.getParameter("dealDate"));
		vo.setDealTitle(request.getParameter("dealTitle"));
		vo.setPrice(Integer.parseInt(request.getParameter("price")));
		vo.setDealContent(request.getParameter("dealContent"));
		int cnt = dealDao.dealUpdate(vo);
		request.setAttribute("vo", vo);
		
		return "deal/dealList";
	}
}

//		DealService dealDao = new DealServiceImpl();
//		DealVO vo = new DealVO();
//		vo.setBoardId(Integer.parseInt(request.getParameter("boardId")));
//		vo = dealDao.dealSelect(vo);
//		
//		request.setAttribute("vo", vo);
//		return "deal/dealList";


//		DealService dealDao = new DealServiceImpl();
//		DealVO vo = new DealVO();
//		
//		vo.setBoardId(Integer.parseInt(request.getParameter("boardId")));
//		vo.setDealCategory(request.getParameter("dealCategory"));
//		vo.setAttachDir(request.getParameter("attachDir"));
//		vo.setDealDate(request.getParameter("dealDate"));
//		vo.setDealTitle(request.getParameter("dealTitle"));
//		vo.setPrice(Integer.parseInt(request.getParameter("price")));
//		vo.setDealContent(request.getParameter("dealContent"));
//		vo.setDealState(request.getParameter("dealState"));
//		int cnt = dealDao.dealUpdate(vo);
//		
//		response.setContentType("text/html; charset=utf-8");
//		
//		try {
//			PrintWriter out = response.getWriter();
//			if(cnt > 0) {
//				out.println("<script> alert('수정 성공');");
//				out.println("location.href='dealList.do'</script>");
//			} else {
//				out.println("<script> alert('수정 실패');");
//				out.println("location.href='dealList.do'</script>");
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return null;

		
