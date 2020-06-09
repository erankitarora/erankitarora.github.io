<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div id="coursepanel" class="panel panel-primary">
    <div class="panel-heading">
        <h4 align="center">My Grades</h4>
    </div>
	<div class="panel-body" align="center">
		<div class="col-lg-12">
			<%
				if(Integer.parseInt(response.getHeader("gcount").toString())!=0)
				{%>
			<div class="col-lg-12">
				<table class="table table-striped table-bordered table-hover table-responsive" style="width:600px">
					<thead >
						<tr>
							<th class="col-lg-1">Semester</th>
							<th class="col-lg-6">Course Name </th>
							<th class="col-lg-5">Grade</th>
							<th class="col-lg-5">Weightage</th>
							<th class="col-lg-5">Pass/Fail</th>
						</tr>
					</thead>
						<c:forEach items="${gr}" var="user">
							<tr>
								<td> ${user.getSemname()}</td>
								<td>${user.getCname()}</td>
								<td> ${user.getGname()}</td>
								<td>${user.getWeightage()}</td>
								<td>${user.getPassorfail()}</td>
							</tr>
						</c:forEach>
				</table>
		   	</div>
		   	<label class="control-label">Total Grade:</label><%=response.getHeader("avggrd") %>
			<input type="button" onclick="loaddescriptionpage()" class="col-lg-12 form-control btn-primary" style="width:10%;float:center" value="Back">
		   
			<% }
				else
				{%>
						<b>No Enrollments found for you... Kindly Contact Admin</b>
				<%}
			%>	
		 </div>
	</div>
</div>
