package org.iiitb.sis.dto;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
	private static final long serialVersionUID = -6382397973111293281L;
	private int userid;
	private String username;
	private String usertype;
	private Date lastloggedin;
	private boolean isactive;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public Date getLastloggedin() {
		return lastloggedin;
	}
	public void setLastloggedin(Date lastloggedin) {
		this.lastloggedin = lastloggedin;
	}
	public boolean isIsactive() {
		return isactive;
	}
	public void setIsactive(boolean isactive) {
		this.isactive = isactive;
	}
}
