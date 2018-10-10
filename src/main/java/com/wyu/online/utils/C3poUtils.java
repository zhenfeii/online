package com.wyu.online.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.beans.PropertyVetoException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * 连接池的意义很重大：
 * 1、不必每次去查询一条数据就去创建一次连接。
 * 2、大大提高连接效率
 *
 * 还是一些问题：
 * 设置了最大连接数为10，但web跑起来的时候，连接数能达到30、40
 * 对数据库的开销比较大了
 * Created by Administrator on  2018/7/20
 */
public class C3poUtils {

    private static ComboPooledDataSource dataSource = null;


    //只被创建一次
    static {
        dataSource = new ComboPooledDataSource();
        try {
            dataSource.setDriverClass("com.mysql.jdbc.Driver");
            dataSource.setJdbcUrl("jdbc:mysql://locolhost:3306/online?characterEncoding=utf8");
            dataSource.setUser("root");
            dataSource.setPassword("123456");
            dataSource.setMaxStatements(10);
            dataSource.setInitialPoolSize(5);
            dataSource.setMinPoolSize(5);
            dataSource.setMaxPoolSize(10);
            dataSource.setMaxStatementsPerConnection(5);
            dataSource.setMaxPoolSize(60 * 5);
        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }

    }
    public static PreparedStatement getPreparedStatement(String sql, Object... args){
        PreparedStatement ps = null;
        try {
            ps = dataSource.getConnection().prepareStatement(sql);
            int i = 1;
            if (args != null & args.length > 0) {
                for (Object object : args) {
                    ps.setObject(i, object);
                    i++;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ps;
    }
}
