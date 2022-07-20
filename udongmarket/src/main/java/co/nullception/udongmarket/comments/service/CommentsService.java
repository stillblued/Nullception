package co.nullception.udongmarket.comments.service;

import java.util.List;

import co.nullception.udongmarket.comments.vo.CommentsVO;

public interface CommentsService {
	
	// 전체조회
	List<CommentsVO> commentList(int boardId);
	
	//등록
	int commentInsert(CommentsVO vo);
	
	//삭제
	int commentDelte(int commentsId);
	
	//수정
	int CommentUpdate(CommentsVO vo);

}
