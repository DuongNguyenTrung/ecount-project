package com.fpt.ecount_swp391.controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.fpt.ecount_swp391.dao.impl.UserDAOimpl;
import com.fpt.ecount_swp391.model.User;
import com.fpt.ecount_swp391.util.ServletHelper;
import com.fpt.ecount_swp391.util.VerifyRecaptcha;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

public class SignupController extends HttpServlet {

    private UserDAOimpl dao = new UserDAOimpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletHelper.forward(request, response, "signup.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String gRecaptchaResponse = request
                .getParameter("g-recaptcha-response");
        System.out.println(gRecaptchaResponse);
        boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
        if (!verify) {
            request.setAttribute("error", "Wrong captcha!");
            ServletHelper.forward(request, response, "signup.jsp");
            return;
        }

        String user = request.getParameter("user");
        String pwd = request.getParameter("pwd");
        String email = request.getParameter("email");

        User u = new User();
        u.setUsername(user);
        String salt = BCrypt.gensalt(12);

        u.setUsername(user);
        u.setPassword(pwd);
        u.setRole(1);
        u.setEmail(email);
        u.setStatus(true);

        if (dao.register(u)) {
            response.sendRedirect("login");
            return;
        }
        request.setAttribute("err", "Cannot sign up!!");
        ServletHelper.forward(request, response, "signup.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
