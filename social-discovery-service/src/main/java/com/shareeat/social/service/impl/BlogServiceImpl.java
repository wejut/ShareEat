package com.shareeat.social.service.impl;

import com.shareeat.social.entity.Blog;
import com.shareeat.social.mapper.BlogMapper;
import com.shareeat.social.service.IBlogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @since 2021-12-22
 */
@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements IBlogService {

}
