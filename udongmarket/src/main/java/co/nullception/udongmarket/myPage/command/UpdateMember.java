package co.nullception.udongmarket.myPage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.member.vo.MemberVO;
import co.nullception.udongmarket.myPage.MyPage;
import co.nullception.udongmarket.myPageImpl.MyPageImpl;

public class UpdateMember implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 유저정보 업데이트
		MyPage myPageDao = new MyPageImpl();
		MemberVO vo = new MemberVO();
		//vo에 값 setting???
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		vo.setMemberId(id);
		vo.setNickname(request.getParameter("nickName"));
		vo.setPhone(request.getParameter("phone"));
		vo.setEmail(request.getParameter("email"));
		vo.setLocation(request.getParameter("location"));
		vo.setEmail(request.getParameter("email"));
		vo.setMannerTemp(Integer.parseInt(request.getParameter("mannerTemp")));
		vo.setAuthor(request.getParameter("author"));
		int r = myPageDao.memberUpdate(vo);
		request.setAttribute("member", vo);
		

		return "mypage/myPage";
	}

}
