
<%@ taglib prefix="s" uri="/struts-tags" %> 

<script type="text/javascript">

// Form validation code will come here.
/* $("#myForm2").on('submit',function(e)
		 {
				alert("dfgjnkf");
		     	var formData = new FormData(this);
		     	$.ajax({
		         url: 'updelAction',
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
		     	$(this).unbind(e);
		     	$("#myForm2").submit(); //Submit the form
		 }); 
 */
</script>

<style type="text/css">
    
    .hide{
    	display: NONE;
    }
   
         
         
    
</style>


	<div class="panel panel-primary" >
	
		

    	<br/><br/>
	 	  <form name="myForm2course" id="myForm2course" class="form-horizontal"  method="post"  enctype="multipart/form-data">
		  	
		  	<div class="row" >
		    	<div class="hide" align="right">	<label  for="cid"><b>Course id</b></label></div>
		       	<div class="hide">	<input type="text"  class="form-control" value="${object[0].getCourseId()}"  name="courseId" id="courseId" required ></div>
		    </div>
		  	<div class="row" >
		    	<div class="col-lg-4" align="right">	<label  for="ccode"><b>Course Code</b><font color="red">*</font></label></div>
		       	<div class="col-lg-4">	<input type="text" class="form-control" value="${object[0].getCcode()}"  name="ccode" required ></div>
		       	<div class="col-lg-4"></div>
		  	</div>
		  			<br/>
		  	<div class="row">
		  		<div class="col-lg-4" align="right"><label  for="courseName"><b>Course Name</b><font color="red">*</font></label></div>
		        <div class="col-lg-4" ><input type="text" class="form-control" name="courseName" value="${object[0].getCourseName()}" required/></div>
				<div class="col-lg-4"></div>  		
		  	</div>
		  			<br/>
		  	<div class="row" >
		    	<div class="col-lg-4" align="right">	<label  for="credits"><b>Credits</b><font color="red">*</font></label></div>
		       	<div class="col-lg-4"> <input type="text" class="form-control" name="courseCredits" value="${object[0].getCourseCredits()}" required/></div>
		  		<div class="col-lg-4"></div>
		    </div>
		        <br/>
		       <div class="row">						
								<!-- 1st column of 0th row -->
								<div class="col-lg-4" align="right">
									<b>Semester:</b>
								</div>
								
								<div class="col-lg-4" align="left">
									<s:select name="semname" cssClass="form-control" value="sem" list="semesters" id="semname"/>
								</div>
							</div>
							<br>	
				
			<div class="row">
			<div class="col-lg-4" align="right">	<label for="syllabus"><b>Syllabus</b><font color="red">*</font></label></div>
		        <div class="col-lg-4" ><textarea class="form-control" style ="height: 100px"  name="courseSyllabus" required>${object[0].getCourseSyllabus()}</textarea></div>
		    </div>
			<div class="row">
					<div class="col-lg-4"></div>
					<div class="col-lg-4" >	<s:radio  name="isactive" list="#{'1':'Active','0':'Inactive'}" value="isactive" /></div>
			</div>
						<br/><br/>
			<div class="row">
					<div class="col-lg-4" align="right"> <input  type="button" name="submit" id="submit" value="Update"  class="btn btn-primary" onclick="updatecoursescript(this.form)"></div>
					 
				<div class="col-lg-6" align="center"><input type="button" class="btn btn-primary" onclick="DeleteQuery(this.form.ccode.value)" name="input_type" value="Delete"></div>
			</div>
		</form>
 	</div>
