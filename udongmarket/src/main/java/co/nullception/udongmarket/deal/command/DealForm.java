package co.nullception.udongmarket.deal.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;

public class DealForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 거래 상품 등록
		return "deal/dealForm";
	}

}
