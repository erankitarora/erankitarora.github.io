<%@page import="org.apache.catalina.connector.Response"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.iiitb.sis.login.*"%>
<%@ page import="org.iiitb.sis.util.ConnectionPool"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.apache.struts2.ServletActionContext"%>

<%! Connection conn;
		PreparedStatement ps;
		int userid1,userid2;
		String username;
		int sidloggedin;
		
	%>
	<%-- <%sidloggedin=Integer.parseInt(response.getHeader("sid")); %> --%>
	<%sidloggedin=Integer.parseInt(session.getAttribute("userid").toString());%>
	
	
<div class="panel panel-primary">

	<!-- Screen heading -->
	<div class="panel-heading" align="center">
		<h3>My requests</h3>
	</div>
	<div class="panel-body" align="center">
	<table class="table table-bordered">
				<thead>
						<tr>
							<td><b>People Name</b></td>
							<td><b>Friend Accept </b></td>
							<td><b>Friend Reject</b></td>
				<tbody>			
				</thead>
	
<%
		
        conn=ConnectionPool.getConnection();
		ps=conn.prepareStatement("select sid,sid1 from friends where sid1=? and status=0");
		ps.setInt(1,sidloggedin);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			userid1=rs.getInt("sid");
			userid2=rs.getInt("sid1");
			
			    
				ps=conn.prepareStatement("select uname from user where userid=" + userid1);
				ResultSet rs1=ps.executeQuery();
				if(rs1.next())
				{
					username=rs1.getString("uname");
				}
				%>
				
				<%-- <tr><td>loged in <%=userid2%></td>
				<td>frnd request<%=userid1%></td></tr> --%>
		        	
			
			<tr><td><%=username%></td>
			<td><input type="button" id="<%=userid1%>" class="btn btn-primary" value="accept" onclick="addfriendconfirm(this.id)"></td>
			<td><input type="button" id="<%=userid1%>" class="btn btn-primary" value="reject" onclick="addfriendreject(this.id)"></td>  </tr>	
				
				
				
				
				<% 

			
		}
		
		
		ConnectionPool.freeConnection(conn);
	%>
	</tbody>
	</table>
	
	</div>
</div>
<script type="text/javascript">
		function addfriendconfirm(clicked_id)
	{   
		var userid = clicked_id;
	
		
		addconfirm(userid);
		
	}
		function addfriendreject(clicked_id)
		{   
			var userid = clicked_id;
		
			//alert(userid);
			addreject(userid);
			
		}
		
</script>