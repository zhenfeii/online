package com.wyu.online.utils;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URL;

/**
 * 自定义 网络访问 工具
 * Created by Administrator on  2018/8/13
 */
public class UrlUtils {


    /**
     * 根据地址返回字符串
     * @param url
     * @return
     */
    public static String getForString(String url){
        /**
         * 使用代理，证书出错
         */
        /*System.setProperty("http.proxyHost", "127.0.0.1");
        System.setProperty("https.proxyHost", "127.0.0.1");
        System.setProperty("http.proxyPort", "9999");
        System.setProperty("https.proxyPort", "9999");*/
        try {
            URL u = new URL(url);
            InputStream in = u.openStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            try {
                byte buf[] = new byte[1024];
                int read = 0;
                while ((read = in .read(buf)) > 0) {
                    out.write(buf, 0, read);
                }
            } finally {
                if ( in != null) {
                    in .close();
                }
            }
            byte b[] = out.toByteArray();
            return  new String(b, "utf-8");
        }catch (Exception e){
//            logger.error("访问失败：" + url, ";错误信息：" + e.getMessage());
            System.out.println("访问失败：" + url + ";错误信息：" + e.getMessage());
            return null;
        }
    }

    public static void main(String[] args) {
        String res = getForString("http://192.168.1.206/fengche/oabs.php/ServiceTag/get_service_category_list");
        System.out.println();
    }
}
