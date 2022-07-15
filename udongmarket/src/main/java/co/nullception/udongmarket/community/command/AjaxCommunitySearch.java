package co.nullception.udongmarket.community.command;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.service.CommunityService;
import co.nullception.udongmarket.community.serviceImpl.CommunityServiceImpl;
import co.nullception.udongmarket.community.vo.CommunityVO;

public class AjaxCommunitySearch implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		CommunityService communityDao = new CommunityServiceImpl();
		List<CommunityVO> list = new ArrayList<CommunityVO>();
		ObjectMapper mapper = new ObjectMapper();

		String key = request.getParameter("key");
		String val = request.getParameter("val");

		list = communityDao.communitySearchList(key, val);
		String jsonList = null;

		try {
			jsonList = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return "ajax:" + jsonList;
	}

}