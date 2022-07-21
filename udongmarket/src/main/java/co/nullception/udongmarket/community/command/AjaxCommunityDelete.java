package co.nullception.udongmarket.community.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.service.CommunityService;
import co.nullception.udongmarket.community.serviceImpl.CommunityServiceImpl;
import co.nullception.udongmarket.community.vo.CommunityVO;

public class AjaxCommunityDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		CommunityService comDao = new CommunityServiceImpl();
		CommunityVO vo = new CommunityVO();
		ObjectMapper mapper = new ObjectMapper();
		
		vo.setBoardId(Integer.parseInt(request.getParameter("BoardId")));
		
		int cnt = 0;
		cnt = comDao.communityDelete(vo);
		
		String jsonList = null;

		try {
			jsonList = mapper.writeValueAsString(cnt);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + jsonList;
	}
}
