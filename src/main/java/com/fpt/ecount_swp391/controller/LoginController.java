/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fpt.ecount_swp391.controller;

import com.fpt.ecount_swp391.dao.impl.DebtorDAOImpl;
import com.fpt.ecount_swp391.dao.impl.UserDAOimpl;
import com.fpt.ecount_swp391.dto.UserDto;
import com.fpt.ecount_swp391.util.ServletHelper;
import com.fpt.ecount_swp391.util.VerifyRecaptcha;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Optional;

public class LoginController extends HttpServlet {
    
    private UserDAOimpl dao = new UserDAOimpl();
    private DebtorDAOImpl debtorDao = new DebtorDAOImpl();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletHelper.forward(request, response, "login.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = ServletHelper.getString(request, "user");
        String pwd = ServletHelper.getString(request, "pwd");
        
//        String gRecaptchaResponse = request
//                .getParameter("g-recaptcha-response");
//        System.out.println(gRecaptchaResponse);
//        boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
//        if (!verify) {
//            request.setAttribute("error", "Wrong captcha!");
//            ServletHelper.forward(request, response, "login.jsp");
//            return;
//        }
        Optional<UserDto> u = dao.login(user, pwd);
        if (!u.isPresent()) {
            request.setAttribute("error", "Wrong username or password!");
            ServletHelper.forward(request, response, "login.jsp");
            return;
        }
        HttpSession session = request.getSession();
        session.setAttribute("user", u.get());
        request.setAttribute("listDebtor", debtorDao.getAllDebtorByUserId(u.get().getUserId()));
        ServletHelper.forward(request, response, "debitBook.jsp");
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
