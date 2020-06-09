<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div id="regcoursepanel" class="panel panel-primary">
    <div class="panel-heading">
        <h4 align="center">My Courses</h4>
    </div>
	<div class="panel-body" align="center">
		<div class="col-lg-12">
			<%
				if(Integer.parseInt(response.getHeader("ccount").toString())!=0)
				{%>
			<div class="col-lg-12">
				<table class="table table-striped table-bordered table-hover table-responsive" style="width:600px">
					<thead >
						<tr>
							<th class="col-lg-2">Semester</th>
							<th class="col-lg-3">Course Code </th>
							<th class="col-lg-5">Course Name</th>
							<th class="col-lg-2">Credits</th>
						</tr>
					</thead>
						<c:forEach items="${gr}" var="user">
							<tr>
								<td> ${user.getSemname()}</td>
								<td>${user.getCcode()}</td>
								<td> ${user.getCname()}</td>
								<td>${user.getCredits()}</td>
							</tr>
						</c:forEach>
				</table>
		   	</div>
			<input type="button" onclick="loaddescriptionpage()" class="col-lg-12 form-control btn-primary" style="width:10%;float:center" value="Back">
		   
			<% }
				else
				{%>
						<b>No Courses Assigned for you... Kindly Contact Admin</b>
				<%}
			%>	
		 </div>
	</div>
</div>
