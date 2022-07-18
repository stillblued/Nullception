package co.nullception.udongmarket.web;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import co.nullception.udongmarket.MainCommand;
import co.nullception.udongmarket.admin.command.AjaxFaqSearch;
import co.nullception.udongmarket.admin.command.FAQCommand;
import co.nullception.udongmarket.admin.command.FaqDelete;
import co.nullception.udongmarket.admin.command.FaqFormCommand;
import co.nullception.udongmarket.admin.command.FaqInsert;
import co.nullception.udongmarket.admin.command.MemberListCommand;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.command.AjaxCommunitySearch;
import co.nullception.udongmarket.community.command.CommunityForm;
import co.nullception.udongmarket.community.command.CommunityInsert;
import co.nullception.udongmarket.community.command.CommunityList;
import co.nullception.udongmarket.deal.command.AjaxDealSearch;
import co.nullception.udongmarket.deal.command.DealForm;
import co.nullception.udongmarket.deal.command.DealInsert;
import co.nullception.udongmarket.deal.command.DealList;
import co.nullception.udongmarket.member.command.MemberJoinForm;
import co.nullception.udongmarket.member.command.MemberLogin;
import co.nullception.udongmarket.member.command.MemberLoginForm;
import co.nullception.udongmarket.member.command.MemberLogout;
import co.nullception.udongmarket.myPage.command.deleteMember;
import co.nullception.udongmarket.myPage.command.showMypage;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<>();

	public FrontController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		// 요청과 수행할 커맨드 연결
		map.put("/main.do", new MainCommand());
		
		map.put("/memberLoginForm.do", new MemberLoginForm()); // 로그인 폼 호출
		map.put("/memberLogin.do", new MemberLogin()); // 로그인
		map.put("/memberLogout.do", new MemberLogout()); // 로그아웃
		map.put("/memberJoinForm.do", new MemberJoinForm()); // 회원가입 폼 호출
		
		map.put("/memberList.do", new MemberListCommand()); //관리자페이지 > 멤버리스트 호출
		map.put("/faq.do", new FAQCommand()); // FAQ List
		map.put("/faqForm.do", new FaqFormCommand()); // FAQ FORM
		map.put("/faqInsert.do" , new FaqInsert()); // FAQ 등록
		map.put("/ajaxFaqSearch.do", new AjaxFaqSearch()); //FAQ 검색
		map.put("/faqDelete.do", new FaqDelete()); // FAQ 삭제
		
		map.put("/mypage.do", new showMypage());
		map.put("/deletemember.do", new deleteMember());
		
		map.put("/dealInsert.do", new DealInsert()); // 상품 등록
		map.put("/dealList.do", new DealList()); // 거래 게시판 글목록
		map.put("/dealForm.do", new DealForm()); // 상품 등록폼
		map.put("/ajaxDealSearch.do", new AjaxDealSearch()); // 검색
		
		map.put("/communityList.do", new CommunityList());
		map.put("/communityForm.do", new CommunityForm());
		map.put("/communityInsert.do", new CommunityInsert());
		map.put("/ajaxCommunitySearch.do", new AjaxCommunitySearch());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 분석 실행 결과 리턴
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String page = uri.substring(contextPath.length());

		Command command = map.get(page);
		String viewPage = command.exec(request, response);
		System.out.println("page : " +page+", viewPage : "+viewPage);

		if (!viewPage.endsWith(".do")) {
			if (viewPage.startsWith("ajax:")) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(viewPage.substring(5));
				return;
			}
			viewPage = viewPage + ".tiles";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect(viewPage);
		}
	}

}