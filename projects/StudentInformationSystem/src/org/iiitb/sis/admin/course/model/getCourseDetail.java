package org.iiitb.sis.admin.course.model;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.sis.dto.courses;
import org.iiitb.sis.util.ConnectionPool;
public class getCourseDetail  {
	
	String ccode;
	private String sem;
	public String getSem() {
		return sem;
	}

	public void setSem(String sem) {
		this.sem = sem;
	}

	int isactive;
	private List<String> semesters = new ArrayList<String>();
	public ArrayList<courses> object=new ArrayList<courses>();
	updateCourse uc=new updateCourse();
	
	
	public void search() throws SQLException {
		
		ConnectionPool data=new ConnectionPool();
		java.sql.Connection con= data.getConnection();
		PreparedStatement ps;
		ps=con.prepareStatement("Select cid,ccode,cname,credits,csyllabus,isactive,semid from courses where ccode = ?");
		ps.setString(1, getCcode());
		ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				courses obj=new courses();
				obj.setCourseId(rs.getInt(1));
				obj.setCcode(rs.getString(2));
				obj.setCourseName((rs.getString(3)));
				obj.setCourseCredits((rs.getInt(4)));
				obj.setCourseSyllabus(rs.getString(5));
				obj.setIsactive(rs.getInt(6));
				
	
			    setSem(Integer.toString(rs.getInt(7)));
			    System.out.println(getSem());
				obj.setSemname(sem);
				setIsactive(rs.getInt(6));
				object.add(obj);
				
				
			}
			String query = "select semname from sem_master";
			PreparedStatement st = con.prepareStatement(query);
			rs = st.executeQuery();

			while(rs.next())
			{
				setSemesters(rs.getString(1));
			}
			ConnectionPool.freeConnection(con);
			
		}
		
		public int getIsactive() {
		return isactive;
	}

	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}

		public String getCcode() {
		return ccode;
	}

	public void setCcode(String ccode) {
		this.ccode = ccode;
	}

	public String searchlist() throws SQLException
	{
		
		ConnectionPool data=new ConnectionPool();
		java.sql.Connection con= data.getConnection();
		PreparedStatement st;
		st=con.prepareStatement("Select  cid,ccode,cname,credits,semid from courses  where ccode LIKE ? order by semid");
		st.setString(1, "%"+getCcode()+"%");
	    ResultSet rs=st.executeQuery();
	    
		
		while(rs.next())
		{
			courses obj=new courses();
			obj.setCourseId(rs.getInt(1));
			obj.setCcode(rs.getString(2));
			obj.setCourseName((rs.getString(3)));
			obj.setCourseCredits((rs.getInt(4)));
			obj.setSemid((rs.getString(5)));
			object.add(obj);
			
			
		}
		ConnectionPool.freeConnection(con);
		return "success";
		
		
	}

	/**
	 * @return the semesters
	 */
	public List<String> getSemesters() {
		return semesters;
	}

	/**
	 * @param semesters the semesters to set
	 */
	public void setSemesters(String sem) {
		semesters.add(sem);
	}

}
