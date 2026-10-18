package com.shareeat.merchant.service;

import com.shareeat.merchant.dto.EmployeeDTO;
import com.shareeat.merchant.dto.EmployeeLoginDTO;
import com.shareeat.merchant.dto.EmployeePageQueryDTO;
import com.shareeat.merchant.entity.Employee;
import com.shareeat.merchant.result.PageResult;

public interface EmployeeService {

    /**
     * 员工登录
     * @param employeeLoginDTO
     * @return
     */
    Employee login(EmployeeLoginDTO employeeLoginDTO);

    /**
     * 新增员工
     * @param employeeDTO
     */
    void save(EmployeeDTO employeeDTO);

    /**
     * 分页查询
     * @param employeePageQueryDTO
     * @return
     */
    PageResult page(EmployeePageQueryDTO employeePageQueryDTO);

    /**
     * 员工状态
     * @param status
     * @param id
     */
    void startOrstop(Integer status,long id);

    /**
     * 根据id搜索员工信息
     * @param id
     */
    Employee getById(long id);

    /**
     * 编辑员工信息
     * @param employeeDTO
     */
    void update(EmployeeDTO employeeDTO);
}
