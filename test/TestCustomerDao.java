import com.aistar.dao.CustomerDao;
import com.aistar.entity.Customer;
import com.aistar.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.*;

public class TestCustomerDao {

    SqlSession sqlSession=MyBatisUtil.getSqlSession();
    //getMapper 底层创建一个CustomerDao的实现子类的代理对象
    CustomerDao customerDao=sqlSession.getMapper(CustomerDao.class);
    @Test
    public void testSelectById(){
     Customer customer= customerDao.selectById(1001);
     System.out.println(customer);
     MyBatisUtil.closeSqlSession();
    }

    @Test
    public void selectByNameAndPwd(){
       Customer customer= customerDao.selectByNameAndPwd("spiderman","222222");
       System.out.println(customer);
       MyBatisUtil.closeSqlSession();
    }


    @Test
    public void selectByLikeName(){
       List<Customer> customerList= customerDao.selectByLikeName("li");
       for (Customer customer:customerList){
           System.out.println(customer);
       }
    }


    @Test
    public void insert(){
     // Customer customer=  customerDao.insert();
       Customer customer= new Customer();
       customer.setCustId(1017);
        customer.setCustName("Jack");
        customer.setCustPwd("121212");
        customer.setCustGender("M");
        customer.setCustTelno(13829389232L);
       int rows=customerDao.insert(customer);
       System.out.println(rows);
       sqlSession.commit();
       MyBatisUtil.closeSqlSession();
    }

    @Test
    public void update(){
        Customer customer=customerDao.selectById(1016);
        customer.setCustPwd("111111");
        customer.setCustGender("f");

       int rows= customerDao.update(customer);
        sqlSession.commit();
        System.out.println(rows);
        MyBatisUtil.closeSqlSession();
    }




}


