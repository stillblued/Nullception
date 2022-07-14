package co.nullception.udongmarket.community.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import co.nullception.udongmarket.comm.Command;

public class CommunityForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "community/communityForm";
	}

}