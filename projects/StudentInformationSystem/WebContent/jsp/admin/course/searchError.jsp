<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	document.forms[0].action = 'courseSearch.jsp';
	return true;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adding a course</title>
<link href="../../../css/bootstrap.min.css" rel="stylesheet" media="screen">
<style type="text/css">
    .span12{
    	margin: 20px;
        text-align:center;
         font-size:30px;
    }
   
         .span2{
    		font-size:20px;
    		margin-top: 10px;
         }
         .span4{
    		font-size:20px;
    		margin-top: 10px;
         }
         .span5{
    		font-size:20px;
    		margin-top: 10px;
         }
         
    
</style>
</head>
<body>


	
	<div class="panel panel-primary" >
	
	<div class="panel-heading"align="center">
		<div class="panel-heading" style="font-size:30px"><b>Course Not Found!!  </b></div><br/>
	</div>
	<br><br>

    <br/><br/>
    <form name="myForm">
	<div class="row">

		<div class="col-lg-2" align="right"> <button onclick="return(check())" value="submit" class="btn btn-primary">BACK</button></div>
		</div>
		</form>
 </div>
</body>
</html>