
<script type="text/javascript">


// java script validation

</script>


<div class="panel panel-primary" >
	
	<div class="panel-heading"align="center">
		
		<div class="panel-heading" style="font-size: 20px"><b>Course Deleted Successfully!!  </b></div><br/>
	</div>

    <br/><br/>
    <form name="myForm" class="form-horizontal"  method="post"  onsubmit="return(validate());" enctype="multipart/form-data">
  		
  		<div class="row" >
    		<div class="col-lg-4" align="right">	<label  for="ccode"><b>Course Code</b><font color="red">*</font></label></div>
       		 <div class="col-lg-4"> <input  type="text" class="form-control" name="ccode" placeholder="Not Available"></div>
  		</div>
  		<br/>
  		<div class="row">
  			<div class="col-lg-4" align="right"><label  for="courseName"><b>Course Name</b><font color="red">*</font></label></div>
            <div class="col-lg-4" ><input type="text" class="form-control" name="courseName" placeholder="Not Available"></div>
  		</div>
  		<br/>
  		<div class="row" >
    		<div class="col-lg-4" align="right">	<label  for="credits"><b>Credits</b><font color="red">*</font></label></div>
       		 <div class="col-lg-4"> <input  type="text" class="form-control" name="courseCredits" placeholder="Not Available"></div>
  			
        </div>
        <br/>
  	<div class="row">
		<div class="col-lg-4" align="right">	<label for="syllabus"><b>Syllabus</b><font color="red">*</font></label></div>
        <div class="col-lg-4" ><textarea   class="form-control"  name="courseSyllabus" placeholder="Not Available"></textarea></div>
	</div>	
	<br/>	
	<div class="row">
		<div class="col-lg-3"></div>	
		<div class="col-lg-2">	<input class="home" align="right" type="radio" name="isactive" value='1'  />&nbsp;&nbsp;Active</div>
		<div class="col-lg-2">	<input class="home" type="radio" name="isactive" value='0'  />&nbsp;&nbsp;Inactive<br /></div>
	</div>
		
		<br/><br/>
		
</form>


 </div>
