package com.shareeat.social.service.impl;

import com.shareeat.social.dto.Result;
import com.shareeat.social.entity.ShopType;
import com.shareeat.social.mapper.ShopTypeMapper;
import com.shareeat.social.service.IShopTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import static com.shareeat.social.utils.RedisConstants.CACHE_SHOP_TYPE_KEY;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @since 2021-12-22
 */
@Service
public class ShopTypeServiceImpl extends ServiceImpl<ShopTypeMapper, ShopType> implements IShopTypeService {
    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public Result queryTypeList() {
        //查询redis有没有
        List<ShopType> shopTypesList = (List<ShopType>) redisTemplate.opsForValue().get(CACHE_SHOP_TYPE_KEY);
        //有，返回
        if (shopTypesList!=null && shopTypesList.size()>0){
            return Result.ok(shopTypesList);
        }
        //没有，查询
        List<ShopType> shopTypes = query().orderByAsc("sort").list();
        //插入redis
        redisTemplate.opsForValue().set(CACHE_SHOP_TYPE_KEY,shopTypes);
        //返回
        return Result.ok(shopTypes);
    }
}
