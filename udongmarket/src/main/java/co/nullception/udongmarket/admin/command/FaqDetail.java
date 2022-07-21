package co.nullception.udongmarket.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.comments.service.CommentsService;
import co.nullception.udongmarket.comments.serviceImpl.CommentsServiceImpl;
import co.nullception.udongmarket.comments.vo.CommentsVO;
import co.nullception.udongmarket.faq.service.FaqService;
import co.nullception.udongmarket.faq.serviceImpl.FaqServiceImpl;
import co.nullception.udongmarket.faq.vo.FaqVO;
import co.nullception.udongmarket.member.vo.MemberVO;

public class FaqDetail implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시글 상세 조회
				FaqService faqDao = new FaqServiceImpl();
				CommentsService coDao = new CommentsServiceImpl();
				List <CommentsVO> coList = new ArrayList<CommentsVO>(); 	
				FaqVO vo = new FaqVO();
				
				int boardId = Integer.parseInt(request.getParameter("boardId"));

				vo.setBoardId(boardId); 
        
				coList = coDao.commentList(boardId);
				vo = faqDao.faqSelectOne(vo);
				
				request.setAttribute("coList", coList);
				request.setAttribute("vo", vo);

				
				return "admin/faqDetail";
	}

}
