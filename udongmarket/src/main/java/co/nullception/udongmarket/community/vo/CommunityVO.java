package co.nullception.udongmarket.community.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class CommunityVO {
	
	private int boardId;
	private String nickname;
	private String comCategory;
	private String comTitle;
	private String comContent;
	private String comDate;
	private String location;
	private String attach;
	private String attachDir;

}
