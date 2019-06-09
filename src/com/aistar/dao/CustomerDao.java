package com.aistar.dao;

import com.aistar.entity.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * query select find get 在dao中都可以使用
 */
public interface CustomerDao {
    /**
     * 根据主键查询用户对象
     * @param id 指定查询的用户id
     * @return 返回对应的Customer对象
     */
    //查看个人信息（根据主键查询）
    public Customer selectById(int id);


    //注册 //int :表示受影响的行数
    //登录
    /**
     * 根据用户名和密码查询用户
     * @param custName 用户名
     * @param custPwd 密码
     * @return 返回对应的用户对象
     */
    public Customer selectByNameAndPwd(@Param("custName") String custName, @Param("custPwd") String custPwd);
    /**
     * 根据用户名与密码查询用户
     * @param custPwd   密码
     * @return 返回对应的用户对象
     */
    //  public Customer selectByNameAndPwd(@Param("custName") String custName, @Param("custPwd") String custPwd);
    public Customer selectByEmailAndPwd(@Param("custEmail") String custEmail, @Param("custPwd") String custPwd);
    public Customer selectByTelnoAndPwd(@Param("custTelno") long custTelno, @Param("custPwd") String custPwd);


    public Customer selectByCustTelno(long custTelno);


/*

    public Customer getByNameAndPwd(Customer customer);
    public Customer getByEmailAndPwd(Customer customer);
    public  Customer getByTelnoAndPwd(Customer customer);

*/





    /**
     * 根据用户名模糊查询用户 [返回多条记录]
     * @param custName
     * @return
     */
    public List<Customer> selectByLikeName(String custName);


    /**
     * 添加一个新用户
     * @param customer 要添加的新用户对象
     * @return 返回数据库中受影响的行数
     */
    public int insert(Customer customer);



    //修改个人信息
    /**
     * 修改个人信息
     * @param customer  要修改的用户对象
     * @return  返回数据库中受影响的行数
     */
    public int update(Customer customer);

    //修改密码
    /**
     * 修改密码
     * @param custId  指定新用户
     * @param custPwd 新密码
     * @return 返回数据库中受影响的行数
     */
    public int updatePwd(int custId, String custPwd);

    //修改头像
    /**
     * 修改头像
     * @param custId  指定用户
     * @param custProfile 新头像路径
     * @return 返回数据库中受影响的行数0.20.0.
     */
    public int updateProfile(int custId, String custProfile);

    //删除一个用户
    /**
     * 删除一个用户
     * @param id 要删除的用户对象
     * @return 返回数据库中受影响的行数
     */
    public int delete(int id);






}
