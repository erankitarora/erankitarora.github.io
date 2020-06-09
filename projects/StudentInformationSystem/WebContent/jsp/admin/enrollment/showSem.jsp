<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<select class="form-control"  name="cname" placeholder="Student Name" onchange="ajaxCourses(this.value)" id="cname" required>
	<option value="default" selected>Select below</option>
	<c:forEach items="${cname}" var="name">
        <option value="${name}">${name}</option>
    </c:forEach>
		
</select>