<%--
  Created by IntelliJ IDEA.
  User: karen
  Date: 17.11.24
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>

<span>
    <%
        if (session.getAttribute("msg") != null) { %>
        <h3><%=request.getAttribute("msg")%></h3>
   <%
           session.removeAttribute("msg");
       }
   %>
</span>
<form action="/register" method="post">

    name: <input type="text" name="name"><br>
    surname: <input type="text" name="surname"><br>
    email: <input type="text" name="email"><br>
    password: <input type="password" name="password"><br>
    user type:
    <select name="user_type">
        <option value="USER">User</option>
        <option value="ADMIN">Admin</option>
    </select><br>
    <input type="submit" value="Register">

</form>

</body>
</html>
