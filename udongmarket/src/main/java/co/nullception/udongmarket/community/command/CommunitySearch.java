package co.nullception.udongmarket.community.command;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.service.CommunityService;
import co.nullception.udongmarket.community.serviceImpl.CommunityServiceImpl;
import co.nullception.udongmarket.community.vo.CommunityVO;

public class CommunitySearch implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		CommunityService communityDao = new CommunityServiceImpl();
		List<CommunityVO> list = new ArrayList<CommunityVO>();
		
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		int cnt = communityDao.getSearchCount(key, val);

		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		list = communityDao.communitySearchList(startRow, endRow, key, val);
		
		int pageCount = 0;
		int pageBlock = 0;
		int startPage = 0;
		int endPage = 0;

		if (cnt != 0) {
			pageCount = cnt / pageSize + (cnt % pageSize == 0 ? 0 : 1);
			pageBlock = 10;
			startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;

			endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
		}

		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("key", key);
		request.setAttribute("val", val);

		HttpSession session = request.getSession();
		String nickname = (String) session.getAttribute("nick");
		String location = (String) session.getAttribute("location");
		
		request.setAttribute("nickname", nickname);
		request.setAttribute("location", location);
		request.setAttribute("list", list);
		
		return "community/communitySearch";

	}

}