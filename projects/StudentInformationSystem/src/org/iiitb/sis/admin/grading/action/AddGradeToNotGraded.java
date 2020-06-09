package org.iiitb.sis.admin.grading.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.dto.Student;

import com.opensymphony.xwork2.ActionSupport;

public class AddGradeToNotGraded extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private String search_key;
	private String course_name;
	//private String[] myGrades;	
	String[] Grade;
	ArrayList<String> courselist = new ArrayList<>();
	static ArrayList<String> courseTempList;
	public String cname;
	static String cname_state;

	private Student student =new Student();
	public ArrayList<Student> al= new ArrayList<Student>();
	//public ArrayList<String> courses = null;
	public static String coursename;
	public String url;
	//when search with course ID gets called	
	public  String[] gradeupdate;


	public String getSearch_key() {
		return search_key;
	}

	public void setSearch_key(String search_key) {
		this.search_key = search_key;
	}

	public String AddcourseList()
	{  
		System.out.println("in grade action");
		AddGradesSrvc gd=new AddGradesSrvc();
		setCourselist(gd.courseList());
		courseTempList = getCourselist();
		return "success";
		
	}


	public String SearchWithCourseID()
	{	
		String search=cname;
		cname_state=cname;
	 ArrayList<Student> res = new ArrayList<Student>();
		AddGradeToNotGraded agt=new AddGradeToNotGraded();
		agt.setCourse_name(search);
		coursename=search;
		System.out.println("in add to course");
		System.out.println(coursename);
		AddGradesSrvc obj=new AddGradesSrvc();
		obj.getStudent(agt,res);
		System.out.println("grade"+agt.getGrade()[0]);
		setGrade(agt.getGrade());
		System.out.println("res size = "+res.size());
		setAl(res);
		setCourselist(courseTempList);
		return "success";
		
	}
	
	public String UpdateGrades()
	{	
		System.out.println("IN UPDATE GRADES");
		
		System.out.println(coursename);

		System.out.println(gradeupdate.length);
		
		AddGradesSrvc obj1=new AddGradesSrvc();
		obj1.updatedatabase(gradeupdate,cname_state);
		
		setCourselist(courseTempList);
		
		al=null;
		ServletActionContext.getResponse().addHeader("msg", "Grade Has been updatedSucessfully");
		return "success";
		
	}

	
	public String SubmitGrading()
	{	
//		System.out.println(al.size());
		
/*		for(int i=0;i<getAl().size();i++)
		{
			Student t=getAl().get(i);
			System.out.println(t.getSid()+ " "+t.getName()+" "+t.getPhno());
		
		}
*/		return "success";

		
	}

	public String[] getGrade() {
		return Grade;
	}

	public void setGrade(String[] grade) {
		Grade = grade;
	}

	public ArrayList<Student> getAl() {
		return al;
	}

	public void setAl(ArrayList<Student> al) {
		this.al = al;
	}

	public String[] getGradeupdate() {
		return gradeupdate;
	}

	public void setGradeupdate(String[] gradeupdate) {
		this.gradeupdate = gradeupdate;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public ArrayList<String> getCourselist() {
		return courselist;
	}

	public void setCourselist(ArrayList<String> courselist) {
		this.courselist = courselist;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}
	
	

}
