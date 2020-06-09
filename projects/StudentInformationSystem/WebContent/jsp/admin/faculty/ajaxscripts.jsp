<script>
function updateFaculty(rollno)
{
	//alert("im here");
	if (rollno.length==0) {
    document.getElementById("maincenter").innerHTML="";
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
		    document.getElementById("maincenter").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
	xmlhttp.open("POST","SearchFaculty?rollno="+rollno,true);
	xmlhttp.send();
	return true;
	// event.preventDefault();
	//event.preventDefault();
}
function updatethevalue(rollno)
{
	//alert("im here");
	if (rollno.length==0) {
    document.getElementById("maincenter").innerHTML="";
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
		    document.getElementById("maincenter").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
	xmlhttp.open("POST","SearchFaculty?rollno="+rollno,true);
	xmlhttp.send();
	return true;
	// event.preventDefault();
	//event.preventDefault();
}
function deleteFaculty(rollno)
{
	//alert("im here");
	if (rollno.length==0) {
    document.getElementById("maincenter").innerHTML="";
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
		    document.getElementById("maincenter").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
	xmlhttp.open("POST","DeleteFaculty?rollno="+rollno,true);
	xmlhttp.send();
	return true;
	// event.preventDefault();
	//event.preventDefault();
}
function searchFaculty(sname)
{
	alert("im here in search");
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
		    document.getElementById("maincenter1").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
	
	xmlhttp.open("POST","searchFacultybyname?sname="+sname,true);
	xmlhttp.send();
	// event.preventDefault();
	//event.preventDefault();
}
</script>