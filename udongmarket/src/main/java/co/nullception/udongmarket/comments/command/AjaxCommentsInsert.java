package co.nullception.udongmarket.comments.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.comments.service.CommentsService;
import co.nullception.udongmarket.comments.serviceImpl.CommentsServiceImpl;
import co.nullception.udongmarket.comments.vo.CommentsVO;

public class AjaxCommentsInsert implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// Ajax를 통한 댓글 등록
		HttpSession session = request.getSession(); // 세션 get
		CommentsService commentsDao = new CommentsServiceImpl();
		CommentsVO vo = new CommentsVO();
		ObjectMapper mapper = new ObjectMapper();

		vo.setBoardId(Integer.valueOf(request.getParameter("BoardId")));
		vo.setCommentsContent(request.getParameter("Content"));
		String NickName = (String) session.getAttribute("nick");
		vo.setCommentsNick(NickName);
		vo.setBoardNick(request.getParameter("BoardNick"));
		
		int cnt = 0;
		
		cnt = commentsDao.commentInsert(vo);
		
		
		String jsonList = null;

		if(cnt != 0) {
		
		try {
			jsonList = mapper.writeValueAsString(vo);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		}
		
		return "ajax:" + jsonList;
	}

}
