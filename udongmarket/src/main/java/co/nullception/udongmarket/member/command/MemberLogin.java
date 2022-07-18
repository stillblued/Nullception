package co.nullception.udongmarket.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.member.service.MemberService;
import co.nullception.udongmarket.member.seviceImpl.MemberServiceImpl;
import co.nullception.udongmarket.member.vo.MemberVO;

public class MemberLogin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 로그인 처리
		HttpSession session = request.getSession(); //서버가 만들어 놓은 세션 가져옴. 서버정보는 request통해서 가져옴.
		MemberService memberDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPassword(request.getParameter("memberPassword"));
		
		vo = memberDao.memberLogin(vo); 
		if(vo.getNickname() != null) {
			session.setAttribute("id", vo.getMemberId());
			session.setAttribute("nick", vo.getNickname());
			session.setAttribute("author", vo.getAuthor());
		    session.setAttribute("phone", vo.getPhone());
		    session.setAttribute("email", vo.getEmail());
		    session.setAttribute("location", vo.getLocation());
		    session.setAttribute("Temp", vo.getMannerTemp());
		    return "main/main";
		     
		} else {
			request.setAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다");
			return "member/memberLoginForm";
		}
		
		
	}

}
