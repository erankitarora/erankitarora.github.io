<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page import="java.io.OutputStream" %>
<b>Details of Student having interest= ${interest} is below:</b>
<br>
<br>
<table class="table" style="height:100px">
	<tr>
		<td><b>Serial Number</b></td>
		<td><b>Student ID</b></td>
		<td><b>Student Name</b></td>
		<td><b>Photo</b></td>
		<td><b>Semester Number</b></td>
	</tr>
	<c:forEach items="${interestStudent}" var="user">
		<tr>
	 		<td>${user.getSno()}</td>
			<td>${user.getRollno()}</td>
			<td>${user.getName()}</td>
			<td><img width="90px" src="getimage?sid=${user.getSid()}"></td>
			<td>${user.getSem()}</td>
		</tr>
	</c:forEach>
</table>