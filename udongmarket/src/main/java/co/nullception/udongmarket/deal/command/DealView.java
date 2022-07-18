package co.nullception.udongmarket.deal.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;

public class DealView implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 글 상세보기
		return "deal/dealView";
	}

}
