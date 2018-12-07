<%-- 
    Document   : home1
    Created on : 8 Nov, 2018, 3:23:12 PM
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
             String warehouseid=request.getParameter("warehouseid");
            String warehousename=request.getParameter("warehousename");
           
             String capacity=request.getParameter("capacity");
              String storage=request.getParameter("storage");
            String soilid=request.getParameter("soilid");
             String date=request.getParameter("date");
             String report=request.getParameter("report");
            
             
             
             
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/agri?useSSL=false","root","********");
             
              CallableStatement calstat3=con.prepareCall("{CALL warehousedetails(?,?,?,?)}");
                   calstat3.setString(1,warehouseid);
                 calstat3.setString(2,warehousename);
                 
                 calstat3.setString(3,capacity);
                 
                  calstat3.setString(4,storage);
                  
                   
                 
                  CallableStatement calstat4=con.prepareCall("{CALL soiltest(?,?,?)}");
                   calstat4.setString(1,soilid);
                 calstat4.setString(2,date);
                 
                 calstat4.setString(3,report);
                 


            
                      ResultSet rs3=calstat3.executeQuery();
                      ResultSet rs4=calstat4.executeQuery();
                       calstat3.close();
                 calstat4.close();
                 
                         out.println("your data has been inserted into table");
                         response.sendRedirect("tips.html");
                         
                       
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            %>
    </body>
</html>
