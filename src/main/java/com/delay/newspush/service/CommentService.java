package com.delay.newspush.service;

import com.delay.newspush.entity.Comment;
import com.delay.newspush.entity.Essay;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author 闫金柱
 * @create 2021-3-15 10:42
 */
public interface CommentService extends JpaRepository<Comment,Integer> {
    List<Comment> findByEssayId(Integer essayId);
}
