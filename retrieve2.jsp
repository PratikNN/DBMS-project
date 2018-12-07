<%-- 
    Document   : retrieve2
    Created on : 12 Nov, 2018, 9:49:52 PM
    Author     : hegde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <body style="background-image:url(6.jpg);background-size:100% 700px; background-repeat:no-repeat; color:blue;">
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
        <%
            try{
            
           
    Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/agri?useSSL=false","root","*********");
                ResultSet rs=null;
                Statement statement=null;
                statement=conn.createStatement();
                
                
               String QueryString="SELECT * FROM fertilizerdetails";
                rs=statement.executeQuery(QueryString);
                
                %>
                <br><br><br>
                <p align="center"><font size="15" ><b>Fertilizer Details:</b></font></p>
                
                <br>
                <table align="center" cellpadding="15" border="1" bordercolor="blue" cellpaddingcolor="pink" fontsize="10">
                         <tr>
                        <th>Fertilizer id</th>
                        <th>Fertilizer name</th>
                        <th>Fertilizer rate</th>
                        <th>quantity</th>
                        <th>Crop id</th>
                        
                    </tr>
               
                
                
                
                
                
               
<%
while (rs.next()) {
    %>
  
    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getInt(5)%></td>
                        
                  
                    
    </tr>
    <%
    }
     %>



 <% 

rs.close();
statement.close();
conn.close();
}
 catch(Exception ex)
{
%>
<font size="3" color="red"><b></b></font>
<%
   out.println("Unable to connect to database.");
}
%>
                </table>

           
    </body>
</html>
