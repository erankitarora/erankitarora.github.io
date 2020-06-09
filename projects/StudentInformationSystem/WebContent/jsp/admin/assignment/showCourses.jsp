<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<select class="form-control" multiple="multiple" name="cname" placeholder="Course Name" id="cname" required>
	
	<c:forEach items="${cname}" var="name">
        <option value="${name}">${name}</option>
    </c:forEach>
		
</select>