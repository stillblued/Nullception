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

public class AjaxCommentCheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 댓글창 state 확인 & 알림 ++ 실행해보고 수정하기
		int count = 0;
		
		HttpSession session = request.getSession();
		String nickname = (String) session.getAttribute("nick");
		//ajax 로 받아들이는 값 : check
		String checkState = request.getParameter("state");
		CommentsVO vo = new CommentsVO();
		MyPage myPageDao = new MyPageImpl();
		ObjectMapper mapper = new ObjectMapper();
		count = myPageDao.checkCommentState(nickname);
		
		String jsonList=null;
		
		if(count>0) {
			try {
				jsonList = mapper.writeValueAsString(count);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		} else {
			try { //count=0(회원이 일치하지 않을 때) 아무것도 출력안함
				jsonList = mapper.writeValueAsString(" ");
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
		
		
		return "ajax:" + jsonList;
	}

}
