package com.shareeat.social.service;

import com.shareeat.social.entity.VoucherOrder;
import com.baomidou.mybatisplus.extension.service.IService;
import com.shareeat.social.dto.Result;
/**
 * <p>
 *  服务类
 * </p>
 *
 * @since 2021-12-22
 */
public interface IVoucherOrderService extends IService<VoucherOrder> {

    Result seckillVoucher(Long voucherId);

    Result createVoucherOrder(Long voucherId);
}
