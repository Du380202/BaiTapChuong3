<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    h1, h2 {
        text-align: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    th, td {
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #ddd;
    }
</style>
</head>
<body>
    <h1>Order Details</h1>
    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Customer Name</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Order Date</th>
            <th>Total Amount</th>
            <th>Method Payment</th>
        </tr>
        <tr>
            <td>${order.maOrder}</td>
            <td>${order.hoTen}</td>
            <td>${order.sdt}</td>
            <td>${order.diaChi}</td>
            <td>${order.date}</td>
            <td>${order.tongTien}</td>
            <td>${order.method}</td>
        </tr>
    </table>

    <h2>Order Items</h2>
    <table border="1">
        <tr>
            <th>Item Name</th>
            <th>Quantity</th>
            <th>Unit Price</th>
            <th>Total Price</th>
        </tr>
        <c:forEach items="${orderDetails}" var="item">
            <tr>
                <td>${item.tenSach}</td>
                <td>${item.soLuong}</td>
                <td>${item.giaBan}</td>
                <td>${item.tongTien}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
