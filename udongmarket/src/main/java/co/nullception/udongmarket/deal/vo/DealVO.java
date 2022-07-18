package co.nullception.udongmarket.deal.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class DealVO {

	private int boardId;
	private String nickname;
	private String dealCategory;
	private String dealTitle;
	private String dealContent;
	private String dealDate;
	private int price;
	private String dealState;
	private int dealHit;
	private String location;
	private String attach;
	private String attachDir;

	public DealVO() {
		super();
	}

}
