package co.nullception.udonmarket.member.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class MemberVO {
	
	private String memberId;
	private String memberPassword;
	private String memberName;
	private int memberPhone;
	private String memberEmail;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private Date memberBirth;
	private String memberAddress;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private Date memberJoinDate;
	private String memberLocation;
	private int memberMannerTemp;
	private String memberBlindState;
	private String memberIdDisabled;
	private String memberNickname;
	private String memberLv;

}
