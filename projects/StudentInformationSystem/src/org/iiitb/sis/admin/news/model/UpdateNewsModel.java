package org.iiitb.sis.admin.news.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.util.Constants;


public class UpdateNewsModel {
	
	private String nid,fid,cid;
	private String ntitle,ndetails;
	private String cname;
	private String fname;
	
	
	private int isactive;
	private int ufid,ucid;
	private int unid;
	
	
	public String updateModel()
	{
		Connection con;
		try
		{
			
			System.out.println(nid+fname+cname+ntitle+ndetails);
			con = ConnectionPool.getConnection();
			PreparedStatement ps = con.prepareStatement(Constants.GET_F_ID);
			ps.setString(1, fname);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				fid = rs.getString("fid");
			}
			System.out.println(fid);
			ps = con.prepareStatement(Constants.GET_C_ID);
			ps.setString(1, cname);
			rs = ps.executeQuery();
			if (rs.next()) {
				cid = rs.getString("cid");
			}
			System.out.println(cid);
			/*Db data = new Db();
			
			stmt = data.con.createStatement();
			String sql = "Select count(*) from news";
			System.out.println();
			//ResultSet rs = stmt.executeQuery(sql);
			
			sql = "UPDATE news SET ntitle=?,ndetails=?,cid=?,fid=?,isactive=1 WHERE nid=?;";
			PreparedStatement ps = data.con.prepareStatement(sql);*/
			
			ps = con.prepareStatement(Constants.UPDATE_NEWS);
			ps.setString(1, ntitle);
			ps.setString(2, ndetails);
			ucid=Integer.parseInt(cid);
			ufid=Integer.parseInt(fid);
			unid=Integer.parseInt(nid);
			
			ps.setInt(3, ucid);
			ps.setInt(4, ufid);
			ps.setInt(5, unid);
			ps.executeUpdate();
			
			//System.out.println(getNtitle());
			
			//System.out.println(getNdetails());
			
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return "Success";

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

	/**
	 * @return the isactive
	 */
	public int getIsactive() {
		return isactive;
	}

	/**
	 * @param isactive the isactive to set
	 */
	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}
	
	
	public int getUnid() {
		return unid;
	}

	public void setUnid(int unid) {
		this.unid = unid;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNdetails() {
		return ndetails;
	}

	public void setNdetails(String ndetails) {
		this.ndetails = ndetails;
	}

	public int getUfid() {
		return ufid;
	}

	public void setUfid(int ufid) {
		this.ufid = ufid;
	}

	public int getUcid() {
		return ucid;
	}

	public void setUcid(int ucid) {
		this.ucid = ucid;
	}
	
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

}
