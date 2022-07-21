package co.nullception.udongmarket.community.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.service.CommunityService;
import co.nullception.udongmarket.community.serviceImpl.CommunityServiceImpl;
import co.nullception.udongmarket.community.vo.CommunityVO;

public class CommunityUpdate implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		CommunityService comDao = new CommunityServiceImpl();
		CommunityVO vo = new CommunityVO();
	
		vo.setBoardId(Integer.parseInt(request.getParameter("boardId")));
	
		vo = comDao.communitySelect(vo);
				
		request.setAttribute("vo", vo);

		String returnPage = null;
		if (vo != null) { 
			returnPage = "community/communityUpdate";
		} else {
			request.setAttribute("message", "게시글 수정 불가");
			returnPage = "community/communityError";
		}

		return returnPage;
	}

}
