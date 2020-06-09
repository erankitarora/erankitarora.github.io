<%@taglib prefix="s" uri="/struts-tags"%>


<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-body" align="center">
			
				<table class="table table-bordered">
				<thead>
						<tr>
							<td><b>Select below:</b></td>
							<td><b>Faculty RollNo.</b></td>
							<td><b>Faculty Name</b></td>
				</thead>
				<tbody>			
							<s:iterator value="list" status="ctr">
							<tr>
								<td><input type="radio" name="rollno1" value="<s:property value="fcode" />"></td>
								<td><s:property value="fcode" /> </td>
	                            <td><s:property value="fname" /></td>
	                            
	                            
           				  </tr>
							


						</s:iterator>
							
				</tbody>
					
           	         			
           		</table>

           	</div>
           	<br>
           	<br>
           	<div class="col-lg-6" align="center"><input type="button" class="btn btn-primary" onclick="UpdateQuery()" name="input_type" value="Update"></div>
           	<div class="col-lg-6" align="center"><input type="button" class="btn btn-primary" onclick="DeleteQuery()" name="input_type" value="Delete"></div>
		</div>
		<script type="text/javascript">
		function validateAndSearch()
	{   
		var rollno=document.getElementById('rollno').value;
	
			searchFaculty(rollno);
		
	}
		
</script>


