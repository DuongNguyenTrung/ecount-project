/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fpt.ecount_swp391.util;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Optional;

public class ServletHelper {

    public static void forward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        request.getRequestDispatcher(url).forward(request, response);
    }

    public static Optional<String> getStringOptional(HttpServletRequest request, String name) {
        return Optional.ofNullable(request.getParameter(name));
    }

    public static String getString(HttpServletRequest request, String name) {
        return request.getParameter(name);
    }


    public static Optional<Integer> getInt(HttpServletRequest request, String name) {
        String param = request.getParameter(name);
        try {
            return Optional.ofNullable(Integer.parseInt(param));
        } catch (Exception e) {
            return Optional.empty();
        }
    }
}
