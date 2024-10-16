<%-- 
    Document   : Bai02
    Created on : Oct 15, 2024, 2:32:18 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bài 02</title>
    </head>
    <body>
        <h1 style="font-weight: 500">Diện tích - Chu vi hình chữ nhật</h1>
        <form action="Bai02.jsp" method="POST">
            <table>
                <tr>
                    <td><label>Hãy nhập chiều dài: </label></td>
                    <td><input type="text" name="chieudai"/></td>
                </tr>
                <tr>
                    <td><label>Hãy nhập chiều rộng:</label></td>
                    <td><input type="text" name="chieurong"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Tính toán"/>
                        <input type="reset" value="Tiếp tục"/>
                    </td>
                </tr>
            </table><hr>
        </form>
        <%
            String chieudai = request.getParameter("chieudai");
            String chieurong = request.getParameter("chieurong");
            if(chieudai != null && chieurong != null){
               double dai = Double.parseDouble(chieudai);
               double rong = Double.parseDouble(chieurong);
               double chuvi = (dai + rong) * 2;
               double dientich = (dai * rong);
        %>
        Diện tích: <%= dientich%><br>
        Chu vi: <%= chuvi%>
        <% }%>
    </body>
</html>
