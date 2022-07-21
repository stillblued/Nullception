package co.nullception.udongmarket.likes;

import java.util.List;
import co.nullception.udongmarket.likes.vo.LikesVO;

public interface LikesService {
	
	List<LikesVO> likesList(); // 전체 조회
	int likesInsert(LikesVO vo); // 입력
	int likesDelete(int boardId); // 삭제
	
}