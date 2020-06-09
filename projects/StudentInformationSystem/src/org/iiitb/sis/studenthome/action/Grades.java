package org.iiitb.sis.studenthome.action;

public class Grades 
{
	private String semname;
	private String cname;
	private String gname;
	private float weightage;
	private char passorfail;
	public char getPassorfail() {
		return passorfail;
	}
	public void setPassorfail(char passorfail) {
		this.passorfail = passorfail;
	}
	public String getSemname() {
		return semname;
	}
	public void setSemname(String semname) {
		this.semname = semname;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public float getWeightage() {
		return weightage;
	}
	public void setWeightage(float weightage) {
		this.weightage = weightage;
	}
}
