<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.iiitb.sis.util.ConnectionPool"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.apache.struts2.ServletActionContext"%>



<%! ConnectionPool data = new ConnectionPool();
		PreparedStatement ps,ps2;
		ArrayList<String> Iname=new ArrayList<String>();
		int sid;
		int i;
	%>
<%
		Connection conn = data.getConnection();	
		//ps=conn.prepareStatement("select InterestName from interest_master where InterestID =(select InterestID from  student_interest where sid=?));");
		
		ps=conn.prepareStatement("select InterestID from student_interest where sid =?");
		sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
		ps.setInt(1,sid);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			ps2=conn.prepareStatement("select InterestName from interest_master where InterestID =?");
			ps2.setString(1,rs.getString(1));
			ResultSet rs2=ps2.executeQuery();
			while(rs2.next())
			{
				Iname.add(rs2.getString(1));
			}
			
		}
		
		ps.close();
		rs.close();
		data.freeConnection(conn);
	%>
<!-- Container for the entire page -->
<div class="panel panel-primary">

	<!-- Screen heading -->
	<div class="panel-heading" align="center">
		<h3>Delete Interest</h3>
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
						<select class="form-control" multiple="multiple" name="Iname"
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
											%>
						</select>
					</div>
				</div>

				<br>

				

				<div class="row" align="center">
					<div class="col-lg-12">
						<input id="submit" type="button" class="btn btn-primary"
							value="Delete" onclick="deleteInterestscript(this.form)">

					</div>
				</div>
				
				<!-- 5th row ends here -->
				<%! String msg; %>
				<%msg=response.getHeader("msg");
			                  if(msg!=null)
			                   {%>
				<h3><%=response.getHeader("msg") %></h3>
				<%}
		                      %>

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
