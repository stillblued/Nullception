package co.nullception.udongmarket.comments.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class CommentsVO {
	
	private int boardId;
	private int commentsId;
	private String commentsContent;
	private String commentsDate;
	private String nickname;

}
