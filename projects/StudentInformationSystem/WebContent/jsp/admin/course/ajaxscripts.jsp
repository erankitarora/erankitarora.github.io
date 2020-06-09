<script>
function showCourses(ccode)
{
	
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
		    document.getElementById("coursemaincenter").innerHTML=xmlhttp.responseText;
	    }
	  }
			xmlhttp.open("POST","./courseSearchList?ccode="+ccode,true);
			xmlhttp.send();
}
function updateCourses(ccode)
{
	//alert("im here");
	/* if (ccode.length==0) {
    document.getElementById("coursemaincenter").innerHTML="";
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
		    document.getElementById("coursemaincenter").innerHTML=xmlhttp.responseText;
		    //event.preventDefault();
		   
	    }
	  }
	xmlhttp.open("POST","courseSearchAction?ccode="+ccode,true);
	xmlhttp.send();
	// event.preventDefault();
	//event.preventDefault();
}

</script>