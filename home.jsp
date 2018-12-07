<%-- 
    Document   : home
    Created on : 6 Nov, 2018, 12:05:39 AM
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
           
            String cropid=request.getParameter("cropid");
            String cropname=request.getParameter("cropname");
            String quantity=request.getParameter("quantity");
            String rate=request.getParameter("rate");
            String seedid=request.getParameter("seedid");
            String seedname=request.getParameter("seedname");
            String seedrate=request.getParameter("seedrate");
             String fertilizerid=request.getParameter("fertilizerid");
              String fertilizername=request.getParameter("fertilizername");
            String fertilizerrate=request.getParameter("fertilizerrate");
            
            String crop_id=request.getParameter("crop_id");
            
             
             
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agri?useSSL=false","root","*******");
             
             
            
                
             CallableStatement calstat=con.prepareCall("{CALL cropdetails(?,?,?,?)}");
                 calstat.setString(1,cropid);
                 calstat.setString(2,cropname);
                 
                 calstat.setString(3,quantity);
                 calstat.setString(4,rate);
              CallableStatement calstat1=con.prepareCall("{CALL seeddetails(?,?,?)}");
                 calstat1.setString(1,seedid);
                 calstat1.setString(2,seedname);
                  calstat1.setString(3,seedrate);
                  
                  CallableStatement calstat2=con.prepareCall("{CALL fertilizerdetails(?,?,?,?,?)}");
                   calstat2.setString(1,fertilizerid);
                 calstat2.setString(2,fertilizername);
                 
                 calstat2.setString(3,fertilizerrate);
                 calstat2.setString(4,quantity);
                  calstat2.setString(5,crop_id);
                                                       
                              
                  ResultSet rs=calstat.executeQuery();
                  ResultSet rs1=calstat1.executeQuery();
                   ResultSet rs2=calstat2.executeQuery();
                    
                 
                 
                 con.close();
                 calstat.close();
                 calstat1.close();
                 calstat2.close();
            
                 
                         out.println("your data has been inserted into table");
                         response.sendRedirect("home1.html");
                         
                 
             
             
             

             %>

    </body>
</html>
