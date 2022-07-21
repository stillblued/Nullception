package co.nullception.udongmarket.myPage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.comments.vo.CommentsVO;
import co.nullception.udongmarket.myPage.MyPage;
import co.nullception.udongmarket.myPageImpl.MyPageImpl;

public class AjaxUpdateComments implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 댓글 상태 업데이트
		int r = 0;
		String message = "";
		HttpSession session = request.getSession();
		String nickname = (String) session.getAttribute("nick");
		//만약에 보드아이디에 수신되는 데이터가 있으면 하나만 업데이트하기
		CommentsVO vo = new CommentsVO();
		MyPage myPageDao = new MyPageImpl();
		ObjectMapper mapper = new ObjectMapper();
		
		String strBoardId = request.getParameter("boardId");//null 비교용 문자열
		if(strBoardId == null) {
			r = myPageDao.updateComments(nickname);
		} else {
			//하나만 업데이트하기
			int boardId = Integer.parseInt(strBoardId); //숫자형 변환
			r = myPageDao.updateOneComments(boardId);
		}
		String jsonList=null;
		
		if(r>0) {
			try {
				jsonList = mapper.writeValueAsString(message);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
		return "ajax:" + jsonList;
	}

}
