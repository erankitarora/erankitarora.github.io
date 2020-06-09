package org.iiitb.sis.dto;

import java.io.Serializable;

public class Admin  implements Serializable{
	private static final long serialVersionUID = -8641205941601852544L;
	private int fid;
	private String fname;
	private String phno;
	private String email;
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
