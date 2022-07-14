package co.nullception.udonmarket.deal.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class DealVO {
	
	private int boardId;
	private String dealCategory;
	private String dealTitle;
	private String dealContent;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private Date dealDate;
	private int dealPrice;
	private String dealState;
	private String dealAttach;
	private String memberLocation;
	private String memberNickname;

}
