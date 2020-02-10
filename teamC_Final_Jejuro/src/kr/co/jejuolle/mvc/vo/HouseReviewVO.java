package kr.co.jejuolle.mvc.vo;

public class HouseReviewVO {
	private int hrNo,hNo,uNo,hrPoint;
	private String hrContent,hrDate;
	public int getHrNo() {
		return hrNo;
	}
	public void setHrNo(int hrNo) {
		this.hrNo = hrNo;
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getHrPoint() {
		return hrPoint;
	}
	public void setHrPoint(int hrPoint) {
		this.hrPoint = hrPoint;
	}
	public String getHrContent() {
		return hrContent;
	}
	public void setHrContent(String hrContent) {
		this.hrContent = hrContent;
	}
	public String getHrDate() {
		return hrDate;
	}
	public void setHrDate(String hrDate) {
		this.hrDate = hrDate;
	}
}
