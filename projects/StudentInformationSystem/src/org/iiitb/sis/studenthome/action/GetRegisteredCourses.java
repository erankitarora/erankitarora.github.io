package org.iiitb.sis.studenthome.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.util.Constants;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class GetRegisteredCourses extends ActionSupport implements ModelDriven<ArrayList<RegCourses>>
{
	private static final long serialVersionUID = -4960193307602423023L;
	private ArrayList<RegCourses> gr= new ArrayList<RegCourses>();
	private int sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
	Connection con;
	public ArrayList<RegCourses> getGr() {
		return gr;
	}
	public void setGr(ArrayList<RegCourses> gr) {
		this.gr = gr;
	}
	public void addGradeintoList(RegCourses g)
	{
		this.gr.add(g);
	}
	public String getRegisteredCourses()
	{
		try 
		{
			int count=0;
			con=ConnectionPool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(Constants.GET_REG_COURSES);
			pstmt.setInt(1, sid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				do
				{
					count++;
					RegCourses g=new RegCourses();
					g.setSemname(rs.getString(1));
					g.setCcode(rs.getString(2));
					g.setCname(rs.getString(3));
					g.setCredits(rs.getInt(4));
					addGradeintoList(g);
				}while(rs.next());
			}
			ConnectionPool.freeConnection(con);
			ServletActionContext.getResponse().addHeader("ccount",Integer.toString(count));
			return "success";
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			ConnectionPool.freeConnection(con);
		    return "error";
		} 
	}
	@Override
	public ArrayList<RegCourses> getModel() {
		return gr;
	}
}
