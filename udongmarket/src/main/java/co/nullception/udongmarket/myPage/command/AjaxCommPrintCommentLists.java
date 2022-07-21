package co.nullception.udongmarket.myPage.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.vo.CommunityVO;
import co.nullception.udongmarket.myPage.MyPage;
import co.nullception.udongmarket.myPageImpl.MyPageImpl;

public class AjaxCommPrintCommentLists implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 커뮤니티게시판 List 가져오기
		
		HttpSession session = request.getSession();//세션 get
		String id = (String) session.getAttribute("id");
		String nickname = (String) session.getAttribute("nick");
		ObjectMapper mapper = new ObjectMapper();
		MyPage myPageDao = new MyPageImpl();
		
		
		List<CommunityVO> commCommentsList = new ArrayList<CommunityVO>();
		commCommentsList = myPageDao.commCommentsList(nickname);
		request.setAttribute("commCommentsList", commCommentsList);
		 
		String jsonList = null;

		try {
			jsonList = mapper.writeValueAsString(commCommentsList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + jsonList;
	}

}
