package com.shareeat.merchant.service;

import com.shareeat.merchant.dto.CategoryDTO;
import com.shareeat.merchant.dto.CategoryPageQueryDTO;
import com.shareeat.merchant.entity.Category;
import com.shareeat.merchant.result.PageResult;

import java.util.List;

public interface CategoryService{

    /**新增分类
     * @param categoryDTO
     */
    void save(CategoryDTO categoryDTO);


    /**
     * 分页查询
     * @param categoryPageQueryDTO
     */
    PageResult page(CategoryPageQueryDTO categoryPageQueryDTO);

    /**
     * 删除分类根据id
     * @param id
     */
    void deleteById(long id);

    /**
     * 编辑分类信息
     * @param categoryDTO
     */
    void update(CategoryDTO categoryDTO);

    /**
     * 禁用启用
     * @param id
     */
    void startOrStop(Integer status, long id);


    /**
     * 根据类型查询分类
     * @param type
     */
    List<Category> list(Integer type);
}
