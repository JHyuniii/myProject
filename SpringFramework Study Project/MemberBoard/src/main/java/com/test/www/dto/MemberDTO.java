package com.test.www.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class MemberDTO {
    private int memberNum;
    private String name;
    private String rank;
    private String phoneNumber;
    private String email;
    private Date updateDate;

}
