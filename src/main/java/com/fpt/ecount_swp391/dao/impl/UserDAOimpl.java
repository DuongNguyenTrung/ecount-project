/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fpt.ecount_swp391.dao.impl;

import com.fpt.ecount_swp391.dao.HibernateUtil;
import com.fpt.ecount_swp391.dao.UserDAO;
import com.fpt.ecount_swp391.dto.UserDto;
import com.fpt.ecount_swp391.dto.request.UserRequestDTO;
import com.fpt.ecount_swp391.mapper.UserMapperImpl;
import com.fpt.ecount_swp391.model.User;
import com.fpt.ecount_swp391.util.DateHelper;
import com.fpt.ecount_swp391.util.Utils;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;

public class UserDAOimpl implements UserDAO {
    
    @Override
    public Optional<UserDto> login(String user, String pwd) {
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            Query q = session.createQuery("SELECT u FROM User u WHERE username= :user ", User.class);
            q.setParameter("user", user);
            List<User> ls = q.getResultList();
            if (ls.isEmpty()) {
                return Optional.empty();
            }
            User u = ls.get(0);
            if (BCrypt.checkpw(pwd, u.getPassword())) {
                UserMapperImpl mapper = new UserMapperImpl();
                return Optional.ofNullable(mapper.toUserDto(u));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public Boolean register(User u) {
        Transaction transaction = null;
        
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            //hash password
            String salt = BCrypt.gensalt(12);
            u.setPassword(BCrypt.hashpw(u.getPassword(), salt));
            session.save(u);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public Boolean update(int id, UserRequestDTO u) {
        Transaction transaction = null;
        
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            User oldUser = session.find(User.class, id);
            oldUser.setAddress(u.getAddress());
            oldUser.setFullname(u.getFullname());
            oldUser.setEmail(u.getEmail());
            oldUser.setGender(u.getGender());
            oldUser.setPhone(u.getPhone());
            session.merge(oldUser);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public int changePwd(int id, String oldpwd, String pwd) {
        Transaction transaction = null;
        
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            User oldUser = session.find(User.class, id);
            if (!BCrypt.checkpw(oldpwd, oldUser.getPassword())) {
                return -1;
            }
            String salt = BCrypt.gensalt(12);
            oldUser.setPassword(BCrypt.hashpw(pwd, salt));
            session.merge(oldUser);
            transaction.commit();
            return 1;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return 0;
    }
    
    @Override
    public boolean resetPwd(String username, String pwd) {
        Transaction transaction = null;
        
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            
            User oldUser = getUserByUsername(username);
            String salt = BCrypt.gensalt(12);
            oldUser.setPassword(BCrypt.hashpw(pwd, salt));
            session.merge(oldUser);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
//@Transactional ,  Spring AOP( AspectJ)

    @Override
    public User getUserByUsername(String username) {
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query q = session.createQuery("FROM User WHERE username=:username",User.class); //Hibernate 
            q.setParameter("username", username);
            
            List<User> ls = q.getResultList();
            if (ls.isEmpty()) {
                return null;
            }
            return ls.get(0);
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }
    
    @Override
    public boolean setVerifyToken(String username, String token) {
        Transaction transaction = null;
        
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            
            User oldUser = getUserByUsername(username);
            oldUser.setVerifyToken(token);
            session.merge(oldUser);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public boolean checkVerifyToken(String username, String token) {
        
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction

            User oldUser = getUserByUsername(username);
            String verifyToken = oldUser.getVerifyToken();
            if (verifyToken.isEmpty()) {
                return false;
            }
            Long expired = Long.parseLong(verifyToken.split("\\.")[1]);
            if (expired < new Date().getTime()) {
                return false;
            }
            return verifyToken.equals(token);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
}
