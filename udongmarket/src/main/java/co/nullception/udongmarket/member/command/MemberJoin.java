package co.nullception.udongmarket.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.member.service.MemberService;
import co.nullception.udongmarket.member.seviceImpl.MemberServiceImpl;
import co.nullception.udongmarket.member.vo.MemberVO;

public class MemberJoin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원가입 처리
		MemberService memberDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPassword(request.getParameter("memberPassword"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setPhone(request.getParameter("phone"));
		vo.setLocation(request.getParameter("location"));
		vo.setEmail(request.getParameter("email"));
		vo.setAuthor("USER");
		vo.setMannerTemp(0);
		int n = memberDao.memberInsert(vo);
		if(n != 0) {
			request.setAttribute("message", "회원가입이 성공적으로 처리되었습니다.");
			return "member/memberLoginForm";
		} else {
			request.setAttribute("message", "회원가입이 정상적으로 처리되지 않았습니다.");
			return "member/memberJoinForm";
		}
		
	}

}
