package co.nullception.udongmarket.comment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class CommentVO {
	
	private int boardId;
	private int commentsId;
	private String commentsContent;
	private String commentsDate;
	private String nickname;

}
