package co.nullception.udongmarket.myPage.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.community.vo.CommunityVO;
import co.nullception.udongmarket.deal.vo.DealVO;
import co.nullception.udongmarket.member.vo.MemberVO;
import co.nullception.udongmarket.myPage.MyPage;
import co.nullception.udongmarket.myPageImpl.MyPageImpl;

public class ShowMyPage implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 단건 조회 - 멤버 ID => 정보 select
		HttpSession session = request.getSession();//세션 get
		String id = (String) session.getAttribute("id");
		String nickname = (String) session.getAttribute("nick");
		MyPage myPageDao = new MyPageImpl();
		MemberVO vo = new MemberVO();
		
		vo.setMemberId(id); //session으로 넘어오는 id값을 전송
		vo = myPageDao.memberSelectOne(vo);
		request.setAttribute("member", vo); //member에 담아서 보냄
		
		//session으로 받아온 닉네임을 게시글 select에 입력
		//세션 - 수정
		session.setAttribute("id", vo.getMemberId());
		session.setAttribute("nick", vo.getNickname());
//		session.setAttribute("phone", vo.getPhone());
//		session.setAttribute("email", vo.getEmail());
//		session.setAttribute("location", vo.getLocation());
//		session.setAttribute("mannerTemp", vo.getMannerTemp());
//		session.setAttribute("author", vo.getAuthor());

		//deal 게시판의 게시글 출력
		List<DealVO> dealList = new ArrayList<DealVO>();
		//dealList = myPageDao.dealSelectList(nickname);
		//카테고리 받아오기 + ajax 사용
		request.setAttribute("dealList", dealList);
		
		//community 게시판의 게시글 출력
		List<CommunityVO> comList = new ArrayList<CommunityVO>();
		//comList = myPageDao.commSelectList(nickname, category);
		request.setAttribute("comList", comList);

		//좋아요 게시글 목록 출력
		List<DealVO> likesList = new ArrayList<DealVO>();
		likesList = myPageDao.likesSelectList(nickname);
		request.setAttribute("likesList", likesList);
		return "mypage/myPage";
	}

}
