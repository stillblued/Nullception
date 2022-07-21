package co.nullception.udongmarket.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.member.service.MemberService;
import co.nullception.udongmarket.member.seviceImpl.MemberServiceImpl;
import co.nullception.udongmarket.member.vo.MemberVO;

public class MemberAuthorChange implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 멤버 권한 변경하기
		MemberService memberDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		//String author = (String) request.getParameter("author");
		//HttpSession session = request.getSession();
	    //String id = (String) session.getAttribute("id");
        //vo.setMemberId(id);
		vo.setMemberId(request.getParameter("memberId"));
//		vo.setNickname(request.getParameter("nickName"));
//		vo.setPhone(request.getParameter("phone"));
//		vo.setEmail(request.getParameter("email"));
//		vo.setLocation(request.getParameter("location"));
//		vo.setEmail(request.getParameter("email"));
//		//vo.setMannerTemp(Integer.parseInt(request.getParameter("mannerTemp")));
//		vo.setAuthor(request.getParameter("author"));
		
		System.out.println("MemberId"+ vo.getMemberId());
		System.out.println("닉네임 : "+vo.getNickname());
		
		vo = memberDao.memberSelectOne(vo);
		request.setAttribute("member", vo); //member에 담아서 보냄
		
		return "member/memberAuthorChange";
	}

}
