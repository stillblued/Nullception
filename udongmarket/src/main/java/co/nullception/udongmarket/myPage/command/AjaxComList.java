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

public class AjaxComList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 닉네임, 카테고리 별 작성 커뮤니티 게시판 리스트 조회
		HttpSession session = request.getSession();// 세션 get
		MyPage myPageDao = new MyPageImpl();
		List<CommunityVO> list = new ArrayList<CommunityVO>();
		ObjectMapper mapper = new ObjectMapper();

		String nickname = (String) session.getAttribute("nick");
		
		String category = request.getParameter("category");
	
		list = myPageDao.commSelectList(nickname, category);

		String jsonList = null;

		try {
			jsonList = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + jsonList;

	}

}
