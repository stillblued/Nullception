package co.nullception.udongmarket.myPage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.member.vo.MemberVO;
import co.nullception.udongmarket.myPage.MyPage;
import co.nullception.udongmarket.myPageImpl.MyPageImpl;

public class showMypage implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 단건 조회 - 멤버 ID => 정보 select
		HttpSession session = request.getSession();//세선 get
		
		MyPage mypageDao = new MyPageImpl();
		MemberVO vo = new MemberVO();
		vo.setMemberId("knh");
		vo = mypageDao.memberSelectOne(vo);
		request.setAttribute("member", vo); //member에 담아서 보냄
		
		session.setAttribute("id", vo.getMemberId());
		session.setAttribute("nickname", vo.getNickname());
		session.setAttribute("phone", vo.getPhone());
		session.setAttribute("email", vo.getEmail());
		session.setAttribute("location", vo.getLocation());
		session.setAttribute("mannerTemp", vo.getMannerTemp());
		session.setAttribute("author", vo.getAuthor());
		
		return "mypage/myPage";
	}

}
