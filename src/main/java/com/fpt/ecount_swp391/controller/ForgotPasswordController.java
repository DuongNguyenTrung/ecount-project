/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fpt.ecount_swp391.controller;

import com.fpt.ecount_swp391.dao.impl.UserDAOimpl;
import com.fpt.ecount_swp391.dto.UserDto;
import com.fpt.ecount_swp391.model.User;
import com.fpt.ecount_swp391.util.DateHelper;
import com.fpt.ecount_swp391.util.MailHelper;
import com.fpt.ecount_swp391.util.ServletHelper;
import com.fpt.ecount_swp391.util.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ForgotPasswordController extends HttpServlet {

    private UserDAOimpl dao = new UserDAOimpl();
    private static final int EXPIRED_MINITUES = 5;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletHelper.forward(request, response, "forgotPwd.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String username = request.getParameter("username");

            User u = dao.getUserByUsername(username);
            if (u == null) {
                request.setAttribute("msg", "Username not exist !");
                ServletHelper.forward(request, response, "forgotPwd.jsp");
                return;
            }
            String email = u.getEmail();
            Date expired = DateHelper.addMinutes(new Date(), EXPIRED_MINITUES);
            String verifyToken = Utils.genPwd(6) + "." + expired.getTime();
            dao.setVerifyToken(username, verifyToken);
            MailHelper.sendMail(email, "Verify Token", "Click this link to reset password: http://localhost:8080/ecount_swp391/reset?username=" + username + "&verify=" + verifyToken);
            request.setAttribute("msg", "Email sent !");
            ServletHelper.forward(request, response, "forgotPwd.jsp");

        } catch (Exception e) {
            request.setAttribute("msg", "Something wrong !");
            ServletHelper.forward(request, response, "forgotPwd.jsp");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
