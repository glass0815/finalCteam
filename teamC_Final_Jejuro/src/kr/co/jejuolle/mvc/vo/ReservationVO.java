package kr.co.jejuolle.mvc.vo;

public class ReservationVO {
	
	private String startDate,endDate;
	private int rvNo,rNo,uNo,rvPeople;
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getRvNo() {
		return rvNo;
	}
	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getRvPeople() {
		return rvPeople;
	}
	public void setRvPeople(int rvPeople) {
		this.rvPeople = rvPeople;
	}
	

}
