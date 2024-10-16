<%-- 
    Document   : Bai01
    Created on : Oct 15, 2024, 2:17:32 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bài tập 01</title>
    </head>
    <body>
        <h1 style="font-weight: 500">Chương trình đầu tiên</h1>
        <form action="Bai01.jsp" method="POST">
            <label>Hãy nhập họ tên</label>
            <input type="text" name="hoten"/>
            <input type="submit" value="Thi hành"/><hr>
        </form>
        <%
            String hoten = request.getParameter("hoten");
            if(hoten != null){
        %>
        Chào bạn "<%= hoten%>"
        <% }%>
    </body>
</html>
