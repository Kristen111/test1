package com.aistar.util;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

/**
 * 获得SqlSession与关闭SqlSession
 */
public class MyBatisUtil {
    //SqlSession:一级缓存，管理数据库的sql语句操作（增删改查操作） 封装的是PreparedStatement
   // 一次性重量级放在static代码块中
    private static SqlSession sqlSession;
    private static SqlSessionFactory sqlSessionFactory;

    static {
        //将mybatis-config.xml（还包含mapper.xml）加载到读取流中
        InputStream is=MyBatisUtil.class.getClassLoader().getResourceAsStream("config/mybatis-config.xml");
        System.out.println(is);
        //读取mybatis-config.xml的数据源信息，建立数据库连接
        sqlSessionFactory=new SqlSessionFactoryBuilder().build(is);

        }

    /**
     * SqlSession:一级缓存，管理数据库的sql语句操作（增删改查操作）封装的是PreparedStstement
     * @return  返回SqlSession 对象
     */
    public static SqlSession getSqlSession(){
        return sqlSessionFactory.openSession(true);
        }

    /**
     * 关闭SqlSession
     */
    public static void closeSqlSession(){
            if (sqlSession!=null){
                sqlSession.close();
            }
        }










}
