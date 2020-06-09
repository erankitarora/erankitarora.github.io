 <%@page import="org.iiitb.sis.util.ConnectionPool"%>
 <%@page import="org.iiitb.sis.util.Constants"%>
 <%@page import="java.sql.*"%>
<div class="container-fluid">
   <div class="row">
     <div class="col-md-2 sidebar-right">
	   <ul class="nav nav-sidebar">
         <li class="active"><a href="#"> Announcements<span class="sr-only">(current)</span></a></li>	
         <% 
         	Connection con=ConnectionPool.getConnection();
         	PreparedStatement ps=con.prepareStatement(Constants.GET_ANNOUNCEMENTS);
         	//ps.setInt(1,Integer.parseInt(session.getAttribute("userid").toString()));
         	ResultSet rs=ps.executeQuery();
         	//System.out.println("inside jsp:"+Integer.parseInt(session.getAttribute("userid").toString()));
         	while(rs.next())
         	{//System.out.println("inside jsp:"+rs.getString(1)+"2nd:"+ rs.getString(2)+"3rd:" + rs.getString(2));
         	%>
         		<li><a id="<%=rs.getString(1) %>"  onclick="showsingleannouncement(<%=rs.getString(1)%>,'<%= rs.getString(2)%>')"><%= rs.getString(2)%></a></li>
         	<%}
	       	//ConnectionPool.freeConnection(con);
         	%>
      </ul>      
  	</div>
  </div>
  <div class="row">
     <div class="col-md-2 sidebar-right-down">
	   <ul class="nav nav-sidebar">
	   
         <li class="active"><a href="#">News<span class="sr-only">(current)</span></a></li>	
        
        <!-- <marquee behavior="scroll" direction="up" onmouseover="this.setAttribute('scrollamount', 1, 0);" onmouseout="this.setAttribute('scrollamount', 10, 0);"> -->

        
        
        
        
        
        
         <% 
         	 //con=ConnectionPool.getConnection();
         if(Integer.parseInt(session.getAttribute("userid").toString())==1)
         {
        	PreparedStatement ps1=con.prepareStatement("select news_id,news_title from news_interest");
          
          	ResultSet rs1=ps1.executeQuery();
          	//System.out.println("inside jsp:"+Integer.parseInt(session.getAttribute("userid").toString()));
          	while(rs1.next())
          	{//System.out.println("inside jsp:"+rs1.getString(1)+"2nd:"+ rs1.getString(2)+"3rd:" + rs1.getString(2));
          	%>
          		<li><a id="<%=rs1.getInt(1) %>"  onclick="showsinglenews(<%=rs1.getInt(1)%>,'<%= rs1.getString(2)%>')"><h5><%= rs1.getString(2)%></h5></a></li>
               
          	<%}
         }
         else
         {
         	PreparedStatement ps1=con.prepareStatement(Constants.GET_NEWS);
         	ps1.setInt(1,Integer.parseInt(session.getAttribute("userid").toString()));
         	ResultSet rs1=ps1.executeQuery();
         	
         	//System.out.println("inside jsp:"+Integer.parseInt(session.getAttribute("userid").toString()));
         	while(rs1.next())
         	{//System.out.println("inside jsp:"+rs1.getString(1)+"2nd:"+ rs1.getString(2)+"3rd:" + rs1.getString(2));
         	%>
         		<li><a id="<%=rs1.getInt(1) %>"  onclick="showsinglenews(<%=rs1.getInt(1)%>,'<%= rs1.getString(2)%>')"><%= rs1.getString(2)%></a></li>
         		
         	<%}
         }
	       	ConnectionPool.freeConnection(con);
          
         	%>
       <!-- </marquee> -->
 	<!-- </marquee> -->
      </ul>      
  	</div>
  </div>
 </div>
