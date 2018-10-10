package com.wyu.online.base;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

/**
 *
 * Created by Administrator on  2018/7/16
 */
public class BaseContext extends ServerEndpointConfig.Configurator {

    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
        HttpSession httpSession = (HttpSession) request.getHttpSession();
        ServletContext servletContext =  httpSession.getServletContext();

        sec.getUserProperties().put(HttpSession.class.getName(),httpSession);
        sec.getUserProperties().put(ServletContext.class.getName(),servletContext);
    }
}
