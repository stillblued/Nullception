package co.nullception.udongmarket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import co.nullception.udongmarket.comm.Command;


public class MainCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 시작할 페이지
		
		return "main/main";
	}

}