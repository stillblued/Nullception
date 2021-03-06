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
import co.nullception.udongmarket.admin.command.FaqUpdate;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.comments.command.AjaxCommentsDelete;
import co.nullception.udongmarket.comments.command.AjaxCommentsInsert;
import co.nullception.udongmarket.community.command.AjaxCommunityDelete;
import co.nullception.udongmarket.community.command.CommunityDetail;
import co.nullception.udongmarket.community.command.CommunityForm;
import co.nullception.udongmarket.community.command.CommunityInsert;
import co.nullception.udongmarket.community.command.CommunityList;
import co.nullception.udongmarket.community.command.CommunitySearch;
import co.nullception.udongmarket.community.command.CommunityUpdate;
import co.nullception.udongmarket.community.command.UpdateCommunity;
import co.nullception.udongmarket.deal.command.AjaxDealDelete;
import co.nullception.udongmarket.deal.command.AjaxGoDeal;
import co.nullception.udongmarket.deal.command.AjaxLikeDeal;
import co.nullception.udongmarket.deal.command.DealDetail;
import co.nullception.udongmarket.deal.command.DealForm;
import co.nullception.udongmarket.deal.command.DealInsert;
import co.nullception.udongmarket.deal.command.DealList;
import co.nullception.udongmarket.deal.command.DealSearch;
import co.nullception.udongmarket.deal.command.DealUpdate;
import co.nullception.udongmarket.deal.command.UpdateDeal;
import co.nullception.udongmarket.member.command.AjaxMemberIdCheck;
import co.nullception.udongmarket.member.command.AjaxMemberList;
import co.nullception.udongmarket.member.command.AjaxNicknameCheck;
import co.nullception.udongmarket.member.command.KakaoJoin;
import co.nullception.udongmarket.member.command.MemberJoin;
import co.nullception.udongmarket.member.command.MemberJoinForm;
import co.nullception.udongmarket.member.command.MemberList;
import co.nullception.udongmarket.member.command.MemberLogin;
import co.nullception.udongmarket.member.command.MemberLoginForm;
import co.nullception.udongmarket.member.command.MemberLogout;
import co.nullception.udongmarket.member.command.MemberAuthorChange;
import co.nullception.udongmarket.member.command.MemberAuthorUpdate;
import co.nullception.udongmarket.myPage.command.AjaxComList;
import co.nullception.udongmarket.myPage.command.AjaxCommPrintCommentLists;
import co.nullception.udongmarket.myPage.command.AjaxCommentCheck;
import co.nullception.udongmarket.myPage.command.AjaxDealList;
import co.nullception.udongmarket.myPage.command.AjaxDealState;
import co.nullception.udongmarket.myPage.command.AjaxUpdateComments;
import co.nullception.udongmarket.myPage.command.DeleteMember;
import co.nullception.udongmarket.myPage.command.MyPageUpdate;
import co.nullception.udongmarket.myPage.command.PrintCommentLists;
import co.nullception.udongmarket.myPage.command.AjaxDealPrintCommentsList;
import co.nullception.udongmarket.myPage.command.ShowMyPage;
import co.nullception.udongmarket.myPage.command.UpdateMember;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<>();

	public FrontController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		map.put("/main.do", new MainCommand());
		
		map.put("/memberLoginForm.do", new MemberLoginForm()); // ????????? ??? ??????
		map.put("/memberLogin.do", new MemberLogin()); // ????????? ??????
		map.put("/memberLogout.do", new MemberLogout()); // ???????????? ??????
		map.put("/memberJoinForm.do", new MemberJoinForm()); // ???????????? ??? ??????
		map.put("/ajaxMemberIdCheck.do", new AjaxMemberIdCheck()); // ????????? ????????????
		map.put("/ajaxNicknameCheck.do", new AjaxNicknameCheck()); // ????????? ????????????
		map.put("/memberJoin.do", new MemberJoin()); // ???????????? ??????
		map.put("/kakaoJoin.do", new KakaoJoin()); // ???????????? ???????????? ??????
		map.put("/memberList.do", new MemberList()); //?????????????????? > ??????????????? ??????
		map.put("/ajaxMemberList.do", new AjaxMemberList()); // ?????????????????? > ??????????????? ??????
		map.put("/memberauthorChange.do", new MemberAuthorChange()); // ?????? ?????? ?????????
		map.put("/memberAuthorUpdate.do", new MemberAuthorUpdate()); // ?????? ?????? ??????????????? ????????? 
    
		map.put("/faq.do", new FAQCommand()); // FAQ List
		map.put("/faqForm.do", new FaqFormCommand()); // FAQ FORM
		map.put("/faqInsert.do" , new FaqInsert()); // FAQ ??????
		map.put("/ajaxFaqSearch.do", new AjaxFaqSearch()); //FAQ ??????
		map.put("/ajaxFaqDelete.do", new AjaxFaqDelete()); //AjaxFaq ??????
		map.put("/faqDetail.do", new FaqDetail()); // Faq ?????? ??????
		map.put("/faqUpdate.do", new FaqUpdate()); //Faq ??????
		
		map.put("/myPage.do", new ShowMyPage());//??????????????? ??????
		map.put("/deleteMember.do", new DeleteMember());//????????????
		map.put("/myPageUpdate.do", new MyPageUpdate());//??????????????? ?????? ??? ??????
		map.put("/updateMember.do", new UpdateMember());//????????????
		map.put("/ajaxDealList.do", new AjaxDealList());//????????? ?????????????????? ????????? deal ????????? ??? ??????
		map.put("/ajaxComList.do", new AjaxComList());//????????? ?????????????????? ????????? community ????????? ??? ??????
		map.put("/ajaxDealState.do", new AjaxDealState());//??????????????? state ??????
		map.put("/ajaxcommentCheck.do", new AjaxCommentCheck()); //?????? state ??????
		map.put("/printCommentLists.do", new PrintCommentLists());
		map.put("/ajaxDealPrintCommentLists.do", new AjaxDealPrintCommentsList());//????????? ?????? ??????????????? ????????? ??????
		map.put("/ajaxCommPrintCommentLists.do", new AjaxCommPrintCommentLists());//????????? ?????? ????????????????????? ????????? ??????
		map.put("/ajaxUpdateComments.do", new AjaxUpdateComments()); //????????? ?????? ??????
		
		map.put("/dealList.do", new DealList()); 
		map.put("/dealForm.do", new DealForm()); 
		map.put("/dealInsert.do", new DealInsert()); 
		map.put("/dealSearch.do", new DealSearch()); 
		map.put("/ajaxDealDelete.do", new AjaxDealDelete()); 
		map.put("/dealDetail.do", new DealDetail()); 
		map.put("/dealUpdate.do", new DealUpdate()); 
		map.put("/updateDeal.do", new UpdateDeal()); 
		
		map.put("/ajaxLikeDeal.do", new AjaxLikeDeal());//??????????????? 
		
		map.put("/communityList.do", new CommunityList()); //?????? ??????+?????????
		map.put("/communityForm.do", new CommunityForm()); //?????? ???
		map.put("/communityInsert.do", new CommunityInsert()); //?????? ??????
		map.put("/communitySearch.do", new CommunitySearch()); //?????? ??????
		map.put("/ajaxCommunityDelete.do", new AjaxCommunityDelete()); //?????? ??????
		map.put("/communityDetail.do", new CommunityDetail()); //?????? ??????
		map.put("/communityUpdate.do", new CommunityUpdate()); //?????? ?????????
		map.put("/updateCommunity.do", new UpdateCommunity()); //?????? ????????????
		
		map.put("/ajaxCommentsDelete.do", new AjaxCommentsDelete()); //???????????????
		map.put("/ajaxCommentsInsert.do", new AjaxCommentsInsert()); // ajax??? ?????? ?????? ??????
		map.put("/ajaxGoDeal.do", new AjaxGoDeal());//????????????
		
		
		
		
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ?????? ?????? & ??????, ?????? ??????
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String page = uri.substring(contextPath.length()); // ????????????

		Command command = map.get(page);
		String viewPage = command.exec(request, response); // ????????????
		
		System.out.println("page : " +page+", viewPage : "+viewPage);

		if (!viewPage.endsWith(".do")) {
			if (viewPage.startsWith("ajax:")) { // ajax ??????
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