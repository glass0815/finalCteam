package kr.co.jejuolle.mvc.vo;

public class TourReviewVO {
	private int trNo,tNo,uNo,trPoint;
	public int getTrNo() {
		return trNo;
	}
	public void setTrNo(int trNo) {
		this.trNo = trNo;
	}
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getTrPoint() {
		return trPoint;
	}
	public void setTrPoint(int trPoint) {
		this.trPoint = trPoint;
	}
	public String getTrContent() {
		return trContent;
	}
	public void setTrContent(String trContent) {
		this.trContent = trContent;
	}
	public String getTrDate() {
		return trDate;
	}
	public void setTrDate(String trDate) {
		this.trDate = trDate;
	}
	private String trContent,trDate;
}
