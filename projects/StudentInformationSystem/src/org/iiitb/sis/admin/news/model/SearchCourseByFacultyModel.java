package org.iiitb.sis.admin.news.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.iiitb.sis.admin.news.action.SearchCourseByFaculty;
import org.iiitb.sis.dto.News;
import org.iiitb.sis.util.ConnectionPool;
import java.sql.Connection;
public class SearchCourseByFacultyModel {
	
	private String fid;
	private String cid;
	private String ntitle;
	private String ndetails;
	private String isactive;
	private int nfid;
	
	
	public ArrayList<News> list=new ArrayList<News>();
	
	public String getCourseID()
	{
		int p;
		Statement stmt = null;
		try
		{
			Connection con=ConnectionPool.getConnection();
			System.out.println("value of nid"+fid);
			stmt = con.createStatement();
			String sql = "Select * from teaches where fid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			nfid=Integer.parseInt(fid);
			
			ps.setInt(1, nfid);
			ResultSet rs= ps.executeQuery();
	         while(rs.next()){
	        	 News tmpnews=new News();
	        	 p=rs.getInt("cid");
	        	 tmpnews.setCid(p);
	        	 System.out.println("the value from news");
	        	 System.out.println(tmpnews.getCid());
	        	 System.out.println(p);
	        	 SearchCourseByFaculty s=new SearchCourseByFaculty();
	        	 s.setCid(p);
	         }
		}
		catch (Exception e)
		{
			System.out.println(e);
			
		}
		return "Success";
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
	 * @return the nfid
	 */
	public int getNfid() {
		return nfid;
	}





	/**
	 * @param nfid the nfid to set
	 */
	public void setNfid(int nfid) {
		this.nfid = nfid;
	}
	

}
