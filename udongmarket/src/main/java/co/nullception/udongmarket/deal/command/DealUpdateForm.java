package co.nullception.udongmarket.deal.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.deal.service.DealService;
import co.nullception.udongmarket.deal.serviceimpl.DealServiceImpl;
import co.nullception.udongmarket.deal.vo.DealVO;

public class DealUpdateForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 글 수정 폼 호출
		DealService dealDao = new DealServiceImpl();
		DealVO vo = new DealVO();
		HttpSession session = request.getSession();
		String nickname = (String) session.getAttribute("nickname");
		vo.setNickname(nickname);
		
		vo = dealDao.dealSelect(vo);
		request.setAttribute("vo", vo);
		
		return "deal/dealUpdate";
	}
}
