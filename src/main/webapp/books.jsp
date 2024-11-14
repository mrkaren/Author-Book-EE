<%@ page import="am.itspace.authorbookee.model.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: karen
  Date: 10.11.24
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>books</title>
</head>
<body>
<h1>Books</h1>
<% List<Book> books = (List<Book>) request.getAttribute("books");%>

<a href="/addBook">Add Book</a>

<table style="border: 1px solid blue">
    <tr>
        <th>id</th>
        <th>title</th>
        <th>price</th>
        <th>qty</th>
        <th>author name</th>
    </tr>
    <% for (Book book : books) { %>
    <tr>
        <td><%=book.getId()%></td>
        <td><%=book.getTitle()%></td>
        <td><%=book.getPrice()%></td>
        <td><%=book.getQty()%></td>
        <td><%=book.getAuthor().getName()%></td>
    </tr>
    <% } %>
</table>
</body>
</html>
