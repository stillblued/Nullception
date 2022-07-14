package co.nullception.udongmarket.count.vo;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CountVO {
	
	private String memberId;
	private int countDwriting;
	private int countCwriting;
	private int countComment;
	private int countWreport;
	private int countWblind;
	private String countWreport_content;
	private int countIdreport;
	private int countIdreport_content;
	private int countDealSuccess;

}
