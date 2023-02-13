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
import com.fpt.ecount_swp391.util.Utils;
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
            Query q = session.createQuery("SELECT u FROM User u WHERE username= :user AND password = :pwd ", User.class);
            q.setParameter("user", user);
            q.setParameter("pwd", pwd);
            List<User> ls = q.getResultList();
            if (ls.isEmpty()) {
                return Optional.empty();
            }
            User u = ls.get(0);
            if (BCrypt.checkpw(pwd, u.getPassword())) {
                UserMapperImpl mapper = new UserMapperImpl();
                return Optional.of(mapper.toUserDto(u));
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
    public String resetPwd(int id) {
        Transaction transaction = null;

        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            User oldUser = session.find(User.class, id);
            String randompwd = Utils.genPwd(6);
            String salt = BCrypt.gensalt(12);
            oldUser.setPassword(BCrypt.hashpw(randompwd, salt));
            session.merge(oldUser);
            transaction.commit();
            return randompwd;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return null;
    }
//@Transactional ,  Spring AOP( AspectJ)

    @Override
    public boolean isUsernameExist(String username) {
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query q = session.createQuery("SELECT count(*) FROM User WHERE username=:username"); //Hibernate 
            q.setParameter("username", username);

            long rs = (long) q.getSingleResult();
            if (rs == 0) {
                return false;
            }
            return true;
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public boolean setVerifyToken(int id, String token) {
        Transaction transaction = null;

        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            User oldUser = session.find(User.class, id);
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
    public boolean checkVerifyToken(int id, String token) {

        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            User oldUser = session.find(User.class, id);
            String verifyToken = oldUser.getVerifyToken();
            if (verifyToken.isEmpty()) {
                return false;
            }
            return verifyToken.equals(token);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
