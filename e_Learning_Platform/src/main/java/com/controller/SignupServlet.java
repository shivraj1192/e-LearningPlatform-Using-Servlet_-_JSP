package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.bean.SignupBean;
import com.dao.SignupDao;
import com.connect.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public SignupServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            // Test database connection first
            Connection testCon = DBConnect.Connect();
            if (testCon == null) {
                response.sendRedirect("signup.jsp?error=" + URLEncoder.encode("Could not connect to database. Please try again later.", "UTF-8"));
                return;
            }
            testCon.close();
            
            // If connection successful, proceed with signup
            SignupDao sd = new SignupDao();
            SignupBean sBean = new SignupBean();
            
            sBean.setfName(request.getParameter("fname"));
            sBean.setlName(request.getParameter("lname"));
            sBean.setuName(request.getParameter("userName"));
            sBean.setuPwd(request.getParameter("password"));
            sBean.setuEmail(request.getParameter("email"));
            
            boolean success = sd.signup(sBean);
            
            if(success) {
                // Redirect to login page with success message
                response.sendRedirect("login.jsp?message=success");
            } else {
                response.sendRedirect("signup.jsp?error=" + URLEncoder.encode("Signup failed. Please try again.", "UTF-8"));
            }
        } catch (SQLException e) {
            String errorMessage = "Database error occurred. ";
            if (e.getErrorCode() == 1062) {
                errorMessage = "Username or email already exists.";
            } else {
                errorMessage += "Please try again later.";
            }
            response.sendRedirect("signup.jsp?error=" + URLEncoder.encode(errorMessage, "UTF-8"));
        } catch (Exception e) {
            response.sendRedirect("signup.jsp?error=" + URLEncoder.encode("An unexpected error occurred. Please try again later.", "UTF-8"));
        }
    }
}
