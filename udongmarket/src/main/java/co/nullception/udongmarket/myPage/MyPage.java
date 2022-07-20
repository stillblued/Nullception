package co.nullception.udongmarket.myPage;

import java.util.List;
import co.nullception.udongmarket.community.vo.CommunityVO;
import co.nullception.udongmarket.deal.vo.DealVO;
import co.nullception.udongmarket.member.vo.MemberVO;

public interface MyPage {

	//mypage 기능
	//회원정보 수정, 회원탈퇴, 게시글 목록 조회, 좋아요 리스트
	MemberVO memberSelectOne(MemberVO vo); //내 정보(단건조회)
	int memberUpdate(MemberVO vo); //회원수정
	int memberDelete(String id);
	List<DealVO> dealSelectList(String nickname, String category); //deal 게시판에 쓴 글 조회
	List<CommunityVO> commSelectList(String nickname, String category);//community 게시판에 쓴 글 조회
	List<DealVO> likesSelectList(String nickname);//좋아요 목록
	int updateDealState(String dealState, int boardId);//거래 상태 업데이트
	int checkCommentState(String writeId); //댓글 상태 확인(작성자닉네임 값 받아오기)
}
