<%@ page import="am.itspace.authorbookee.model.Author" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: karen
  Date: 10.11.24
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
</head>
<body>
<% List<Author> authors = (List<Author>) request.getAttribute("authors"); %>
<h1>Add Book</h1>
<a href="/books">Books Page</a> | <a href="index.jsp">Main</a> <br>

<form action="/addBook" method="post" enctype="multipart/form-data">
    title: <input type="text" name="title"><br>
    price: <input type="number" name="price"><br>
    qty: <input type="number" name="qty"><br>
    Author: <select name="author_id">
    <% for (Author author : authors) { %>
    <option value="<%=author.getId()%>"><%=author.getName() + " " + author.getSurname()%>
    </option>
    <% }%>
</select><br>
    <input type="file" name="img">
    <input type="submit" value="ADD">

</form>

</body>
</html>
