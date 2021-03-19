package com.delay.newspush.service;

import com.delay.newspush.entity.Comment;
import com.delay.newspush.entity.Type;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author 闫金柱
 * @create 2021-3-15 10:42
 */
public interface TypeService extends JpaRepository<Type, Integer> {
    Type findByName(String name);
}
