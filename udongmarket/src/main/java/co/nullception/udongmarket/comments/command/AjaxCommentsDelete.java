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

public class AjaxCommentsDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		CommentsService commentsDao = new CommentsServiceImpl();		
		ObjectMapper mapper = new ObjectMapper();

		int commentsId = Integer.parseInt(request.getParameter("CommentsId"));
		
		int cnt = 0;
		cnt = commentsDao.commentDelete(commentsId );
		
		String jsonList = null;
		
		if(cnt != 0) {
		
		try {
			jsonList = mapper.writeValueAsString(cnt);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		}
		return "ajax:" + jsonList;
	}

}
