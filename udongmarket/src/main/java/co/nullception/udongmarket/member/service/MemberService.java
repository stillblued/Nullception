package co.nullception.udongmarket.member.service;

import java.util.List;
import co.nullception.udongmarket.member.vo.MemberVO;

public interface MemberService {
	
	List<MemberVO> memberSelectList(); //전체조회
	MemberVO memberSelectOne(MemberVO vo); // 단건 조회
	MemberVO memberLogin(MemberVO vo);// 로그인
	int memberInsert(MemberVO vo); // 회원가입
	boolean isMemberIdCheck(String id); // 아이디 중복체크
	boolean isMemberNickname(String nickname); // 닉네임 중복체크
	
	

}
