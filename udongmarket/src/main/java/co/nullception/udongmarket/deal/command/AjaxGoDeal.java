package co.nullception.udongmarket.deal.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.deal.service.DealService;
import co.nullception.udongmarket.deal.serviceimpl.DealServiceImpl;
import co.nullception.udongmarket.deal.vo.DealVO;
import co.nullception.udongmarket.likes.LikesService;
import co.nullception.udongmarket.likes.service.LikesServiceImpl;
import co.nullception.udongmarket.likes.vo.LikesVO;

public class AjaxGoDeal implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		DealService dealDao = new DealServiceImpl();
		DealVO vo = new DealVO();
		ObjectMapper mapper = new ObjectMapper();
		HttpSession session = request.getSession();
		
		vo.setNickname((String) session.getAttribute("nick"));
		vo.setBoardId(Integer.parseInt(request.getParameter("BoardId")));
	
		int cnt = 0;
		String jsonList = null;
		vo = dealDao.dealSelect(vo);
		
		if(vo.getDealState().equals("거래가능")) {
		
		try {
			jsonList = mapper.writeValueAsString(vo);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:" + jsonList;
		} else {
			
			cnt = 0;
			try {
				jsonList = mapper.writeValueAsString(cnt);
			} catch (JsonProcessingException e) {
				
				e.printStackTrace();
			}
			return "ajax:" + jsonList;
		}
	
	}

}
