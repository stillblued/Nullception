package co.nullception.udongmarket.member.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.member.service.MemberService;
import co.nullception.udongmarket.member.seviceImpl.MemberServiceImpl;
import co.nullception.udongmarket.member.vo.MemberVO;

public class MemberAuthorUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 유저 권한 업데이트
		MemberService memberDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		//List<MemberVO> list = new ArrayList<>();
		
		System.out.println("일단 업데이트 서블릿으로는 넘어옴");
		
		String author = request.getParameter("author");
		String nickname = request.getParameter("nickname");
		String blind = request.getParameter("BLIND");
		vo.setAuthor(author);
		vo.setNickname(nickname);
		
		
		System.out.println(blind);
		System.out.println(vo.getAuthor());
		System.out.println(vo.getNickname());
		vo.setMemberId(request.getParameter("memberId"));
		vo.setPhone(request.getParameter("phone"));
		vo.setEmail(request.getParameter("email"));
		vo.setLocation(request.getParameter("location"));
		vo.setEmail(request.getParameter("email"));
		vo.setMannerTemp(Integer.parseInt(request.getParameter("mannerTemp")));
		
		int rs = memberDao.memberAuthorUpdate(vo);
		//list = memberDao.memberSelectList();
		
		
		request.setAttribute("member", rs);
		//request.setAttribute("list", list);
		
		return "member/memberList";
	}

}
