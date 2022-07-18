package co.nullception.udongmarket.member.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.member.service.MemberService;
import co.nullception.udongmarket.member.seviceImpl.MemberServiceImpl;
import co.nullception.udongmarket.member.vo.MemberVO;

public class MemberList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberService memberDao = new MemberServiceImpl();
		List<MemberVO> list = new ArrayList<>();
		list = memberDao.memberSelectList();
		request.setAttribute("list", list);
		
		return "member/memberList";
	}

}
