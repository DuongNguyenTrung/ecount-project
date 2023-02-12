/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fpt.ecount_swp391.util;

import java.util.Random;

/**
 *
 * @author duong
 */
public class Utils {

    public static String genPwd(int length) {
        String symbol = "-/.^&*_!@%=+>)";
        String cap_letter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String small_letter = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";

        String finalString = cap_letter + small_letter
                + numbers + symbol;

        Random random = new Random();

        char[] password = new char[length];

        for (int i = 0; i < length; i++) {
            password[i]
                    = finalString.charAt(random.nextInt(finalString.length()));

        }
        return String.valueOf(password);

    }
}
