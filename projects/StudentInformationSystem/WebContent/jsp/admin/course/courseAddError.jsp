
<script type="text/javascript">
function validateForm() {
    var x = document.forms["courseForm"]["courseId"].value;
    var y = document.forms["courseForm"]["courseName"].value;
    var z = document.forms["courseForm"]["courseCredit"].value;
    var w = document.forms["courseForm"]["courseSyllabus"].value;
    if (x==null || x=="") {
        alert("Course Name can't be Empty");
        return false;
    }
    if (y==null || y=="") {
        alert("Course Id can't be Empty");
        return false;
    }
    if (z==null || z=="") {
        alert("Course Credits can't be Empty");
        return false;
    }
    if (w==null || w=="") {
        alert("Course Syllabus can't be Empty");
        return false;
    }
    return true;
   	
}
function check()
{
	document.forms[0].action = 'courseAdd.jsp';
	return true;
}
</script>

<style type="text/css">
    
    
</style>


<div class="panel panel-primary" >
	
	<div class="panel-heading"align="center">
		<div class="panel-heading" style="font-size:30px"><b>Course Already Exists!!  </b></div><br/>
	</div>
	<br><br>
			<form name="myForm">
	<div class="row">

		<div class="col-lg-2" align="right"> <button onclick="return(check())" value="submit" class="btn btn-primary">BACK</button></div>
		</div>
		</form>
 </div>

