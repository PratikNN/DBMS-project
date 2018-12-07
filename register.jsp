<%-- 
    Document   : register
    Created on : 4 Nov, 2018, 6:45:36 PM
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
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
        <%
           
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String phoneno=request.getParameter("phoneno");
            String address=request.getParameter("address");
            String email=request.getParameter("email");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
             String _type=request.getParameter("type");
             
             
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agri?useSSL=false","root","********");
             
             if(_type.equals("admin"))
             {
                 CallableStatement calstat=con.prepareCall("{CALL register(?,?,?,?,?,?,?,?)}");
                 calstat.setString(1,firstname);
                 calstat.setString(2,lastname);
                 calstat.setString(3,phoneno);
                 calstat.setString(4,address);
                 calstat.setString(5,email);
                 calstat.setString(6,username);
                 calstat.setString(7,password);
                  calstat.setString(8,_type);
                 
                 ResultSet rs=calstat.executeQuery();
                 con.close();
                         calstat.close();
                         out.println("your data has been inserted into table");
                         response.sendRedirect("login.html");
                         
                 
             }
              if(_type.equals("user"))
             {
                 CallableStatement calstat=con.prepareCall("{CALL register(?,?,?,?,?,?,?,?)}");
                 calstat.setString(1,firstname);
                 calstat.setString(2,lastname);
                 calstat.setString(3,phoneno);
                 calstat.setString(4,address);
                 calstat.setString(5,email);
                 calstat.setString(6,username);
                 calstat.setString(7,password);
                  calstat.setString(8,_type);
                 
                 ResultSet rs=calstat.executeQuery();
                 con.close();
                         calstat.close();
                         out.println("your data has been inserted into table");
                         response.sendRedirect("login.html");
             }
             

             %>

    </body>
</html>
