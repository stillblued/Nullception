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
import co.nullception.udongmarket.admin.command.AjaxFaqDelete;
import co.nullception.udongmarket.admin.command.AjaxFaqSearch;
import co.nullception.udongmarket.admin.command.FAQCommand;
import co.nullception.udongmarket.admin.command.FaqDetail;
import co.nullception.udongmarket.admin.command.FaqFormCommand;
import co.nullception.udongmarket.admin.command.FaqInsert;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.command.AjaxCommunitySearch;
import co.nullception.udongmarket.community.command.CommunityForm;
import co.nullception.udongmarket.community.command.CommunityInsert;
import co.nullception.udongmarket.community.command.CommunityList;
import co.nullception.udongmarket.deal.command.AjaxDealSearch;
import co.nullception.udongmarket.deal.command.DealForm;
import co.nullception.udongmarket.deal.command.DealInsert;
import co.nullception.udongmarket.deal.command.DealList;
import co.nullception.udongmarket.deal.command.DealView;
import co.nullception.udongmarket.member.command.AjaxMemberIdCheck;
import co.nullception.udongmarket.member.command.AjaxMemberList;
import co.nullception.udongmarket.member.command.AjaxNicknameCheck;
import co.nullception.udongmarket.member.command.MemberJoin;
import co.nullception.udongmarket.member.command.MemberJoinForm;
import co.nullception.udongmarket.member.command.MemberList;
import co.nullception.udongmarket.member.command.MemberLogin;
import co.nullception.udongmarket.member.command.MemberLoginForm;
import co.nullception.udongmarket.member.command.MemberLogout;
import co.nullception.udongmarket.myPage.command.AjaxComList;
import co.nullception.udongmarket.myPage.command.AjaxDealList;
import co.nullception.udongmarket.myPage.command.AjaxDealState;
import co.nullception.udongmarket.myPage.command.UpdateMember;
import co.nullception.udongmarket.myPage.command.DeleteMember;
import co.nullception.udongmarket.myPage.command.MyPageUpdate;
import co.nullception.udongmarket.myPage.command.ShowMyPage;

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
		map.put("/memberLogin.do", new MemberLogin()); // 로그인 처리
		map.put("/memberLogout.do", new MemberLogout()); // 로그아웃 처리
		map.put("/memberJoinForm.do", new MemberJoinForm()); // 회원가입 폼 호출
		map.put("/ajaxMemberIdCheck.do", new AjaxMemberIdCheck()); // 아이디 중복체크
		map.put("/ajaxNicknameCheck.do", new AjaxNicknameCheck()); // 닉네임 중복체크
		map.put("/memberJoin.do", new MemberJoin()); // 회원가입 처리
		
		map.put("/memberList.do", new MemberList()); //관리자페이지 > 멤버리스트 호출
		map.put("ajaxMemberList", new AjaxMemberList()); // 관리자페이지 > 멤버리스트 필터
		map.put("/faq.do", new FAQCommand()); // FAQ List
		map.put("/faqForm.do", new FaqFormCommand()); // FAQ FORM
		map.put("/faqInsert.do" , new FaqInsert()); // FAQ 등록
		map.put("/ajaxFaqSearch.do", new AjaxFaqSearch()); //FAQ 검색
		map.put("/ajaxFaqDelete.do", new AjaxFaqDelete()); //AjaxFaq 삭제
		map.put("/faqDetail", new FaqDetail()); // Faq 제목 클릭시 상세 정보
		
		map.put("/myPage.do", new ShowMyPage());//마이페이지 호출
		map.put("/deleteMember.do", new DeleteMember());//회원탈퇴
		map.put("/myPageUpdate.do", new MyPageUpdate());//마이페이지 수정 폼 호출
		map.put("/updateMember.do", new UpdateMember());//회원수정
		map.put("/ajaxDealList.do", new AjaxDealList());//회원이 카테고리별로 작성한 deal 게시판 글 조회
		map.put("/ajaxComList.do", new AjaxComList());//회원이 카테고리별로 작성한 community 게시판 글 조회
		map.put("/ajaxDealState.do", new AjaxDealState());//거래게시판 state 변경
		
		map.put("/dealInsert.do", new DealInsert()); // 상품 등록
		map.put("/dealList.do", new DealList()); // 거래 게시판 글목록
		map.put("/dealForm.do", new DealForm()); // 상품 등록폼
		map.put("/ajaxDealSearch.do", new AjaxDealSearch()); // 검색
		map.put("/dealView.do", new DealView()); // 글 상세보기
		
		map.put("/communityList.do", new CommunityList());
		map.put("/communityForm.do", new CommunityForm());
		map.put("/communityInsert.do", new CommunityInsert());
		map.put("/ajaxCommunitySearch.do", new AjaxCommunitySearch());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 분석 & 실행, 결과 리턴
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String page = uri.substring(contextPath.length()); // 요청분석

		Command command = map.get(page);
		String viewPage = command.exec(request, response); // 요청수행
		System.out.println("page : " +page+", viewPage : "+viewPage);

		if (!viewPage.endsWith(".do")) {
			if (viewPage.startsWith("ajax:")) { // ajax 처리
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