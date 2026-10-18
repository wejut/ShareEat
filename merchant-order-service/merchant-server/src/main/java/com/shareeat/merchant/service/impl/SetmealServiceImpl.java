package com.shareeat.merchant.service.impl;

import com.github.pagehelper.Constant;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.shareeat.merchant.constant.MessageConstant;
import com.shareeat.merchant.constant.StatusConstant;
import com.shareeat.merchant.dto.SetmealDTO;
import com.shareeat.merchant.dto.SetmealPageQueryDTO;
import com.shareeat.merchant.entity.Dish;
import com.shareeat.merchant.entity.Setmeal;
import com.shareeat.merchant.entity.SetmealDish;
import com.shareeat.merchant.exception.DeletionNotAllowedException;
import com.shareeat.merchant.exception.SetmealEnableFailedException;
import com.shareeat.merchant.mapper.DishMapper;
import com.shareeat.merchant.mapper.SetmealDishMapper;
import com.shareeat.merchant.mapper.SetmealMapper;
import com.shareeat.merchant.result.PageResult;
import com.shareeat.merchant.service.SetmealService;
import com.shareeat.merchant.vo.DishItemVO;
import com.shareeat.merchant.vo.SetmealVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SetmealServiceImpl implements SetmealService {

    @Autowired
    SetmealMapper setmealMapper;
    @Autowired
    SetmealDishMapper setmealDishMapper;
    @Autowired
    DishMapper dishMapper;

    /**
     * 新增套餐
     * @param setmealDTO
     */
    @Override
    @Transactional
    public void saveWithDish(SetmealDTO setmealDTO) {
        Setmeal setmeal = new Setmeal();
        BeanUtils.copyProperties(setmealDTO,setmeal);
        setmealMapper.insert(setmeal);
        Long setmealId = setmeal.getId();
        List<SetmealDish> dishes = setmealDTO.getSetmealDishes();
        if (dishes!=null && dishes.size()>0){
            dishes.forEach(setmealDish -> setmealDish.setSetmealId(setmealId));
            setmealDishMapper.insertBatch(dishes);
        }
    }

    /**
     * 分页查询
     * @param setmealPageQueryDTO
     * @return
     */
    @Override
    public PageResult page(SetmealPageQueryDTO setmealPageQueryDTO) {
        PageHelper.startPage(setmealPageQueryDTO.getPage(),setmealPageQueryDTO.getPageSize());
        Page<SetmealVO> page = setmealMapper.page(setmealPageQueryDTO);
        return new PageResult(page.getTotal(),page.getResult());
    }

    /**
     * 批量删除套餐
     * @param ids
     */
    @Transactional
    @Override
    public void delete(List<Long> ids) {
        ids.forEach(id ->{
            Setmeal setmeal = setmealMapper.getById(id);
            if (setmeal.getStatus()== StatusConstant.ENABLE){
                throw new DeletionNotAllowedException(MessageConstant.SETMEAL_ON_SALE);
            }
        });
        ids.forEach(id ->{
            setmealMapper.deleteMealById(id);
            setmealDishMapper.deleteMealDishByMealId(id);
        });
    }

    /**
     * 更新套餐
     * @param setmealDTO
     */
    @Override
    @Transactional
    public void update(SetmealDTO setmealDTO) {
        Setmeal setmeal = new Setmeal();
        BeanUtils.copyProperties(setmealDTO,setmeal);
        Long setmealId = setmealDTO.getId();
        setmealMapper.update(setmeal);
        setmealDishMapper.deleteMealDishByMealId(setmealId);
        List<SetmealDish> setmealDishes = setmealDTO.getSetmealDishes();
        setmealDishes.forEach(setmealDish->{
            setmealDish.setSetmealId(setmealId);
        });
        setmealDishMapper.insertBatch(setmealDishes);
    }

    /**
     * 根据id查询套餐
     * @param id
     * @return
     */
    @Override
    public SetmealVO getById(Long id) {
        SetmealVO setmealVO = new SetmealVO();
        Setmeal setmeal = setmealMapper.getById(id);
        BeanUtils.copyProperties(setmeal,setmealVO);
        List<SetmealDish> dishes =setmealDishMapper.getsetmealDishById(id);
        setmealVO.setSetmealDishes(dishes);
        return setmealVO;
    }

    /**
     * 开启或停用状态
     * @param status
     * @param id
     */
    @Override
    @Transactional
    public void startOrStop(Integer status, Long id) {
        //检查是否是开启状态，如果是要检查是否有已停售的菜品
        if(status== StatusConstant.ENABLE){
            List<Dish> dishes = dishMapper.getDishesByMealId(id);
            dishes.forEach(dish -> {
                if(dish.getStatus()==StatusConstant.DISABLE){
                    throw new SetmealEnableFailedException(MessageConstant.SETMEAL_ENABLE_FAILED);
                }
            });
        }
        Setmeal setmeal= Setmeal.builder()
                .id(id)
                .status(status)
                .build();
        setmealMapper.update(setmeal);
    }

    /**
     * 条件查询
     * @param setmeal
     * @return
     */
    public List<Setmeal> list(Setmeal setmeal) {
        List<Setmeal> abc = setmealMapper.list(setmeal);
        return abc;
    }

    /**
     * 根据id查询菜品选项
     * @param id
     * @return
     */
    public List<DishItemVO> getDishItemById(Long id) {
        return setmealMapper.getDishItemBySetmealId(id);
    }
}
