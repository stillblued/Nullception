package co.nullception.udongmarket.myPage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.member.vo.MemberVO;
import co.nullception.udongmarket.myPage.MyPage;
import co.nullception.udongmarket.myPageImpl.MyPageImpl;

public class MyPageUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 마이페이지 수정 폼 호출(세션으로 정보 가져와야함)
		MyPage myPageDao = new MyPageImpl();
		MemberVO vo = new MemberVO();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		vo.setMemberId(id);
		vo = myPageDao.memberSelectOne(vo);
		request.setAttribute("member", vo); //member에 담아서 보냄
		
		return "mypage/myPageUpdate";
	}

}
