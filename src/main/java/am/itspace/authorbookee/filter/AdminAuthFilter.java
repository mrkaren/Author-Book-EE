package am.itspace.authorbookee.filter;

import am.itspace.authorbookee.model.User;
import am.itspace.authorbookee.model.UserType;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"/addAuthor", "/addBook", "/deleteAuthor", "/editAuthor"})
public class AdminAuthFilter implements Filter {


    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        User user = (User) req.getSession().getAttribute("user");
        if (user != null && user.getUserType() == UserType.ADMIN) {
            filterChain.doFilter(req, servletResponse);
        } else {
            ((HttpServletResponse) servletResponse).sendRedirect("/");
        }
    }

}
