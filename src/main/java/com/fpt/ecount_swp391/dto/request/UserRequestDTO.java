/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fpt.ecount_swp391.dto.request;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class UserRequestDTO {

    private String fullname;
    private Boolean gender;
    private String address;
    private String email;
    private String phone;
}
