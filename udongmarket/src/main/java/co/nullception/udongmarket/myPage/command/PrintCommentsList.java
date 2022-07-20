package co.nullception.udongmarket.myPage.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.vo.CommunityVO;
import co.nullception.udongmarket.deal.vo.DealVO;
import co.nullception.udongmarket.myPage.MyPage;
import co.nullception.udongmarket.myPageImpl.MyPageImpl;

public class PrintCommentsList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//1. 거래게시판 리스트 가져오기 
		HttpSession session = request.getSession();//세션 get
		String id = (String) session.getAttribute("id");
		String nickname = (String) session.getAttribute("nick");
		MyPage myPageDao = new MyPageImpl();
		
		List<DealVO> dealCommentsList = new ArrayList<DealVO>();
		dealCommentsList = myPageDao.dealCommentsList(nickname);
		request.setAttribute("dealCommentsList", dealCommentsList);
		
		List<CommunityVO> commCommentsList = new ArrayList<CommunityVO>();
		commCommentsList = myPageDao.commCommentsList(nickname);
		request.setAttribute("commCommentsList", commCommentsList);
		
		return "mypage/myPageCommentsList";
	}

}
