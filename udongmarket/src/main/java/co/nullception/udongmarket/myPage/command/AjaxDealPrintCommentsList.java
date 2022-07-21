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
import co.nullception.udongmarket.deal.vo.DealVO;
import co.nullception.udongmarket.myPage.MyPage;
import co.nullception.udongmarket.myPageImpl.MyPageImpl;

public class AjaxDealPrintCommentsList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//거래게시판 리스트 가져오기 = ajax로 교체 
		HttpSession session = request.getSession();//세션 get
		String id = (String) session.getAttribute("id");
		String nickname = (String) session.getAttribute("nick");
		ObjectMapper mapper = new ObjectMapper();
		MyPage myPageDao = new MyPageImpl();
		
		List<DealVO> dealCommentsList = new ArrayList<DealVO>();
		dealCommentsList = myPageDao.dealCommentsList(nickname);
		request.setAttribute("dealCommentsList", dealCommentsList);

		String jsonList = null;

		try {
			jsonList = mapper.writeValueAsString(dealCommentsList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + jsonList;
		
	}

}
