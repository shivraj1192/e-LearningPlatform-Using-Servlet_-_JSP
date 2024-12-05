package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.bean.LoginBean;
import com.dao.LoginDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        LoginDao ld = new LoginDao();
        LoginBean lBean = new LoginBean();
        
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        
        lBean.setUserName(userName);
        lBean.setPassword(password);
        
        try {
            if(ld.login(lBean)) {
                // Create session and store username
                HttpSession session = request.getSession(true);
                session.setAttribute("username", userName);
                
                // Debug print
                String user = ld.recog(lBean);
                System.out.println("Login successful for user: " + userName);
                
                // Redirect with success message
                session.setAttribute("recogUser", user);
                
                response.sendRedirect("./index.jsp?loginSuccess=true");
            } else {
                HttpSession session = request.getSession(false);
                if(session != null) {
                    session.invalidate();
                }
                RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
                PrintWriter out = response.getWriter();
                out.print("<h1>Invalid username or password</h1>");
                rd.include(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            HttpSession session = request.getSession(false);
            if(session != null) {
                session.invalidate();
            }
            response.sendRedirect("./login.jsp");
        }
    }
}
