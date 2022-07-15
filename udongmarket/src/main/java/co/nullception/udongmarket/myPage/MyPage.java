package co.nullception.udongmarket.myPage;

import co.nullception.udongmarket.member.vo.MemberVO;

public interface MyPage {

	//mypage 기능
	//회원정보 수정, 회원탈퇴, 게시글 목록 조회, 좋아요 리스트
	MemberVO memberSelectOne(MemberVO vo); //내 정보(단건조회)
	int memberUpdate(MemberVO vo); //회원수정
	int memberDelete(String id);
	//좋아요 목록
	
}
