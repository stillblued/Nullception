package co.nullception.udongmarket.community.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.service.CommunityService;
import co.nullception.udongmarket.community.serviceImpl.CommunityServiceImpl;
import co.nullception.udongmarket.community.vo.CommunityVO;

public class CommunityUpdate implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		CommunityService comDao = new CommunityServiceImpl();
		CommunityVO vo = new CommunityVO();
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList=null;
		
		vo.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		vo = comDao.communitySelect(vo);
		
		try {
			jsonList = mapper.writeValueAsString(vo);
		} catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + jsonList;

	}

}
