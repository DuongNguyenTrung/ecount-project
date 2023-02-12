/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fpt.ecount_swp391.dao.impl;

import com.fpt.ecount_swp391.dao.DebtorDAO;
import com.fpt.ecount_swp391.dao.HibernateUtil;
import com.fpt.ecount_swp391.dto.DebtorDto;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

public class DebtorDAOImpl implements DebtorDAO {

    @Override
    public List<DebtorDto> getAllDebtorByUserId(int id) {
        List<DebtorDto> rs = new ArrayList<>();
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query q = session.createQuery("SELECT new com.fpt.ecount_swp391.dto.DebtorDto(d.debtorId,d.fullname,d.phone,d.email,d.address,(SELECT SUM(debit.amount) from Debit debit WHERE debit.user.userId=:userid))"
                    + " FROM Debtor d JOIN d.debits db WHERE db.user.userId=:userid "
                    + "GROUP BY d.debtorId,d.fullname,d.phone,d.email,d.address", DebtorDto.class); //Hibernate 
            q.setParameter("userid", id);
            return q.getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public List<DebtorDto> findAll(int id) {
        List<DebtorDto> rs = new ArrayList<>();
        try ( Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query q = session.createQuery("SELECT new com.fpt.ecount_swp391.dto.DebtorDto(d.debtorId,d.fullname,d.phone,d.email,d.address,SUM(db.amount)) "
                    + "FROM Debtor d JOIN u.debits db WHERE user_id=:userid", DebtorDto.class); //Hibernate 
            q.setParameter("userid", id);
            return q.getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

}
