
<script type="text/javascript">

// java script validation
function DeleteQuery(ccode)
			{
				
					
					//var ccode = document.getElementsByName("ccode").value;
					
					
					
					{
						var confirmDelete = confirm("Are You Sure?");
						if (confirmDelete == true) 
						{
							//alert(ccode);
							deleteCourse(ccode);
						}
					}
				} 


function callsearch()
		{
			var ccode=document.getElementById('ccode').value;
			if(ccode)
				showCourses(ccode);
		}

function Search()
		{
			var ccode=document.getElementById('ccode').value;
			/* if(ccode) */
				showCourses(ccode);
		/* 	else
				alert("Please enter a course code"); */
		}
function SearchQuery()
{
	
	var allRadios = document.getElementsByName("selectedCourse");
	for (var i=0;i<allRadios.length;i++)
	{
		if(allRadios[i].checked)
		{
       		var selectedCourse = allRadios[i].value;
		}
	}
	if(selectedCourse==null)
	{
		alert("Select a Course to View");
	}
	else
		updateCourses(selectedCourse);
}

</script>


<style type="text/css">
  
         .home{
    		font-size:20px;
    		margin-right:270px;
         }
</style>

<%@include file="./ajaxscripts.jsp" %>
<body>
<div class="panel panel-primary">
	<br/><br/>
    <form name="myForm"  >
        <div class="row" align="left">
        	<div class="col-lg-2"></div>
            <div class="col-lg-2"><label for="searchID"><b>Enter Course Code</b></label></div>
            <div class="col-lg-3"><input align="right" type="text" class="form-control" onkeyup="callsearch()" id="ccode" name="ccode"></div>
       </div>
       <br>
        <div class="row">  
        	<div class="col-lg-2"></div>  
        	<div class="col-lg-4"></div>
        	<div class="col-lg-6"><button type="button" onclick="Search()" class="btn btn-primary" value="update"><b>Search</b></button></div>
        </div>	
       
       <br><br> 
    </form>
    
    <form name="myForm2" id="myForm2" class="form-horizontal"  method="post"  enctype="multipart/form-data">
    <div id="coursemaincenter">    
         </div>
     </form>
     
        
    <br>
</div>

</body>
</html>











