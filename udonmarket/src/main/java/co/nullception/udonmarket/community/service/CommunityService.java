package co.nullception.udonmarket.community.service;

import java.util.List;
import co.nullception.udonmarket.community.vo.CommunityVO;

public interface CommunityService {

	List<CommunityVO> communityList(); // 전체조회

	CommunityVO communitySelect(CommunityVO vo); // 하나조회

	int CommunityInsert(CommunityVO vo); // 글입력

	int CommunityUpdate(CommunityVO vo); // 글수정

	int CommunityDelete(CommunityVO vo); // 글삭제

	List<CommunityVO> communitySearchList(String key, String val); // 검색결과

}
