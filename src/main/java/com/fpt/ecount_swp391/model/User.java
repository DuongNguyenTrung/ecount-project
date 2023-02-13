/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fpt.ecount_swp391.model;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Users")  
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // identity increment
    @Column(name = "user_id")
    private Integer userId; 
    
    private String username;
    private String password;
    private String fullname;
    private Boolean gender;
    private String email;
    private String address;
    private String phone;
    private Integer role;
    private Boolean status;
    @Column(name = "verify_token")
    private String verifyToken;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Debit> debits;
    
    // HibernateQL entity , native query( sql )
}
