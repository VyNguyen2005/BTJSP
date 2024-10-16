<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="common.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lập trình CSDL với JSP</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="container mt-5">
        <div class="text-center mb-4">
            <h3 class="px-3">TRA CỨU ĐIỂM</h3>
        </div>
        <form action="tracuudiem.jsp" method="POST" class="text-center pb-3">
            <label class="font-weight-bold">Số báo danh</label>
            <input style="width: 300px" type="text" name="sobaodanh" autofocus autocomplete="off" placeholder="Nhập số báo danh"/>
            <label class="font-weight-bold">Họ tên</label>
            <input style="width: 300px" type="text" name="hoten" autocomplete="off" placeholder="Nhập họ tên"/>
            <button type="submit" class="btn btn-warning text-white">
                <i class="fa-solid fa-magnifying-glass"></i>
                Tra cứu
            </button>
        </form>
        <%
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String sobd = request.getParameter("sobaodanh");
            String hoten = request.getParameter("hoten");
            Connection connection = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                connection = DatabaseUtil.getConnection();
                if (sobd != null && !sobd.trim().isEmpty()) {
                    ps = connection.prepareStatement("select * from thisinh where sobd=?");
                    ps.setString(1, sobd);
                } else if (hoten != null && !hoten.trim().isEmpty()) {
                    ps = connection.prepareStatement("select * from thisinh where hoten like ?");
                    ps.setString(1, "%" + hoten + "%");
                }

                if (ps != null) {
                    rs = ps.executeQuery();
        %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">Mã thí sinh</th>
                    <th scope="col">Họ tên</th>
                    <th scope="col">Địa chỉ</th>
                    <th scope="col">Điểm toán</th>
                    <th scope="col">Điểm lý</th>
                    <th scope="col">Điểm hóa</th>
                    <th scope="col">Tổng điểm</th>
                </tr>
            </thead> 
            <tbody>
                <% while (rs.next()) {
                    double tongdiem = rs.getFloat(4) + rs.getFloat(5) + rs.getFloat(6);
                %>
                <tr>
                    <td scope="row"><%= rs.getString(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getFloat(4) %></td>
                    <td><%= rs.getFloat(5) %></td>
                    <td><%= rs.getFloat(6) %></td>
                    <td><%= tongdiem %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <%
                }
            } catch (Exception e) {
                out.println("Lỗi: " + e.getMessage());
            } 
        %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
