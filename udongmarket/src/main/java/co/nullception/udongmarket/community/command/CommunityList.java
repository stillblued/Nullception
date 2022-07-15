package co.nullception.udongmarket.community.command;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.service.CommunityService;
import co.nullception.udongmarket.community.serviceImpl.CommunityServiceImpl;
import co.nullception.udongmarket.community.vo.CommunityVO;

public class CommunityList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		CommunityService communityDao = new CommunityServiceImpl();
		List<CommunityVO> list = new ArrayList<CommunityVO>();
		list = communityDao.communityList();
		request.setAttribute("list", list);
		return "community/communityList";
		
	}

}