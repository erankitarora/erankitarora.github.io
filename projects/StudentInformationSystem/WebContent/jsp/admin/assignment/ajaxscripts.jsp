<script>
function ajaxCourses(fname)
{
	//alert("im here");
	
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
			 console.log(xmlhttp.responseText);
		    document.getElementById("show").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
	xmlhttp.open("POST","showCourses?fname="+fname,true);
	xmlhttp.send();
	return true;
	// event.preventDefault();
	//event.preventDefault();
}
function searchAssignment(fname)
{
	//alert("im here");
	//alert("I,m here 1");
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
			 console.log(xmlhttp.responseText);
		    document.getElementById("assignmentMaincenter").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
	
	xmlhttp.open("POST","listAssignments?fname="+fname,true);
	xmlhttp.send();
	// event.preventDefault();
	//event.preventDefault();
}

function updateAssignment(selecteduser,input_type)
{
	//alert("im here");
	/* if (selecteduser.length==0) {
    document.getElementById("assignmentMaincenter").innerHTML="";
    return;
  } */
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
			 console.log(xmlhttp.responseText);
		    document.getElementById("assignmentMaincenter").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
	//alert(selecteduser);
	var splitted=selecteduser.split(",");
	var fname=splitted[0];
	var cname=splitted[1];
	//alert(fname);
	//alert(cname);
	xmlhttp.open("POST","searchAssignment?fname="+fname+"&cname="+cname+"&input_type="+input_type,true);
	xmlhttp.send();
	return true;
	// event.preventDefault();
	//event.preventDefault();
}
</script>