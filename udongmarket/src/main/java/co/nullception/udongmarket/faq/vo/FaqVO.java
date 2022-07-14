package co.nullception.udongmarket.faq.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class FaqVO {

	private int boardId;
	private String faqTitle;
	private String faqContent;
	private String faqDate;
	private String faqState;
	private String faqAnswerContent;
	private String adminId;
	private String memberNickname;

}
