/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.fpt.ecount_swp391.dao;

import com.fpt.ecount_swp391.dto.DebtorDto;
import java.util.List;

public interface DebtorDAO {

    List<DebtorDto> getAllDebtorByUserId(int id);
    List<DebtorDto> findAll(int id);
}
