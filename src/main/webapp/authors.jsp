<%@ page import="am.itspace.authorbookee.model.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="am.itspace.authorbookee.util.DateUtil" %><%--
  Created by IntelliJ IDEA.
  User: karen
  Date: 10.11.24
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        Authors
    </title>
</head>
<body>
<h2>Authors:</h2> <a href="/addAuthor">Add Author</a>

<% List<Author> authors = (List<Author>) request.getAttribute("authors"); %>

<table border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>phone</th>
        <th>dob</th>
        <th>gender</th>
        <th>action</th>
    </tr>

<% for (Author author : authors) { %>
  <tr>
      <td><%= author.getId() %></td>
      <td><%= author.getName() %></td>
      <td><%= author.getSurname() %></td>
      <td><%= author.getPhone() %></td>
      <td><%= DateUtil.fromDateToString(author.getDateOfBirthday()) %></td>
      <td><%= author.getGender().name() %></td>
      <td><a href="/deleteAuthor?id=<%= author.getId() %>">Delete</a> / <a href="/editAuthor?id=<%= author.getId() %>">Edit</a> </td>
  </tr>
<% } %>
</table>
</body>
</html>
