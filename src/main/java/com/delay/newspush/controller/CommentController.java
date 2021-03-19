package com.delay.newspush.controller;

import com.delay.newspush.entity.Comment;
import com.delay.newspush.entity.Essay;
import com.delay.newspush.entity.User;
import com.delay.newspush.service.CommentService;
import com.delay.newspush.utils.ExecuteResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("comment")
public class CommentController extends BaseController {

    @Autowired
    CommentService commentService;

    @RequestMapping("commit")
    @ResponseBody
    public ExecuteResult commit(String content, Integer essayId) {
        User user2 = (User) getSession().getAttribute("user");
        Comment comment = new Comment();
        comment.setContent(content);
        comment.setCreateTime(new Date());
        Essay essay = new Essay();
        essay.setId(essayId);
        comment.setEssay(essay);
        comment.setUser(user2);
        commentService.saveAndFlush(comment);
        return ExecuteResult.ok();
    }

    @RequestMapping("findByEssayId")
    @ResponseBody
    public ExecuteResult findByEssayId(Integer essayId) {


        List<Comment> list = commentService.findByEssayId(essayId);
        return ExecuteResult.ok(list);
    }

}
