package org.iiitb.sis.admin.news.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.util.Constants;

public class DeleteNewsModel {

	private String newsid;
	private String newsname;
	private int nid;
	
	public String delete()
	{
		Connection con;
		try
		{
			
			con = ConnectionPool.getConnection();
			PreparedStatement ps = con.prepareStatement(Constants.GET_N_ID);
			ps.setString(1, newsname);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				newsid = rs.getString("nid");
			}
			System.out.println(newsid);
			ps=con.prepareStatement(Constants.DELETE_NEWS);
			ps.setString(1, newsid);
			ps.executeUpdate();

			/*Db data = new Db();
			
			stmt = data.con.createStatement();
			String sql ;
			sql = "DELETE FROM  news where nid=?;";
			PreparedStatement ps = data.con.prepareStatement(sql);
			nid=Integer.parseInt(newsid);
			System.out.println(nid);
			ps.setInt(1, nid);
			ps.executeUpdate();*/
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		ServletActionContext.getResponse().addHeader("msg", "News Has been Deleted sucesfully");
		return "Success";
	}

	
	
	
	
	/**
	 * @return the newsid
	 */
	public String getNewsid() {
		return newsid;
	}

	/**
	 * @param newsid the newsid to set
	 */
	public void setNewsid(String newsid) {
		this.newsid = newsid;
	}





	/**
	 * @return the nid
	 */
	public int getNid() {
		return nid;
	}





	/**
	 * @param nid the nid to set
	 */
	public void setNid(int nid) {
		this.nid = nid;
	}





	/**
	 * @return the newsname
	 */
	public String getNewsname() {
		return newsname;
	}





	/**
	 * @param newsname the newsname to set
	 */
	public void setNewsname(String newsname) {
		this.newsname = newsname;
	}
}
