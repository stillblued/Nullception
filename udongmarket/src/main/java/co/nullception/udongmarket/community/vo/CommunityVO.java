package co.nullception.udongmarket.community.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class CommunityVO {
	
	private int boardId;
	private String comCategory;
	private String comTitle;
	private String comContent;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private Date comDate;
	private int comHit;
	private String memberLocation;
	private String memberNickname;

}
