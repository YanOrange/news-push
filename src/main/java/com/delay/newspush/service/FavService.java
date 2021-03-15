package com.delay.newspush.service;

import com.delay.newspush.entity.Comment;
import com.delay.newspush.entity.Fav;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author 闫金柱
 * @create 2021-3-15 10:42
 */
public interface FavService extends JpaRepository<Fav,Integer> {
    List<Fav> findByUserId(Integer id);

    Fav findByUserIdAndNewsId(Integer id, Integer essayId);
}
