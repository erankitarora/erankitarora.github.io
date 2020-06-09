<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./ajaxscripts.jsp" %>

	<!-- Container for the entire page -->
		<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Search Student By Roll No.</h3></div>
			<div class="panel-body" align="center">
				<form  class="form-horizontal" name="search_form" onsubmit="return validateForm()">
					<fieldset>
						<legend>Search</legend>
						<div class="row">
							<div class="col-lg-4"></div>
							<div class="col-lg-4" align="center">
								<input type="text" class="form-control" onkeyup="search()" id="rollno" name="rollno" placeholder="Student Roll no." required>
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
				<div id="studentMaincenter"></div>
			</form>


<script type="text/javascript">

		function validateAndSearch()
		{
			var rollValue=document.getElementById('rollno').value;
			/* if(rollValue) */
				searchStudent(rollValue);
			/* else
				alert("Please enter a roll no."); */
		}
		
		function search()
		{
			var rollValue=document.getElementById('rollno').value;
			if(rollValue)
				searchStudent(rollValue);
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
				alert("Select a user to update or delete");
			}
			else
				updateStudent(selectedUser,"Update");
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
					alert("Select a user to update or delete");
				}
				else
				{
					var confirmDelete = confirm("Are You Sure?");
					if (confirmDelete == true) 
					{
						updateStudent(selectedUser,"Delete");
					}
				}
			}
		
		/*  $("#updateform").on('submit',function(e)
				 {
			 	
					var uname = document.forms["updateform"]["uname"].value;
					var upwd = document.forms["updateform"]["upwd"].value;
					var isactive = document.forms["updateform"]["isactive"].value;
				    var name = document.forms["updateform"]["name"].value;
					var rollno = document.forms["updateform"]["rollno"].value;
					var currentsem = document.forms["updateform"]["currentsem"].value;				
					   
				    if (name==null || name==""){
				        alert("Student Name must be filled out"); return false;}
				    else if (rollno==null || rollno==""){
				        alert("Student Roll No. must be filled out"); return false;}
				    else if (currentsem==null || currentsem==""){
				    	alert("Student current semester must be filled out"); return false;}
				    else if (uname==null || uname==""){
				        alert("Student Login: User Name must be filled out");return false;}
				    else if (upwd==null || upwd==""){
				        alert("Student Login: Password must be filled out");return false;}
				    else if (isactive==null || isactive==""){
				        alert("Student Status must be filled out");return false;}
					    
				     var formData = new FormData(this);
				     $.ajax({
				         url: 'updateStudent',
				     type: 'POST',
				         data:  formData,
				     mimeType:"multipart/form-data",
				     contentType: false,
				         cache: false,
				         processData:false,
				     success: function(data, textStatus, jqXHR)
				     {
				  		//alert('added successfully');
				    	 document.getElementById("studentMaincenter").innerHTML=jqXHR.responseText;
				     },
				      error: function(jqXHR, textStatus, errorThrown) 
				      {
					    	 document.getElementById("studentMaincenter").innerHTML=jqXHR.responseText;
				      }          
				     });
				     e.preventDefault(); //Prevent Default action. 
				     $("#updateform").unbind(e);
				     $("#updateform").submit(); //Submit the form
				     
				 });  */
	 

</script>
