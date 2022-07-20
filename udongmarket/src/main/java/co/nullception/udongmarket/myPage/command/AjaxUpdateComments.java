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
		
		HttpSession session = request.getSession();
		String nickname = (String) session.getAttribute("nick");
		
		CommentsVO vo = new CommentsVO();
		MyPage myPageDao = new MyPageImpl();
		ObjectMapper mapper = new ObjectMapper();
		
		r = myPageDao.updateComments(nickname);
		String message = "댓글 확인 완료";
		String jsonList=null;
		
		if(r>0) {
			try {
				jsonList = mapper.writeValueAsString(message);
				System.out.println("통신 잘됨");
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
		return "ajax:" + jsonList;
	}

}
