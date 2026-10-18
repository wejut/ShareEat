package com.shareeat.merchant.service;

import com.shareeat.merchant.vo.OrderReportVO;
import com.shareeat.merchant.vo.SalesTop10ReportVO;
import com.shareeat.merchant.vo.TurnoverReportVO;
import com.shareeat.merchant.vo.UserReportVO;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;

@Service
public interface ReportService {

    /**
     * 营业额统计
     * @param begin
     * @param end
     * @return
     */
    TurnoverReportVO getTurnoverStatistics(LocalDate begin, LocalDate end);

    /**
     * 用户统计
     * @param begin
     * @param end
     * @return
     */
    UserReportVO getUserStatistics(LocalDate begin, LocalDate end);

    /**
     * 订单统计
     * @param begin
     * @param end
     * @return
     */
    OrderReportVO getOrderStatisticsByDate(LocalDate begin, LocalDate end);


    /**
     * 查询销量前十
     * @param begin
     * @param end
     * @return
     */
    SalesTop10ReportVO getTop10ByDate(LocalDate begin, LocalDate end);

    /**
     * 导出运营数据报表
     * @param response
     */
    void exportBusinessData(HttpServletResponse response);
}


