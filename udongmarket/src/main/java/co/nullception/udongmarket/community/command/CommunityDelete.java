package co.nullception.udongmarket.community.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.service.CommunityService;
import co.nullception.udongmarket.community.serviceImpl.CommunityServiceImpl;
import co.nullception.udongmarket.community.vo.CommunityVO;

public class CommunityDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		CommunityService comDao = new CommunityServiceImpl();
		CommunityVO vo = new CommunityVO();
		vo.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		HttpSession session = request.getSession();
		
		vo= comDao.communitySelect(vo);
		String nick = (String)session.getAttribute("nick");
		int cnt = 0;
		
		if (nick.equals(vo.getNickname())) {
			 cnt = comDao.communityDelete(vo);
		}
		
		String returnPage = null;
		
		if (cnt != 0) { 
			returnPage = "communityList.do";
		} else {
			request.setAttribute("message", "게시글 삭제 실패");
			returnPage = "community/communityError";
		}

		return returnPage;
	}
}
