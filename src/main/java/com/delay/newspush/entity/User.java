package com.delay.newspush.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * @author 闫金柱
 * @date 2021-2-28 18:37
 */
@Data
@Entity
@Table(name = "t_user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String userName;

    private String passWord;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;

    private String name;

    private String age;

    private String address;

    private String phone;

    private String idCard;

    private Integer status;//0 未认证 1认证中  2已认证

    private String school;//毕业院校

    private String education;//学历

    private String eduNo;//学位证编号

    private Integer invalid;//失效用户 0否 1是

    private Integer isTeacher;//1 是  0否

}
