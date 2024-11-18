<%@ page import="am.itspace.authorbookee.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>
    Author Book Application
</h1>

<% User user = (User) session.getAttribute("user"); %>
<%if (user != null) { %>
<span>Բարի գալուստ <%=user.getName() + " " + user.getSurname()%></span> <a href="/logout">logout</a>
<%} else { %>
<a href="/login">Login</a> <br>
<a href="/register">Register</a>

<%}%>

<br/>
<a href="/books">View All Books</a>
<a href="/authors">View All Authors</a>
</body>
</html>
