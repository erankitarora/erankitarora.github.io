<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="org.iiitb.sis.util.ConnectionPool" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

	<%! ConnectionPool data = new ConnectionPool();
		PreparedStatement ps;
		ArrayList<String> cname=new ArrayList<String>();
		int i;
	%>
	
	<%
		Connection conn = data.getConnection();	
		ps=conn.prepareStatement("select cname from courses ");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			cname.add(rs.getString(1));
		}
		ps.close();
		rs.close();
		data.freeConnection(conn);
	%>

	<div class="panel panel-primary">

		<!-- Screen heading -->
		<div class="panel-heading" align="center">
			<h3>Grade Update: Add/Update Grades</h3>
		</div>

		<div class="panel-body" align="center">

			<!-- Input form -->
			
			<form id="form_chirag" class="form-horizontal">

					 
					 <select class="form-control" name="cname" placeholder="Course Name" id="cname" required>
										<option value="default" selected>Select below</option>
										<%
										for(i=0;i<cname.size();i++)
											{%><option value="<%=cname.get(i) %>"><%=cname.get(i) %></option>
											<%
											}%>
											<%cname.clear(); %>
									</select>
					 
					<div class="row" align="center">
						<div class="col-lg-12" >
							<input type="button" name="Search" value="Search" class="btn btn-primary" onclick="addtogradescript(this.form)">							
						</div>
					</div>
				
			</form>
			<br>


			<form id="chirag" class="form-horizontal">
				<s:set name="searchvar" value="search_key" />
				<div class="table-responsive">
					  <table class="table" border="1" width="30%" align="center" cssClass="form-control">
		<!-- 	<table cssClass="form-control" border="1" width="40%" align="center">  -->	
					<thead>
						<s:set name="alvar" value="al" />

						<s:if test="%{#alvar!=null}">
							<td><center><b>Name</b></center></td>
							<td><center><b>RollNo</b></center></td>
							<td><center><b>Grades</b></center></td>
					</thead>

					<s:set var="counter" value="0" />

					<s:iterator value="al">
						<tr>



							<td align="center"><s:property value="name" /></td>
							<td align="center"><s:property value="rollno" /></td>

							<td align="center"><s:select cssClass="form-control" label="Graded" headerKey="-1"
									list="#{'1':'A', '2':'B', '3':'C', '4':'D', '5':'Not Graded'}" name="gradeupdate" value="phno" /></td>
						</tr>
					</s:iterator>
	
				</table>

</div>
				<br></br>
				<div class="row" align="center">
					<div class="col-lg-12" >
						<input type="button" name="Submit" value="Submit" class="btn btn-primary" onclick="findgradescript(this.form)">							
					</div>
				</div>
				
				</s:if>

				<s:else>

				</s:else>

			</form>
		</div>
	</div>
						   <%! String msg; %>
						   <% msg=response.getHeader("msg");
					           if(msg!=null)
					           {%>
						 			<div class="col-lg-12 form-group" >
						 				<h2 align="center" class="label label-success"><%=msg %></h2>
						 			</div>
						 		<%}
						 	%>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<%-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> --%>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
