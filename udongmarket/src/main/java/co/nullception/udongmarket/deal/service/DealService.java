package co.nullception.udongmarket.deal.service;

import java.util.List;
import co.nullception.udongmarket.deal.vo.DealVO;

public interface DealService {
	
	List<DealVO> dealSelectList(int startRow, int endRow); // 전체 조회
	DealVO dealSelect(DealVO vo); // 단건 조회
	int dealInsert(DealVO vo); // 글등록
	int dealDelete(DealVO vo); // 글삭제
	int dealUpdate(DealVO vo); // 글수정
	List<DealVO> dealSearchList(int startRow, int endRow, String key, String val); // 목록 검색
	int getDealCount();
	int getDealSearchCount(String key, String val);
}
