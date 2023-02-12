/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.fpt.ecount_swp391.dao;

import com.fpt.ecount_swp391.dto.DebitDto;
import com.fpt.ecount_swp391.model.Debit;
import java.util.List;

public interface DebitDAO {

    List<DebitDto> getDebitByDebtorIdAndUserId(int uid, int debtorId);

    boolean insert(int userId, int debtorId, Debit debit);
    boolean update( Debit debit);
    boolean delete( int debitId);
}
