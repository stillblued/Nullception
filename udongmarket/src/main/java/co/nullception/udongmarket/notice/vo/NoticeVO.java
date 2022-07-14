package co.nullception.udongmarket.notice.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class NoticeVO {

	private int boardId;
	private String noticeTitle;
	private String noticeContent;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private Date noticeDate;

}
