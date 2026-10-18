package com.shareeat.merchant.service;

import com.shareeat.merchant.dto.ShoppingCartDTO;
import com.shareeat.merchant.entity.ShoppingCart;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ShoppingCartService {
    /**
     * 添加购物车
     * @param shoppingCartDTO
     */
    void add(ShoppingCartDTO shoppingCartDTO);

    /**
     * 查看购物车
     * @return
     */
    List<ShoppingCart> getAllCarts();

    /**
     * 清空购物车
     */
    void deleteAll();

    /**
     * 删除购物车里面一个商品
     * @param shoppingCartDTO
     */
    void deletePreciseOne(ShoppingCartDTO shoppingCartDTO);
}
