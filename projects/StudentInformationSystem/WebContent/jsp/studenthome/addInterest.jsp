<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.iiitb.sis.util.ConnectionPool"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.apache.struts2.ServletActionContext"%>

<%! ConnectionPool data = new ConnectionPool();
		PreparedStatement ps,ps1,ps3;
		ArrayList<String> I2name=new ArrayList<String>();
		ArrayList<String> I4name=new ArrayList<String>();
		ArrayList<String> I3name=new ArrayList<String>();
		ArrayList<String> Iname=new ArrayList<String>();
		//ArrayList<String> semname=new ArrayList<String>();
		int i,sid;
	%>
	<%
		/* Connection conn = data.getConnection();	
		
		ps=conn.prepareStatement("select InterestName from  interest_master ");
		//sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
		//ps.setInt(1,sid);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			Iname.add(rs.getString(1));
		}
		 
		ps.close();
		rs.close();
		data.freeConnection(conn); */
	%>
	<%
		Connection conn = data.getConnection();	
		
		ps=conn.prepareStatement("select InterestID from  interest_master ");
		//sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
		//ps.setInt(1,sid);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			I2name.add(rs.getString(1));
		}
		ps1=conn.prepareStatement("select InterestID from  student_interest where sid=? ");
		sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
		ps1.setInt(1,sid);
		ResultSet rs1=ps1.executeQuery();
		while(rs1.next())
		{
			I3name.add(rs1.getString(1));
		}
		for(String str1:I2name)
		{
			int flag=0;
			for(String str2:I3name)
			{
				if(str1.equals(str2))
				flag=1;;
				
			}
			if(flag==0)
				I4name.add(str1);
		}
		for(String str3:I4name)
		{
			ps3=conn.prepareStatement("select InterestName from  interest_master where interestID=?");
			//sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
			ps3.setString(1,str3);
			ResultSet rs3=ps3.executeQuery();
			while(rs3.next())
			{
				Iname.add(rs3.getString(1));
			}
		}
		ps.close();
		rs.close();
		data.freeConnection(conn); 
	%>

<%-- <%
		ConnectionPool data = new ConnectionPool();
		PreparedStatement ps,ps1;
		ArrayList<String> Iname=new ArrayList<String>();
		int sid;
		int i;
		Connection conn = data.getConnection();	
		ps1=conn.preparedStatement("select InterestID from  student_interest where sid=?");
		sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
		ps1.setInt(1,sid);
		System.out.println(sid);
		ResultSet rs1=ps1.executeQuery();
		while(rs1.next())
		{
		ps=conn.prepareStatement("select InterestName from interest_master where InterestName not in(select InterestName from interest_master where InterestID =?");
		//ps=conn.prepareStatement("select InterestName from interest_master");
		ps.setInt(1,rs1.getInt(1));
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			Iname.add(rs.getString(1));
		}
		}
		
		
		ps.close();
		rs.close();
		data.freeConnection(conn);
	%> --%>
<!-- Container for the entire page -->
<div class="panel panel-primary">

	<!-- Screen heading -->
	<div class="panel-heading" align="center">
		<h3>Add Interest</h3>
		<%! String msg; %>
				<%msg=response.getHeader("msg");
			                  if(msg!=null)
			                   {%>
				<h3><%=response.getHeader("msg") %></h3>
				<%}
		                      %>
	</div>
	<div class="panel-body" align="center">

		<!-- Input form -->
		<form class="form-horizontal" method="post"
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
						<select class="form-control"  name="Iname"
							placeholder="Interest Name"
							id="semname" required>
							<option value="default" selected>Select below</option>

							<%
										for(i=0;i<Iname.size();i++)
											{%><option value="<%=Iname.get(i) %>"><%=Iname.get(i) %></option>
							<%
											}%>
							<%
											Iname.clear(); 
											I2name.clear();
											I3name.clear();
											I4name.clear(); 
											
											%>
						</select>
					</div>
				</div>

				<br>

				

				<div class="row" align="center">
					<div class="col-lg-12">
						<input id="submit" type="button" class="btn btn-primary"
							value="Submit" onclick="addInterestscript(this.form)">

					</div>
				</div>
				
				<!-- 5th row ends here -->
				

			</fieldset>
		</form>
	</div>
</div>

<script type="text/javascript">
/* function ajaxSem(ccode)
{
	
		
		var ccode = document.getElementsByName("semname").value;
		
		
		
		
				alert(ccode);
				showSem(ccode);
			
	}  */

			/*  $("#myform").on('submit',function(e)
			 {
					var sname = document.forms["myform"]["sname"].value;
					var cname = document.forms["myform"]["cname"].value;
					var semname = document.forms["myform"]["semname"].value;
				   
				    if (sname==null || sname==""){
				        alert("Course Name must be filled out"); return false;}
				    else if (cname==null || cname==""){
				        alert("Faculty Name must be filled out"); return false;}
				    else if (semname==null || semname==""){
				    	alert("Semester must be filled out"); return false;}
				    
			     var formData = new FormData(this);
			     $.ajax({
			         url: 'addAssignment',
			     type: 'POST',
			         data:  formData,
			     mimeType:"multipart/form-data",
			     contentType: false,
			         cache: false,
			         processData:false,
			     success: function(data, textStatus, jqXHR)
			     {
			  		//alert('added successfully');
			    	 document.getElementById("maincenter").innerHTML=jqXHR.responseText;
			     },
			      error: function(jqXHR, textStatus, errorThrown) 
			      {
				    	 document.getElementById("maincenter").innerHTML=jqXHR.responseText;
			      }          
			     });
			     e.preventDefault(); //Prevent Default action. 
			     $("#myform").unbind(e);
			     $("#myform").submit(); //Submit the form
			     
			 });  */
		</script>