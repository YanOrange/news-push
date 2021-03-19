package com.delay.newspush.controller;

import com.delay.newspush.entity.Type;
import com.delay.newspush.service.TypeService;
import com.delay.newspush.utils.ExecuteResult;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("type")
public class TypeController extends BaseController {

    @Autowired
    TypeService typeService;

    /**
     * 获取全部类型
     *
     * @return
     */
    @RequestMapping("getAll")
    @ResponseBody
    public ExecuteResult findAll() {
        List<Type> list = typeService.findAll();
        return ExecuteResult.ok(list);
    }

    /**
     * 更改类型页面
     *
     * @return
     */
    @RequestMapping("toEditType")
    public String toEditType(@RequestParam("typeId") Integer typeId, Model model) {

        Type byId = typeService.findById(typeId).orElse(null);
        model.addAttribute("type", byId);

        return "type/type-edit";
    }

    /**
     * 更改类型
     *
     * @return
     */
    @RequestMapping("editInfo")
    @ResponseBody
    public ExecuteResult editInfo(@RequestBody Type type) {
        Type byId = typeService.findById(type.getId()).orElse(null);
        BeanUtils.copyProperties(type, byId, "createTime");
        typeService.saveAndFlush(byId);
        return ExecuteResult.ok();
    }

    /**
     * 删除类型
     *
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public ExecuteResult delete(@RequestBody List<Integer> ids) {
        if (CollectionUtils.isEmpty(ids)) {
            return ExecuteResult.fail(1, "未选择一列");
        }
        ids.stream().forEach(o -> {
            typeService.deleteById(o);
        });
        return ExecuteResult.ok();
    }

    /**
     * 添加类型
     *
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    public ExecuteResult delete(@RequestBody Type type) {
        Type byName = typeService.findByName(type.getName());
        if (byName != null) {
            return ExecuteResult.fail(1, "该类型已存在");
        }
        type.setCreateTime(new Date());
        typeService.saveAndFlush(type);
        return ExecuteResult.ok();
    }

}
