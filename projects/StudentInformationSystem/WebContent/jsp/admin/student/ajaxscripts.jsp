<script>
function updateStudent(rollno,input_type)
{
	//alert("im here");
	/* if (rollno.length==0) {
    document.getElementById("studentMaincenter").innerHTML="";
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
		    document.getElementById("studentMaincenter").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
	xmlhttp.open("POST","searchStudent?rollno="+rollno+"&input_type="+input_type,true);
	xmlhttp.send();
	return true;
	// event.preventDefault();
	//event.preventDefault();
}
function searchStudent(rollno)
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
		    document.getElementById("studentMaincenter").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
	
	xmlhttp.open("POST","listStudents?rollno="+rollno,true);
	xmlhttp.send();
	// event.preventDefault();
	//event.preventDefault();
}
</script>