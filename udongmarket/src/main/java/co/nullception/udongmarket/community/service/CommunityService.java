package co.nullception.udongmarket.community.service;

import java.util.List;
import co.nullception.udongmarket.community.vo.CommunityVO;

public interface CommunityService {

	
		List<CommunityVO> communityList(int startRow, int endRow); //조회(페이징)
		CommunityVO communitySelect(CommunityVO vo); //단일조회
		int communityInsert(CommunityVO vo); //글입력
		int communityUpdate(CommunityVO vo); //글수정
		int communityDelete(CommunityVO vo); //글삭제
		List<CommunityVO> communitySearchList(int startRow, int endRow, String key, String val); //검색(페이징)
		int getBoardCount(); //조회글숫자(페이징)
		int getSearchCount(String key, String val);//검색글숫자(페이징)
		
	
}
