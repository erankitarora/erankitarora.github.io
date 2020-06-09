package org.iiitb.sis.studenthome.action;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.util.Constants;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class GetGrades extends ActionSupport implements ModelDriven<ArrayList<Grades>>
{
	private static final long serialVersionUID = -7056718679108161765L;
	private ArrayList<Grades> gr= new ArrayList<Grades>();
	private int sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
	Connection con;
	public ArrayList<Grades> getGr() {
		return gr;
	}
	public void setGr(ArrayList<Grades> gr) {
		this.gr = gr;
	}
	public void addGradeintoList(Grades g)
	{
		this.gr.add(g);
	}
	public String getGrades()
	{
		char passOrFail;
		try 
		{
			int count=0;
			con=ConnectionPool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(Constants.GET_GRADES);
			pstmt.setInt(1, sid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				float avggrd=0;
				do
				{
					count++;
					Grades g=new Grades();
					g.setSemname(rs.getString(1));
					g.setCname(rs.getString(2));
					g.setGname(rs.getString(3));
					g.setWeightage(rs.getFloat(4));
					
					if(rs.getString(5).charAt(0)=='0')
						passOrFail='F';
					else
						passOrFail='P';
					g.setPassorfail(passOrFail);
					addGradeintoList(g);
					avggrd+=rs.getFloat(4);
				}while(rs.next());
				avggrd/=count;
				ServletActionContext.getResponse().addHeader("avggrd",Float.toString(avggrd));
			}
			ConnectionPool.freeConnection(con);
			ServletActionContext.getResponse().addHeader("gcount",Integer.toString(count));
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
	public ArrayList<Grades> getModel() {
		return gr;
	}
}
