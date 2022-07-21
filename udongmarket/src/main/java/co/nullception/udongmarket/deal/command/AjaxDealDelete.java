package co.nullception.udongmarket.deal.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.deal.service.DealService;
import co.nullception.udongmarket.deal.serviceimpl.DealServiceImpl;
import co.nullception.udongmarket.deal.vo.DealVO;

public class AjaxDealDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		DealService dealDao = new DealServiceImpl();
		DealVO vo = new DealVO();
		ObjectMapper mapper = new ObjectMapper();

		vo.setBoardId(Integer.parseInt(request.getParameter("BoardId")));
		int cnt = 0;
		cnt = dealDao.dealDelete(vo);

		String jsonList = null;

		try {
			jsonList = mapper.writeValueAsString(cnt);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + jsonList;
	}

}
