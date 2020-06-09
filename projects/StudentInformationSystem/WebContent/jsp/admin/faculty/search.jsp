<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		     <br>
		     <br>
	<div class="panel panel-primary" id="maincenter2">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Search Faculty</h3></div>
			<div class="panel-body" align="center">
				<form  class="form-horizontal" name="search_form" >
					<fieldset>
						<legend>Search</legend>
						<div class="row">
							<div class="col-lg-4"></div>
							<div class="col-lg-4" align="center">
								<input type="text" class="form-control" onkeyup="validateAndSearch()" id="sname" name="sname" placeholder="Faculty name" >
							</div>
							<div class="col-lg-4" align="left">
								<input type="button" class="btn btn-primary" onclick="validateAndSearch()" align="left" value="Search">
							</div>
						</div>
					</fieldset>			
				</form>
				</div>
			</div>	
			<form class="form-horizontal" method="post" enctype="multipart/form-data" name="updateFacultyform" id="updateFacultyform">
				<div id="maincenter1"></div>
			</form>
			<%! String msg; %>
			<%msg=response.getHeader("msg");
			if(msg!=null)
			{%>
				<center><h3><%=response.getHeader("msg") %></h3></center>	
			<% }
		     %>


<script type="text/javascript">
			function validateAndSearch()
		{   
			var sname=document.getElementById('sname').value;
		
				searchFaculty(sname);
			
		}
			function UpdateQuery()
			{    
				
				var selectedUser=null;
				var allRadios = document.getElementsByName("rollno1");
				for (var i=0;i<allRadios.length;i++)
				{
					if(allRadios[i].checked)
					{
						selectedUser = allRadios[i].value;
					}
				}
				if(selectedUser==null)
				{
					alert("Select a user to update or delete");
				}
				else
					updateFaculty(selectedUser);
			}
			function DeleteQuery()
			{
				
					var selectedUser=null;
					var allRadios = document.getElementsByName("rollno1");
					for (var i=0;i<allRadios.length;i++)
					{
						if(allRadios[i].checked)
						{
				       		selectedUser = allRadios[i].value;
						}
					}
					if(selectedUser==null)
					{
						alert("Select a user to update or delete");
					}
					else
					{
						var confirmDelete = confirm("Are You Sure?");
						if (confirmDelete == true) 
						{
							deleteFaculty(selectedUser);
						}
					}
				} 
			function Updatethevalue()
			{   alert("he he u r sure u want to update");
				var sname=document.getElementById('sname').value;
			
					searchFaculty(sname);
				
			}
			
			/* 
			$("#updateFacultyform").on('submit',function(e)
					 {
				 	
                        						    
					     var formData = new FormData(this);
					     $.ajax({
					         url: 'updateFaculty',
					     type: 'POST',
					         data:  formData,
					     mimeType:"multipart/form-data",
					     contentType: false,
					         cache: false,
					         processData:false,
					     success: function(data, textStatus, jqXHR)
					     {
					  		//alert('added successfully');
					    	 document.getElementById("maincenter1").innerHTML=jqXHR.responseText;
					     },
					      error: function(jqXHR, textStatus, errorThrown) 
					      {
						    	 document.getElementById("maincenter1").innerHTML=jqXHR.responseText;
					      }          
					     });
					     e.preventDefault(); //Prevent Default action. 
					     $("#updateFacultyform").unbind(e);
					     $("#updateFacultyform").submit(); //Submit the form
					     
					 });  */
			
			
</script>
