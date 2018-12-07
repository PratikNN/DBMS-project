<%-- 
    Document   : login
    Created on : 4 Nov, 2018, 7:08:33 PM
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
            String _username=request.getParameter("username");
            String _password=request.getParameter("password");
            String _type=request.getParameter("type");
            if(_username!=null)
            {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/agri?useSSL=false","root","******");
                if(_type.equals("admin"))
                {
                    String Query="select * from data where username=? and password=?";
                    PreparedStatement psm=conn.prepareStatement(Query);
                    psm.setString(1,_username );
                    psm.setString(2,_password);
                    
                    ResultSet rs=psm.executeQuery();
                    if(rs.next())
                        
                    {
                        response.sendRedirect("home.html");
                    }
                    else
                    {
                        out.println("login failed type again");
                    }
                    }
                if(_type.equals("user"))
                {
                    String Query="select * from data where username=? and password=?";
                    PreparedStatement psm=conn.prepareStatement(Query);
                    psm.setString(1,_username );
                    psm.setString(2,_password);
                     
                    ResultSet rs=psm.executeQuery();
                    if(rs.next())
                        
                    {
                        response.sendRedirect("home.html");
                    }
                    else
                    {
                        out.println("Login failed enter the details again");
                    }
                    }
                }
            %>
    </body>
</html>
