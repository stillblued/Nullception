package co.nullception.udongmarket.faq.service;

import java.util.List;
import co.nullception.udongmarket.faq.vo.FaqVO;

public interface FaqService {
	
	List<FaqVO> faqSelectList(); // 전체 조회
	FaqVO faqSelect(FaqVO vo); // 단건 조회
	int faqInsert(FaqVO vo); // 글 입력
	int faqUpdate(FaqVO vo); // 글 수정
	int faqDelete(FaqVO vo); // 글 수정
	List<FaqVO> faqSearch(String key, String val); // 전체 검색
}
