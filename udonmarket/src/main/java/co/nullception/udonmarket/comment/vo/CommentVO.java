package co.nullception.udonmarket.comment.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class CommentVO {
	
	private int boardId;
	private int commentsNo;
	private String commentsContent;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private Date commentsDate;
	private String memberNickname;

}
