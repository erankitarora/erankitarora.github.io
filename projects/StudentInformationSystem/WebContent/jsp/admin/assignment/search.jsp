<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./ajaxscripts.jsp" %>

	
	<!-- Container for the entire page -->
		<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Search Faculty By Name</h3></div>
			<div class="panel-body" align="center">
				<form  class="form-horizontal" name="search_form" onsubmit="return validateForm()">
					<fieldset>
						<legend>Search</legend>
						<div class="row">
							<div class="col-lg-4"></div>
							<div class="col-lg-4" align="center">
								<input type="text" class="form-control" onkeyup="search()" id="fname" name="fname" placeholder="Faculty Name" required>
							</div>
							<div class="col-lg-4" align="left">
								<input type="button" class="btn btn-primary" onclick="validateAndSearch()" align="left" value="Search">
							</div>
						</div>
					</fieldset>			
				</form>
				</div>
			</div>	
			<form class="form-horizontal" method="post" enctype="multipart/form-data" name="updateform" id="updateform">
				<div id="assignmentMaincenter"></div>
			</form>

<script type="text/javascript">

		function validateAndSearch()
		{
			var fname=document.getElementById('fname').value;
			/* if(fname) */
				searchAssignment(fname);
			/* else
				alert("Please enter the Faculty Name"); */
		}
		
		function search()
		{
			var fname=document.getElementById('fname').value;
			if(fname)
				searchAssignment(fname);
		}

		function UpdateQuery()
		{
			var selectedUser=null;
			var allRadios = document.getElementsByName("selectedUser");
			for (var i=0;i<allRadios.length;i++)
			{
				if(allRadios[i].checked)
				{
					selectedUser = allRadios[i].value;
				}
			}
			if(selectedUser==null)
			{
				alert("Select a Faculty Assignment to update or delete");
			}
			else
				updateAssignment(selectedUser,"Update");
		}
		function DeleteQuery()
		{
			
				var selectedUser=null;
				var allRadios = document.getElementsByName("selectedUser");
				for (var i=0;i<allRadios.length;i++)
				{
					if(allRadios[i].checked)
					{
			       		selectedUser = allRadios[i].value;
					}
				}
				if(selectedUser==null)
				{
					alert("Select a Faculty Assignment to update or delete");
				}
				else
				{
					var confirmDelete = confirm("Are You Sure?");
					if (confirmDelete == true) 
					{
						updateAssignment(selectedUser,"Delete");
					}
				}
			} 
		
/* 		$("#updateform").on('submit',function(e)
				 {
			 	
					var cname = document.forms["updateform"]["cname"].value;
					var fname = document.forms["updateform"]["fname"].value;
					var semname = document.forms["updateform"]["semname"].value;
				   
				    if (cname==null || cname==""){
				        alert("Course Name must be filled out"); return false;}
				    else if (fname==null || fname==""){
				        alert("Faculty Name must be filled out"); return false;}
				    else if (semname==null || semname==""){
				    	alert("Semester must be filled out"); return false;}
					    
				     var formData = new FormData(this);
				     $.ajax({
				         url: 'updateAssignment',
				     type: 'POST',
				         data:  formData,
				     mimeType:"multipart/form-data",
				     contentType: false,
				         cache: false,
				         processData:false,
				     success: function(data, textStatus, jqXHR)
				     {
				  		//alert('added successfully');
				    	 document.getElementById("assignmentMaincenter").innerHTML=jqXHR.responseText;
				     },
				      error: function(jqXHR, textStatus, errorThrown) 
				      {
					    	 document.getElementById("assignmentMaincenter").innerHTML=jqXHR.responseText;
				      }          
				     });
				     e.preventDefault(); //Prevent Default action. 
				     $("#updateform").unbind(e);
				     $("#updateform").submit(); //Submit the form
				     
				 });  */
	 

</script>
