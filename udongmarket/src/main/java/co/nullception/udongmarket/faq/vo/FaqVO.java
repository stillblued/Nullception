package co.nullception.udongmarket.faq.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class FaqVO {

	private int boardId;
	private String nickname;
	private String faqTitle;
	private String faqContent;
	private String faqDate;
	private String answerContent;
	private String reportedId;
	private String attach;
	private String attachDir;


}
