package co.nullception.udongmarket.community.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.service.CommunityService;
import co.nullception.udongmarket.community.serviceImpl.CommunityServiceImpl;
import co.nullception.udongmarket.community.vo.CommunityVO;

public class CommunityDetail implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		CommunityService comDao = new CommunityServiceImpl();
		CommunityVO vo = new CommunityVO();
		
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		vo.setBoardId(boardId); 
		
		vo = comDao.communitySelect(vo);
		request.setAttribute("vo", vo);
		
		return "community/communityDetail";
	}

}
