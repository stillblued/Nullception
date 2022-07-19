package co.nullception.udongmarket.member.command;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.member.service.MemberService;
import co.nullception.udongmarket.member.seviceImpl.MemberServiceImpl;
import co.nullception.udongmarket.member.vo.MemberVO;

public class AjaxMemberList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// MemberList 권한에 따른 멤버 목록 조회

		MemberService memberDao = new MemberServiceImpl();
		List<MemberVO> list = new ArrayList<>();
		ObjectMapper mapper = new ObjectMapper();
		
		String category = request.getParameter("category");
		list = memberDao.memberAuthorSelectList(category);

		String jsonList = null;

		try {
			jsonList = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + jsonList;

	}

}
