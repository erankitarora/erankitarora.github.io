<script>

function ajaxSem(semname)
{
	//alert(semname);
	
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
		    document.getElementById("showCourse").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
xmlhttp.open("POST","ShowSem?semname="+semname,true);
	xmlhttp.send();
	return true;
	// event.preventDefault();
	//event.preventDefault();
}

function ajaxCourses(cname)
{
	//alert("im here1");
	
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
	xmlhttp.open("POST","showCourses1?cname="+cname,true);
	xmlhttp.send();
	return true;
	// event.preventDefault();
	//event.preventDefault();
}

function searchEnrollment(cname)
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
		    document.getElementById("enrollmentMaincenter").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
	
	xmlhttp.open("POST","listEnrollments?cname="+cname,true);
	xmlhttp.send();
	// event.preventDefault();
	//event.preventDefault();
}

function updateEnrollment(selecteduser,input_type)
{
	//alert("im here");
	if (selecteduser.length==0) {
    document.getElementById("enrollmentMaincenter").innerHTML="";
    return;
  }
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
		    document.getElementById("enrollmentMaincenter").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
	//alert(selecteduser);
	var splitted=selecteduser.split(",");
	var sname=splitted[0];
	var cname=splitted[1];
	//alert(sname);
	//alert(cname);
	xmlhttp.open("POST","searchEnrollment?cname="+cname+"&sname="+sname+"&input_type="+input_type,true);
	xmlhttp.send();
	return true;
	// event.preventDefault();
	//event.preventDefault();
}
</script>