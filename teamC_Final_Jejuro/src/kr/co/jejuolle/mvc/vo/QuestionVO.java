package kr.co.jejuolle.mvc.vo;

import java.util.List;

public class QuestionVO {
	private int qnum;
	private String uno,uEmail,categoryname,utitle,qcontent,qdate;
	private String Qanswer;
	
	public String getQanswer() {
		return Qanswer;
	}
	public void setQanswer(String qanswer) {
		Qanswer = qanswer;
	}
	public void setUno(String uno) {
		this.uno = uno;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getUno() {
		return uno;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public String getUtitle() {
		return utitle;
	}
	public void setUtitle(String utitle) {
		this.utitle = utitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
}
