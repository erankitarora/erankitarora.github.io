<%@page import="org.iiitb.sis.util.ConnectionPool"%>
<%@page import="org.iiitb.sis.util.Constants"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%! ConnectionPool data = new ConnectionPool();
		PreparedStatement ps;
		ArrayList<String> intrestid=new ArrayList<String>();
		ArrayList<String> intrestname=new ArrayList<String>();
		Connection con = ConnectionPool.getConnection();
		ResultSet rs;
		int i=0;
	%>








<%@taglib prefix="s" uri="/struts-tags"%>

<title>Add News</title>





<%! String msg; %>
<% msg=response.getHeader("msg");
           if(msg!=null)
           {%>
<div class="col-lg-12 form-group">
	<h2 align="center" class="label label-success"><%=msg %></h2>
</div>
<%}
	 	%>
<%
		
		ps=con.prepareStatement("select * from interest_master");
		rs=ps.executeQuery();
		while(rs.next())
		{
			intrestname.add(rs.getString(2));
		}
	%>

<!-- Container for the entire page -->
<div class="panel panel-primary">

	<!-- Screen heading -->
	<div class="panel-heading" align="center">
		<h3>Add News</h3>
	</div>
	<div class="panel-body" align="center">

		<!-- Input form -->

		<form  name="newsform">
			<fieldset>
				<div class="row">


					<div class="col-md-3"></div>
					<div class="col-md-3" align="center">
						<b>Select News title</b>
					</div>

                     <div class="col-md-4" align="left">
						<input type="text" name="addNewsModel.ntitle" class="form-control">
					</div>
					
				</div>
				<br>


				<div class="row">


					<div class="col-md-3"></div>
					<div class="col-md-3" align="center">
						<b>News Detail</b>
					</div>
                    <div class="col-md-4" align="left">
						<textarea required name="addNewsModel.ndetails" rows="4" cols="40"
							class="form-control">
									
								</textarea>
					</div> 
					
				</div>
				<br>
				<div class="row">


					<div class="col-md-3"></div>
					<div class="col-md-3" align="center">
						<b>Interest</b>
					</div>
					<div class="col-md-4" align="left">

						
						<select class="form-control" name="addNewsModel.name" placeholder="Name" id="addNewsModel.name" required>
							<option value="default" selected>Select below</option>

							<%
										for(i=0;i<intrestname.size();i++)
											{%><option value="<%=intrestname.get(i)%>"><%=intrestname.get(i)%></option>
							<%
											}%>
							<%
											intrestname.clear();  
											%>
						</select>
						
						
					</div>
				</div>
				



								<br> <br> <br> <br> <br>

				<div class="row" align="center">

					<div class="col-lg-12">
						<input type="button" class="btn btn-primary" value="ADD NEWS"
							onclick="addnewsscript(this.form)">
					</div>
				</div>


			</fieldset>
		</form>

	</div>
</div>
<script type="text/javascript">
/* 
		 $("#newsform").on('submit',function(e)
		 {
			 var formData = new FormData(this);
		     $.ajax({
		         url:'addNews',
		     type: 'POST',
		         data:  formData,
		     mimeType:"multipart/form-data",
		     contentType: false,
		         cache: false,
		         processData:false,
		     success: function(data, textStatus, jqXHR)
		     {
		    	 document.getElementById("maincenter").innerHTML=jqXHR.responseText;
		     },
		      error: function(jqXHR, textStatus, errorThrown) 
		      {      alert('added wrong');
			    	 document.getElementById("maincenter").innerHTML=jqXHR.responseText;
		      }          
		     });
		     e.preventDefault(); //Prevent Default action. 
		     $(this).unbind(e);
		     $("#newsform").submit(); //Submit the form
		 });  */
	</script>

