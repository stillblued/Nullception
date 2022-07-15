package co.nullception.udongmarket.myPage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.myPage.MyPage;
import co.nullception.udongmarket.myPageImpl.MyPageImpl;

public class deleteMember implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원탈퇴
		MyPage mypageDao = new MyPageImpl();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		int n = mypageDao.memberDelete(id);
		session.invalidate(); //세션 삭제
		
		return "main/main";
	}

}
