<%@ page import="am.itspace.authorbookee.model.Book" %>
<%@ page import="java.util.List" %>
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
        <th>image</th>
        <th>title</th>
        <th>price</th>
        <th>qty</th>
        <th>author name</th>
    </tr>
    <% for (Book book : books) { %>
    <tr>
        <td><%=book.getId()%>
        </td>
        <td>
            <%if (book.getImageName() != null && !book.getImageName().isEmpty()) {%>
            <img src="/getImage?imageName=<%=book.getImageName()%>" width="100">
            <%} else { %>
            <span>no image</span>
            <% }%>
        </td>
        <td><%=book.getTitle()%>
        </td>
        <td><%=book.getPrice()%>
        </td>
        <td><%=book.getQty()%>
        </td>
        <td><%=book.getAuthor().getName()%>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>
