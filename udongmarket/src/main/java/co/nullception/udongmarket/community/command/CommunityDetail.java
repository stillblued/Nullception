package co.nullception.udongmarket.community.command;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.comments.service.CommentsService;
import co.nullception.udongmarket.comments.serviceImpl.CommentsServiceImpl;
import co.nullception.udongmarket.comments.vo.CommentsVO;
import co.nullception.udongmarket.community.service.CommunityService;
import co.nullception.udongmarket.community.serviceImpl.CommunityServiceImpl;
import co.nullception.udongmarket.community.vo.CommunityVO;

public class CommunityDetail implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		CommunityService comDao = new CommunityServiceImpl();
		CommunityVO vo = new CommunityVO();
		vo.setBoardId(boardId); 
		vo = comDao.communitySelect(vo);
		request.setAttribute("vo", vo);
		
		CommentsService coDao = new CommentsServiceImpl();
		List <CommentsVO> coList = new ArrayList<CommentsVO>(); 
		coList = coDao.commentList(boardId);
		request.setAttribute("coList", coList);
		
		return "community/communityDetail";
	}

}
