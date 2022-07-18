package co.nullception.udongmarket.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.member.service.MemberService;
import co.nullception.udongmarket.member.seviceImpl.MemberServiceImpl;

public class AjaxMemberIdCheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// ajax를 이용한 아이디 중복체크
		MemberService memberDao = new MemberServiceImpl();
		String id = request.getParameter("id");
		boolean d = memberDao.isMemberIdCheck(id); // true 사용가능.
		String result = "Usable";
		if(!d) {
			result = "Un Usable";
		}
		return "ajax:" + result; // 결과가 ajax 호출이라는걸 ViewResolver에게 알려주기 위함.
	}

}
