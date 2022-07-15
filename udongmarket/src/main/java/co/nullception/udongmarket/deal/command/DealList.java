package co.nullception.udongmarket.deal.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.deal.service.DealService;
import co.nullception.udongmarket.deal.serviceimpl.DealServiceImpl;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.deal.vo.DealVO;

public class DealList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 거래 게시판 목록
		DealService dealDao = new DealServiceImpl();
		List<DealVO> list = new ArrayList<>();
		list = dealDao.dealSelectList();
		request.setAttribute("list", list);
		return "deal/dealList";
	}

}
