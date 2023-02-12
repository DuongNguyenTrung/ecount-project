/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fpt.ecount_swp391.dao;

import com.fpt.ecount_swp391.dao.impl.UserDAOimpl;
import com.fpt.ecount_swp391.dto.UserDto;
import com.fpt.ecount_swp391.dto.request.UserRequestDTO;
import com.fpt.ecount_swp391.model.Debit;
import com.fpt.ecount_swp391.model.Debtor;
import com.fpt.ecount_swp391.model.User;
import java.util.Properties;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtil {

    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration();

                // Hibernate settings equivalent to hibernate.cfg.xml's properties
                Properties settings = new Properties();
                settings.put(Environment.DRIVER, "com.microsoft.sqlserver.jdbc.SQLServerDriver");
                settings.put(Environment.URL, "jdbc:sqlserver://localhost:1433;databaseName=SWP_Ecount");
                settings.put(Environment.USER, "sa");
                settings.put(Environment.PASS, "12345678");
                settings.put(Environment.DIALECT, "org.hibernate.dialect.SQLServerDialect");

                settings.put(Environment.SHOW_SQL, "true");

                settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

//                settings.put(Environment.HBM2DDL_AUTO, "none");
                configuration.setProperties(settings);
// add entity class
                configuration.addAnnotatedClass(User.class);
                configuration.addAnnotatedClass(Debtor.class);
                configuration.addAnnotatedClass(Debit.class);

                ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                        .applySettings(configuration.getProperties()).build();

                sessionFactory = configuration.buildSessionFactory(serviceRegistry);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return sessionFactory;
    }

    public static void main(String[] args) {
        UserDAOimpl dao = new UserDAOimpl();
        Transaction transaction = null;

        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            Debtor d = new Debtor();
            d.setFullname("duong");
            d.setAddress("qo");
            d.setEmail("duongnthe141567@fpt.edu.vn");
            
            session.save(d);

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
