package am.itspace.authorbookee.servlet;

import am.itspace.authorbookee.model.User;
import am.itspace.authorbookee.model.UserType;
import am.itspace.authorbookee.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession httpSession = req.getSession();

        StringBuilder msgBuilder = new StringBuilder();
        UserType userType = null;

        try {
            userType = UserType.valueOf(req.getParameter("user_type"));
        } catch (Exception e) {
            msgBuilder.append("user type should be USER or ADMIN");
            msgBuilder.append("<br>");
        }

        if (name == null || name.trim().isEmpty()) {
            msgBuilder.append("Name is required");
            msgBuilder.append("<br>");
        }
        if (surname == null || surname.trim().isEmpty()) {
            msgBuilder.append("Surname is required");
            msgBuilder.append("<br>");
        }
        if (email == null || email.trim().isEmpty()) {
            msgBuilder.append("Email is required");
            msgBuilder.append("<br>");
        }
        if (password == null || password.trim().isEmpty() || password.length() < 6) {
            msgBuilder.append("password is required or password's length less then 6");
            msgBuilder.append("<br>");
        }

        if (!msgBuilder.isEmpty()) {
            httpSession.setAttribute("msg", msgBuilder.toString());
        } else if (userService.getUserByEmail(email) != null) {
            msgBuilder.append("Email already in use");
            msgBuilder.append("<br>");
        } else {
            User user = User.builder()
                    .name(name)
                    .surname(surname)
                    .email(email)
                    .password(password)
                    .userType(userType)
                    .build();
            userService.add(user);
            httpSession.setAttribute("msg", "User successfully registered");
        }
        resp.sendRedirect("/register");

    }
}
