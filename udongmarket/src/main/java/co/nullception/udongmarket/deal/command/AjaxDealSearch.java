package co.nullception.udongmarket.deal.command;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.deal.service.DealService;
import co.nullception.udongmarket.deal.serviceimpl.DealServiceImpl;
import co.nullception.udongmarket.deal.vo.DealVO;

public class AjaxDealSearch implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 게시글 검색
		DealService dealDao = new DealServiceImpl();
		List<DealVO> list = new ArrayList<DealVO>();
		ObjectMapper mapper = new ObjectMapper();
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		list = dealDao.dealSearchList(key, val);
		
		String jsonList = null;
		try {
			jsonList = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + jsonList;
	}

}
