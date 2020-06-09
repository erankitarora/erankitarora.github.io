package org.iiitb.sis.admin.news.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.util.Constants;
public class SearchModel {
	private String nid;
	private String fid;
	private String ntitle;
	private String ndetails;
	private String isactive;
	private String cid;
	
	public String getInfo(){
		System.out.println("hdjddk");
		Connection con;
		try
		{
		
		con=ConnectionPool.getConnection();
		
		PreparedStatement ps=con.prepareStatement(Constants.UPDATE_INFO);
		System.out.println(nid);
		ps.setString(1,nid);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			System.out.println("i m here");
			fid=rs.getString("fid");
			cid=rs.getString("cid");
			ntitle=rs.getString("ntitle");
			ndetails=rs.getString("ndetails");
			isactive=rs.getString("isactive");
			
			System.out.println(fid+cid+ntitle+ndetails+isactive);
			
			
		}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return "Success";
	}

	/**
	 * @return the ntitle
	 */
	public String getNtitle() {
		return ntitle;
	}

	/**
	 * @param ntitle the ntitle to set
	 */
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	/**
	 * @return the fid
	 */
	public String getFid() {
		return fid;
	}

	/**
	 * @param fid the fid to set
	 */
	public void setFid(String fid) {
		this.fid = fid;
	}

	/**
	 * @return the ndetails
	 */
	public String getNdetails() {
		return ndetails;
	}

	/**
	 * @param ndetails the ndetails to set
	 */
	public void setNdetails(String ndetails) {
		this.ndetails = ndetails;
	}

	/**
	 * @return the isactive
	 */
	public String getIsactive() {
		return isactive;
	}

	/**
	 * @param isactive the isactive to set
	 */
	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}

	/**
	 * @return the cid
	 */
	public String getCid() {
		return cid;
	}

	/**
	 * @param cid the cid to set
	 */
	public void setCid(String cid) {
		this.cid = cid;
	}

	/**
	 * @return the nid
	 */
	public String getNid() {
		return nid;
	}

	/**
	 * @param nid the nid to set
	 */
	public void setNid(String nid) {
		this.nid = nid;
	}
	
}
