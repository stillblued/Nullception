package co.nullception.udongmarket.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;

public class MemberListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "admin/memberList";
	}

}
