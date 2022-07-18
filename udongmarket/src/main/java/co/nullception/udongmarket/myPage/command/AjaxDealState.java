package co.nullception.udongmarket.myPage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.deal.vo.DealVO;
import co.nullception.udongmarket.myPage.MyPage;
import co.nullception.udongmarket.myPageImpl.MyPageImpl;

public class AjaxDealState implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 거래 상태 변경
		HttpSession session = request.getSession();// 세션 get
		MyPage myPageDao = new MyPageImpl();
		DealVO vo = new DealVO();
		int r = 0;
		ObjectMapper mapper = new ObjectMapper();

		String selectedState = request.getParameter("selectedState");
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		System.out.println(boardId);
		System.out.println(selectedState);
		
		r = myPageDao.updateDealState(selectedState, boardId);
		
		String jsonList=null;
		
		if(r>0) {
			System.out.println("수정 완료");
		} else {
			System.out.println("수정 실패");
		}

		return "ajax:" + jsonList;
	}

}
