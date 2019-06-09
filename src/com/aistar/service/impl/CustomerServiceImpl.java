package com.aistar.service.impl;

import com.aistar.dao.CustomerDao;
import com.aistar.entity.Customer;
import com.aistar.service.CustomerService;
import com.aistar.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

public class CustomerServiceImpl implements CustomerService {

    @Override
    public boolean isExistTelno(long custTelno) {
       CustomerDao customerDao= MyBatisUtil.getSqlSession().getMapper(com.aistar.dao.CustomerDao.class);
       Customer customer=customerDao.selectByCustTelno(custTelno);
        System.out.println("进入service方法");
        System.out.println(customer);
       if (customer !=null){//custTelno == 15632458966L
           return true;
       }else {
           return false;
       }
    }

    @Override
    public boolean save(Customer customer) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
        int rows = dao.insert(customer);
        sqlSession.commit();
        MyBatisUtil.closeSqlSession();
        return rows>0;
    }

    @Override
    public Customer getByNameAndPwd(Customer customer) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
        Customer result =  dao.selectByNameAndPwd(customer.getCustName(),customer.getCustPwd());
        MyBatisUtil.closeSqlSession();
        return result;
    }

    @Override
    public Customer getByEmailAndPwd(Customer customer) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
        Customer result =  dao.selectByEmailAndPwd(customer.getCustEmail(),customer.getCustPwd());
        MyBatisUtil.closeSqlSession();
        return result;
    }

    @Override
    public Customer getByTelnoAndPwd(Customer customer) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
        Customer result =  dao.selectByTelnoAndPwd(customer.getCustTelno(),customer.getCustPwd());
        MyBatisUtil.closeSqlSession();
        return result;
    }

    @Override
    public Customer getById(int id) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
        Customer customer =  dao.selectById(id);
        MyBatisUtil.closeSqlSession();
        return customer;
    }

    @Override
    public boolean update(Customer customer) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        CustomerDao dao = sqlSession.getMapper(CustomerDao.class);
        int rows =  dao.update(customer);
        sqlSession.commit();
        MyBatisUtil.closeSqlSession();
        return rows >0;
    }

}

