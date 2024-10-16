<%-- 
    Document   : Bai03
    Created on : Oct 15, 2024, 3:04:13 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bài 03</title>
    </head>
    <body>
        <h1 style="font-weight: 500">Diện tích - Chu vi hình tròn</h1>
        <form action="Bai03.jsp" method="POST">
            <table>
                <tr>
                    <td><label>Hãy nhập bán kính: </label></td>
                    <td><input type="text" name="bankinh"/></td>
                </tr>
                    <td></td>
                    <td><input type="submit" value="Tính toán"/>
                        <input type="reset" value="Tiếp tục"/>
                    </td>
                </tr>
            </table><hr>
        </form>
        <%
            String bankinh = request.getParameter("bankinh");
            if(bankinh != null){
               double bk = Double.parseDouble(bankinh);
               double chuvi = 2 * Math.PI * bk;
               double dientich = Math.PI * (bk * bk);
        %>
        Diện tích: <%= dientich%><br>
        Chu vi: <%= chuvi%>
        <% }%>
    </body>
</html>
