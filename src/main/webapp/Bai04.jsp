<%-- 
    Document   : Bai04
    Created on : Oct 15, 2024, 3:16:40 PM
    Author     : ADMIN
--%>

<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bài 04</title>
    </head>
    <body>
        <h1 style="font-weight: 500">Đổi ngoại tệ</h1>
        <form action="Bai04.jsp" method="POST">
            <table>
                <tr>
                    <td><label>Cho biết số tiền: </label></td>
                    <td><input type="text" name="sotien" required/></td>
                </tr>
                <tr>
                    <td><label>Chọn loại ngoại tệ: </label></td>
                    <td>
                        <select name="loaingoaite">
                            <option value="USD">USD</option>
                            <option value="GBP">GBP</option>
                            <option value="EUR">EUR</option>
                            <option value="JPY">JPY</option>
                            <option value="AUD">AUD</option>
                        </select>
                    </td>
                </tr>
                <td></td>
                <td><input type="submit" value="Đổi tiền"/>
                    <input type="reset" value="Tiếp tục"/>
                </td>
                </tr>
            </table><hr>
        </form>
        <%
            String sotien = request.getParameter("sotien");
            String loaingoaite = request.getParameter("loaingoaite");
            if (sotien != null && !sotien.isEmpty() && loaingoaite != null) {
                double tien = Double.parseDouble(sotien);
                double tiendoi = 0;
                String errorMessage = null;
                switch (loaingoaite) {
                    case "USD":
                        tiendoi = tien * 21380.00;
                        break;
                    case "GBP":
                        tiendoi = tien * 32622.80;
                        break;
                    case "EUR":
                        tiendoi = tien * 23555.67;
                        break;
                    case "JPY":
                        tiendoi = tien * 17861;
                        break;
                    case "AUD":
                        tiendoi = tien * 16727.44;
                        break;
                    default:
                        errorMessage = "Không tìm thấy loại ngoại tệ";
                        break;
                }
                String formattedTiendoi = String.format("%,.0f", tiendoi);
        %>
        Số tiền đổi được: <%= formattedTiendoi%> đ
        <% }%>
    </body>
</html>
