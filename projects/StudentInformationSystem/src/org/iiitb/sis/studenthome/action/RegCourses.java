package org.iiitb.sis.studenthome.action;

public class RegCourses {
	private String ccode;
	private String cname;
	private int credits;
	private String semname;
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCredits() {
		return credits;
	}
	public void setCredits(int credits) {
		this.credits = credits;
	}
	public String getSemname() {
		return semname;
	}
	public void setSemname(String semname) {
		this.semname = semname;
	}
}
