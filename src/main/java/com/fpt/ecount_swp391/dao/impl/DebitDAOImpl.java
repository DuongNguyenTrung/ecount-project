/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fpt.ecount_swp391.dao.impl;

import com.fpt.ecount_swp391.dao.DebitDAO;
import com.fpt.ecount_swp391.dao.HibernateUtil;
import com.fpt.ecount_swp391.dto.DebitDto;
import com.fpt.ecount_swp391.model.Debit;
import com.fpt.ecount_swp391.model.Debtor;
import com.fpt.ecount_swp391.model.User;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class DebitDAOImpl implements DebitDAO {

    @Override
    public List<DebitDto> getDebitByDebtorIdAndUserId(int uid, int debtorId) {
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query query = session.createQuery("SELECT new com.fpt.ecount_swp391.dto.DebitDto(db.debitId,u.fullname,d.fullname,db.amount,db.repaymentTerm,db.note,db.img,db.status,db.createDate,db.updateDate) "
                    + "FROM Debit db JOIN d.debtor d JOIN d.user u WHERE user_id=:userid AND debtor_id=:debtorid");
            query.setParameter("userid", uid);
            query.setParameter("debtorid", debtorId);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insert(int userId, int debtorId, Debit debit) {
        Transaction transaction = null;
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            debit.setDebtor(new Debtor().builder().debtorId(1).build());
            debit.setUser(new User().builder().userId(1).build());
            session.save(debit);
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
    public boolean update(Debit debit) {
        Transaction transaction = null;
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            session.merge(debit);
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
    public boolean delete(int debitId) {
        Transaction transaction = null;
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            session.remove(session.find(Debit.class, debitId));
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

}
