package com.fpt.ecount_swp391.dto;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DebitDto {

    private Integer debitId;
    private String user;
    private String debtor;
    private Long amount;
    private Date repaymentTerm;
    private String note;
    private String img;
    private Boolean status;
    private Date createDate;
    private Date updateDate;
}
