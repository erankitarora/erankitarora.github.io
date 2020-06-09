package org.iiitb.sis.dto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.sis.util.ConnectionPool;



public class courses {
	public ArrayList<courses> object=new ArrayList<courses>();
	
	private String semname;
	private String courseName;
	private String ccode;
	private String semid;
	
	private int courseId;
	private int courseCredits;
	private String courseSyllabus;
	private int isactive;
	private List<String> semesters = new ArrayList<String>();
	
	public void get() throws SQLException
	{
		courses ob=new courses();
		setSemname(getSemname());
		ob.setCourseId(getCourseId());
		ob.setCcode(getCcode());
		ob.setCourseName(getCourseName());
		ob.setCourseCredits(getCourseCredits());
		ob.setCourseSyllabus(getCourseSyllabus());
		ob.setIsactive(getIsactive());
		object.add(ob);
		ConnectionPool data=new ConnectionPool();
		java.sql.Connection con= data.getConnection();
		
		
			String query = "select semname from sem_master";
			PreparedStatement st = con.prepareStatement(query);
			ResultSet rs = st.executeQuery();

			while(rs.next())
			{
				setSemesters(rs.getString(1));
			}
			ConnectionPool.freeConnection(con);
			
		}

	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public int getCourseCredits() {
		return courseCredits;
	}
	public void setCourseCredits(int courseCredits) {
		this.courseCredits = courseCredits;
	}
	public String getCourseSyllabus() {
		return courseSyllabus;
	}
	public void setCourseSyllabus(String courseSyllabus) {
		this.courseSyllabus = courseSyllabus;
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
	public String getSemname() {
		return semname;
	}
	public void setSemname(String semname) {
		this.semname = semname;
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
	public void setSemesters(String semester) {
		semesters.add( semester);
	}
	public String getSemid() {
		return semid;
	}

	public void setSemid(String semid) {
		this.semid = semid;
	}


}
