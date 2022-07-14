package co.nullception.udonmarket.faq.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class FaqVO {

	private int boardId;
	private String faqTitle;
	private String faqContent;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date faqDate;
	private String faqState;
	private String faqAnswerContent;
	private String adminId;
	private String memberNickname;

}
