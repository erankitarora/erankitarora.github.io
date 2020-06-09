<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.iiitb.sis.util.ConnectionPool"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.apache.struts2.ServletActionContext"%>
	<!-- Input form -->

<%! ConnectionPool data = new ConnectionPool();
		PreparedStatement ps1,ps3;
		ArrayList<String> I3name=new ArrayList<String>();
		ArrayList<String> Iname=new ArrayList<String>();
		//ArrayList<String> semname=new ArrayList<String>();
		int i,sid;
	%>
	
<%
		Connection conn = data.getConnection();	
		
		ps1=conn.prepareStatement("select InterestName from  interest_master");
		//sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
		//ps.setInt(1,sid);
		ResultSet rs=ps1.executeQuery();
		while(rs.next())
		{
			Iname.add(rs.getString(1));
		}
		data.freeConnection(conn); 
%>
<!-- Screen heading -->
<div class="panel panel-primary">
<div class="panel-heading" align="center">Name: Ankit Arora		Roll No.: MT2014007</div>
	<div class="panel-body" align="center">
		<form class="form-horizontal" method="get"
			enctype="multipart/form-data" name="myform" id="myform">
			<fieldset>
				<!-- 1st row of form -->
				<div class="row">
					<!-- 1st column of 0th row -->
					<div class="col-lg-5" align="right">
						<b>Interest:</b>
					</div>
					<div class="col-lg-1"></div>
					<div class="col-lg-4" align="left">
						<select class="form-control"  name="Iname" placeholder="Interest Name"	id="Iname" onchange=question1(this.value) required>
							<option value="default" selected>Select below</option>

							<%
										for(i=0;i<Iname.size();i++)
											{%><option value="<%=Iname.get(i) %>"><%=Iname.get(i) %></option>
							<%
											}%>
							<%
											Iname.clear(); 
								
																				
											%>
						</select>
					</div>
				</div>

				<br>

				
				<!-- 5th row ends here -->
				

			</fieldset>
		</form>
	</div>
</div>
<div id="interest_question1">
</div>