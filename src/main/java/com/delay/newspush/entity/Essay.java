package com.delay.newspush.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
@Table(name = "t_essay")
public class Essay {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)//自增长
    private Integer id;

    @JoinColumn(name="user_id")//外键字段
    @ManyToOne(fetch = FetchType.EAGER)
    private User user;//作者

    private String title;//标题
    @Lob
    @Column(columnDefinition="TEXT")
    private String content;//正文
    private Date createTime;
    private Date updateTime;
    private Date publishTime;
    @JoinColumn(name = "type_id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Type type;//类型

    private Integer state;//状态 1发布 2打回 3弃用 0待审核
    private String remark;//审核意见
}
