package com.wyu.online.test;

import com.sun.org.apache.xml.internal.resolver.helpers.BootstrapResolver;
import com.wyu.online.utils.C3poUtils;
import com.wyu.online.utils.DaoConnection;
import com.wyu.online.utils.UrlUtils;
import org.junit.Test;

import javax.servlet.Servlet;
import java.sql.SQLException;

/**
 * Created by Administrator on  2018/7/20
 */
public class C3p0UtilsTest {

    @Test
    public void checkConnection(){
        for(int i=0;i<5;i++){
            try {
                new DaoConnection().getPreparedStatement("select * from sys_user").executeQuery();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Test
    public void checkC3pxConnection(){
        for (int i=0;i<5;i++){
            try {
                C3poUtils.getPreparedStatement("select * from sys_user").executeQuery();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        System.out.println(UrlUtils.getForString("https://vps.wiwikiky.top/ours/song?key=%E5%8C%97%E4%BA%AC%E6%AC%A2%E8%BF%8E%E4%BD%A0"));
    }
}
