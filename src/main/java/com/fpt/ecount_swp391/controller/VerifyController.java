/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fpt.ecount_swp391.controller;

import com.fpt.ecount_swp391.dao.impl.UserDAOimpl;
import com.fpt.ecount_swp391.util.ServletHelper;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author duong
 */
public class VerifyController extends HttpServlet {

    private UserDAOimpl dao = new UserDAOimpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String verifyToken = request.getParameter("verify");
        boolean check = dao.checkVerifyToken(username, verifyToken);
        if (check) {
            request.setAttribute("username", username);
            ServletHelper.forward(request, response, "resetPwd.jsp");
            return;
        }
        request.setAttribute("msg", "Wrong verify token!!");
        ServletHelper.forward(request, response, "forgotPwd.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String pwd = request.getParameter("pwd");
            String username = request.getParameter("username");
            dao.resetPwd(username, pwd);
            request.setAttribute("msg", "Reset password successful !");
            ServletHelper.forward(request, response, "resetPwd.jsp");
        } catch (Exception e) {
            request.setAttribute("msg", "Something wrong !");
            ServletHelper.forward(request, response, "resetPwd.jsp");
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
