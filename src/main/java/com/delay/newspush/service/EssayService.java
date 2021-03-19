package com.delay.newspush.service;

import com.delay.newspush.entity.Essay;
import com.delay.newspush.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author 闫金柱
 * @create 2021-3-15 10:42
 */
public interface EssayService extends JpaRepository<Essay, Integer> {
    List<Essay> findAllByTypeIdAndState(Integer typeId, int i);

    List<Essay> findAllByUserId(Integer id);

    List<Essay> findAllByState(Integer state);

    void deleteByUserId(Integer o);
}
