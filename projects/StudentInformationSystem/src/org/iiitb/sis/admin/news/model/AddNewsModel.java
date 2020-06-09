package org.iiitb.sis.admin.news.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.util.Constants;

public class AddNewsModel {

	
	private String ntitle, ndetails;
	private String name;
	private int intid,news_id;
	public String insert() {
		Connection con;
		try {
			System.out.println(getName());
			con = ConnectionPool.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from interest_master where Interestname=?");
			ps.setString(1, getName());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				intid = rs.getInt("InterestID");
			}
            System.out.println("intrest id that has been selected");
            System.out.println(intid);
			ps = con.prepareStatement("insert into news_interest(news_title,news_details,isactive) values(?,?,1)");
			ps.setString(1,ntitle);
			ps.setString(2,ndetails);
			ps.execute();
			System.out.println("news has been insterted");
			String get_newsid = "select news_id from news_interest where news_title=?";
			ps = con.prepareStatement(get_newsid);
			ps.setString(1,ntitle);
			rs = ps.executeQuery();
			if(rs.next())
			{
				news_id=rs.getInt(1);
			}
			
			System.out.println("news id that has been selected");
			System.out.println(news_id);
			
			ps = con.prepareStatement("insert into interestNews(news_id,InterestID) values(?,?)");
			ps.setInt(1,news_id);
			ps.setInt(2,intid);
			ps.execute();
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		ServletActionContext.getResponse().addHeader("msg",
				"News Has been Inserted Sucessfully");
		return "Success";
	}

	
	public String getNtitle() {
		return ntitle;
	}

	/**
	 * @param ntitle
	 *            the ntitle to set
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
	 * @param ndetails
	 *            the ndetails to set
	 */
	public void setNdetails(String ndetails) {
		this.ndetails = ndetails;
	}

	/**
	 * @return the isactive
	 */


	public int getIntid() {
		return intid;
	}

	public void setIntid(int intid) {
		this.intid = intid;
	}

	public int getNews_id() {
		return news_id;
	}

	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	

}
