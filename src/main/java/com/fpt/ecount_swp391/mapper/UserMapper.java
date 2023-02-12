/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fpt.ecount_swp391.mapper;

import com.fpt.ecount_swp391.dto.UserDto;
import com.fpt.ecount_swp391.model.User;
import org.mapstruct.Mapper;

@Mapper
public interface UserMapper {

    UserDto toUserDto(User u);
}
