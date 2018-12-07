<%-- 
    Document   : retrieve
    Created on : 8 Nov, 2018, 4:30:16 PM
    Author     : hegde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>See</title>
    </head>
    <body style="background-image:url(6.jpg);background-size:100% 700px; background-repeat:no-repeat; color:blue;">
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
        <%
            try{
            
           
    Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/agri?useSSL=false","root","******");
                ResultSet rs=null;
                Statement statement=null;
                statement=conn.createStatement();
                
                
               String QueryString="SELECT * FROM cropdetails";
                rs=statement.executeQuery(QueryString);
                
                %>
                <br>
                <p align="center"><font size="15" ><b>Crop Details:</b></font></p>
                
                <br>
                <table align="center" cellpadding="15" border="1" bordercolor="blue" cellpaddingcolor="pink" fontsize="10">
                         <tr>
                        <th>Cropid</th>
                        <th>Cropname</th>
                        <th>quantity</th>
                        <th>rate</th>
                    </tr>
               
                
                
                
                
                
               
<%
while (rs.next()) {
    %>
  
    <tr>
                        <td><%=rs.getInt(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        
                  
                    
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
