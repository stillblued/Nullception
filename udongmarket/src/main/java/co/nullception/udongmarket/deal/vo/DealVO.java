package co.nullception.udongmarket.deal.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class DealVO {
	
	private int boardId;
	private String dealCategory;
	private String dealTitle;
	private String dealContent;
	private String dealDate;
	private int dealPrice;
	private String dealState;
	private String attach;
	private String memberLocation;
	private String memberNickname;
	private String attachDir;

}
