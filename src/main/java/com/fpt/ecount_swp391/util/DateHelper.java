/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fpt.ecount_swp391.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;

public class DateHelper {

    public static final String DATE_FORMAT = "yyyy-MM-dd";

    public static Date toDate(String date) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat(DATE_FORMAT);
        return formatter.parse(date);
    }

    public static Date addDays(Date date, int days) throws ParseException {
        Instant ins = date.toInstant();
        return Date.from(ins.plus(days, ChronoUnit.DAYS));
    }
    public static Date addDays(String dateString, int days) throws ParseException {
        Instant ins = toDate(dateString).toInstant();
        return Date.from(ins.plus(days, ChronoUnit.DAYS));
    }
}
