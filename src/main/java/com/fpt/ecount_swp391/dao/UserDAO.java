/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.fpt.ecount_swp391.dao;

import com.fpt.ecount_swp391.dto.UserDto;
import com.fpt.ecount_swp391.dto.request.UserRequestDTO;
import com.fpt.ecount_swp391.model.User;
import java.util.Optional;

/**
 *
 * @author duong
 */
public interface UserDAO {

    Optional<UserDto> login(String user, String pwd);

    Boolean register(User u);

    Boolean update(int id, UserRequestDTO u);

    int changePwd(int id, String oldpwd, String pwd);

    String resetPwd(int id);

    boolean isUsernameExist(String username);

    boolean setVerifyToken(int id, String token);
    boolean checkVerifyToken(int id, String token);

}
